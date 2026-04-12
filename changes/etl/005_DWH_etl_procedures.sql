CREATE OR REPLACE PACKAGE RIS_DWH.WT_CJH_1_ETL_PCK IS
    c_module        CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(1);
    PROCEDURE EXTRACTION (
        IN_START_DATE IN DATE,
        PIN_FROM    IN NUMBER,
        PIN_TO      IN NUMBER
    );
    PROCEDURE TRANSFORM;
    PROCEDURE LOADING;
END;
/

CREATE OR REPLACE PACKAGE BODY RIS_DWH.WT_CJH_1_ETL_PCK IS
    PROCEDURE EXTRACTION (
        IN_START_DATE IN DATE,
        PIN_FROM IN NUMBER,
        PIN_TO IN NUMBER
        ) IS
            c_operation     CONSTANT VARCHAR(128) := 'Extraction';
            v_step          VARCHAR(128);
            v_status        VARCHAR(256);
            v_cnt           NUMBER;
            CURSOR wt_cjh_1_curs (p_pin_from NUMBER, p_pin_to NUMBER, p_start_date DATE) IS
                SELECT
                        wrk.PIN,
                        wrk.NAME,
                        wrk.SURNAME,
                        jp.NAME "POSITION",
                        cjh.START_DATE,
                        cjh.END_DATE,
                        cjh.CIN,
                        cmp.NAME "COMPANY",
                        CAST('N' as CHAR(1)) "PROCESSED"
                    FROM
                        R_WORKER@RIS_SRC wrk
                        JOIN R_CV@RIS_SRC cv ON wrk.PIN = cv.PIN
                        JOIN R_CV_JOB_HIST@RIS_SRC cjh ON cv.ID_CV = cjh.ID_CV
                        JOIN G_JOB_POSITION@GSD_SRC jp ON cjh.ID_JP = jp.ID_JP
                        JOIN R_COMPANY@RIS_SRC cmp ON cjh.CIN = cmp.CIN
                    WHERE
                        wrk.PIN BETWEEN p_pin_from AND p_pin_to
                        AND cjh.START_DATE >= p_start_date
                    ORDER BY
                        wrk.PIN,
                        cjh.START_DATE;
            TYPE src_type IS TABLE OF wt_cjh_1_curs%ROWTYPE;
            src_rows src_type;
        BEGIN
            v_status := 'Start';
            v_step := '';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);

            EXECUTE IMMEDIATE 'TRUNCATE TABLE STG_WT_CV_JOB_HISTORY_1';
            v_cnt := 0;

            OPEN wt_cjh_1_curs(PIN_FROM, PIN_TO, IN_START_DATE);
            LOOP
                FETCH wt_cjh_1_curs BULK COLLECT INTO src_rows LIMIT 1000;
                EXIT WHEN src_rows.COUNT = 0;
                v_cnt := v_cnt + src_rows.COUNT;
                BEGIN
                    FORALL i IN 1..src_rows.COUNT
                        INSERT INTO STG_WT_CV_JOB_HISTORY_1 VALUES src_rows(i);
                EXCEPTION
                    WHEN OTHERS THEN
                        v_step := 'Exception';
                        v_status := SUBSTR(TRIM(SQLCODE || ' for rows: ' || SQL%BULK_EXCEPTIONS.COUNT),1,256);
                        RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
                END;
            END LOOP;
            CLOSE wt_cjh_1_curs;
            v_step := 'Forall';
            v_status := 'Rows extracted: ' || v_cnt;
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
            v_step := null;
            v_status := 'End';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
        EXCEPTION
            WHEN OTHERS THEN
                IF wt_cjh_1_curs%ISOPEN THEN CLOSE wt_cjh_1_curs; END IF;
                v_step := 'Exception';
                v_status := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
                RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
                RAISE;
        END;
    PROCEDURE TRANSFORM IS
        c_operation         CONSTANT VARCHAR2(128) := 'Transform';
        v_step          VARCHAR(128);
        v_status        VARCHAR(256);
        v_hash              VARCHAR(32);
        v_active            VARCHAR(16);
        i                   NUMBER;
        TYPE target_row IS TABLE OF STG_WT_CV_JOB_HISTORY_1_READY%ROWTYPE;
        target target_row;
        CURSOR stg_curs IS
            SELECT
                    '' ID,
                    PIN,
                    NAME,
                    SURNAME,
                    POSITION,
                    START_DATE,
                    END_DATE,
                    CIN,
                    COMPANY,
                    '' ACTIVE,
                    DWH_UTILS.DURATION(START_DATE, NVL(END_DATE, SYSDATE)) AS DURATION,
                    CAST(SUM(ROUND((MONTHS_BETWEEN(NVL(END_DATE, SYSDATE), START_DATE)/12),0)) OVER (PARTITION BY PIN ORDER BY START_DATE ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS NUMBER) as EXPERIENCE_LENGHT,
                    '' SENIORITY,
                    'N' PROCESSED
                FROM
                    STG_WT_CV_JOB_HISTORY_1
                ORDER BY
                    PIN;
        TYPE stg_type IS TABLE OF stg_curs%ROWTYPE;
        stg_rows stg_type;
        BEGIN
            EXECUTE IMMEDIATE 'TRUNCATE TABLE STG_WT_CV_JOB_HISTORY_1_READY';
            v_status := 'Start';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
            OPEN stg_curs;
            LOOP
                FETCH stg_curs BULK COLLECT INTO stg_rows LIMIT 1000;
                EXIT WHEN stg_rows.COUNT = 0;

                BEGIN
                    FORALL i IN 1..stg_rows.COUNT
                        INSERT INTO STG_WT_CV_JOB_HISTORY_1_READY
                        (ID, PIN, NAME, SURNAME, POSITION, START_DATE, END_DATE, CIN, COMPANY, ACTIVE, DURATION, EXPERIENCE_LENGHT, SENIORITY, PROCESSED)
                        VALUES(
                            (SELECT
                            DWH_UTILS.TO_MD5(stg_rows(i).PIN, stg_rows(i).START_DATE, stg_rows(i).END_DATE) FROM dual),
                            stg_rows(i).PIN,
                            stg_rows(i).NAME,
                            stg_rows(i).SURNAME,
                            stg_rows(i).POSITION,
                            stg_rows(i).START_DATE,
                            stg_rows(i).END_DATE,
                            stg_rows(i).CIN,
                            stg_rows(i).COMPANY,
                            DWH_UTILS.ACTIVE(stg_rows(i).END_DATE),
                            stg_rows(i).DURATION,
                            stg_rows(i).EXPERIENCE_LENGHT,
                            DWH_UTILS.SENIORITY(stg_rows(i).DURATION),
                            --CAST(stg_rows(i).SENIORITY AS VARCHAR(16)),
                            'N'
                        );
                EXCEPTION
                    WHEN OTHERS THEN
                        IF SQLCODE != 100 THEN
                            v_step := 'Exception';
                            v_status := SUBSTR(SQLCODE || ' for rows: ' || SQL%BULK_EXCEPTIONS.COUNT,1,128);
                            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
                            RAISE;
                        END IF;
                END;
            END LOOP;
            CLOSE stg_curs;

            v_step := null;
            v_status := 'End';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
        EXCEPTION
            WHEN OTHERS THEN
                v_step := 'Exception';
                v_status := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
                RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
        END;
    PROCEDURE LOADING IS
        c_operation     CONSTANT VARCHAR2(128) := 'Load';
        v_step          VARCHAR(128);
        v_status        VARCHAR(256);
        v_cnt           NUMBER;
        BEGIN
            v_step := null;
            v_status := 'Start';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);

            -- Deduplicate staging table - keep only latest record per ID
            DELETE FROM STG_WT_CV_JOB_HISTORY_1_READY
            WHERE ROWID NOT IN (
                SELECT MAX(ROWID)
                FROM STG_WT_CV_JOB_HISTORY_1_READY
                WHERE PROCESSED = 'N'
                GROUP BY ID
            );

            v_cnt := 0;
            -- Single bulk MERGE against staging table
            MERGE INTO WT_CV_JOB_HISTORY_1 tgt
                USING (
                    SELECT
                        ID, PIN, NAME, SURNAME, POSITION,
                        START_DATE, END_DATE, CIN, COMPANY,
                        ACTIVE, DURATION, EXPERIENCE_LENGHT, SENIORITY
                    FROM STG_WT_CV_JOB_HISTORY_1_READY
                    WHERE PROCESSED = 'N'
                ) stg
                ON (tgt.ID = stg.ID)
            WHEN MATCHED THEN
                UPDATE SET
                    tgt.PIN = stg.PIN,
                    tgt.NAME = stg.NAME,
                    tgt.SURNAME = stg.SURNAME,
                    tgt.POSITION = stg.POSITION,
                    tgt.START_DATE = stg.START_DATE,
                    tgt.END_DATE = stg.END_DATE,
                    tgt.CIN = stg.CIN,
                    tgt.COMPANY = stg.COMPANY,
                    tgt.ACTIVE = stg.ACTIVE,
                    tgt.DURATION = stg.DURATION,
                    tgt.EXPERIENCE_LENGHT = stg.EXPERIENCE_LENGHT,
                    tgt.SENIORITY = stg.SENIORITY
            WHEN NOT MATCHED THEN
                INSERT (
                    ID, PIN, NAME, SURNAME, POSITION,
                    START_DATE, END_DATE, CIN, COMPANY,
                    ACTIVE, DURATION, EXPERIENCE_LENGHT, SENIORITY
                )
                VALUES(
                    stg.ID, stg.PIN, stg.NAME, stg.SURNAME, stg.POSITION,
                    stg.START_DATE, stg.END_DATE, stg.CIN, stg.COMPANY,
                    stg.ACTIVE, stg.DURATION, stg.EXPERIENCE_LENGHT, stg.SENIORITY
                );

            -- Mark all rows as processed
            UPDATE STG_WT_CV_JOB_HISTORY_1_READY
                SET PROCESSED = 'Y'
                WHERE PROCESSED = 'N';
            COMMIT;

            SELECT COUNT(*) INTO v_cnt FROM WT_CV_JOB_HISTORY_1;
            v_step := 'Merge';
            v_status := 'Rows loaded: ' || v_cnt;
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);

            v_step := null;
            v_status := 'End';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
        EXCEPTION
            WHEN OTHERS THEN
                v_step := 'Exception';
                v_status := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
                RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
        END;
END;
/
