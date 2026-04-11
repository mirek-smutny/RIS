CREATE OR REPLACE PACKAGE RIS_DWH.WT_CEH_1_ETL_PCK IS
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

CREATE OR REPLACE PACKAGE BODY RIS_DWH.WT_CEH_1_ETL_PCK IS
    PROCEDURE EXTRACTION (
        IN_START_DATE IN DATE,
        PIN_FROM IN NUMBER,
        PIN_TO IN NUMBER
        ) IS
            c_operation     CONSTANT VARCHAR(128) := 'Extraction';
            c_verify_table  CONSTANT VARCHAR(32) := 'R_CV_EDU_HIST';
            c_verify_col    CONSTANT VARCHAR(32) := 'ID_CEH';
            v_invalid_date  CHAR(1);
            v_step          VARCHAR(128);
            v_status        VARCHAR(256);
            v_cnt           NUMBER;
            CURSOR wt_ceh_1_curs (p_pin_from NUMBER, p_pin_to NUMBER, p_start_date DATE) IS
                SELECT
                        wrk.PIN,
                        wrk.NAME,
                        wrk.SURNAME,
                        wrk.DOB,
                        ceh.EIN,
                        ceh.ID_CEH,
                        eo.NAME "SCHOOL",
                        eft.NAME "EDU_FIELD",
                        tit.NAME "TITLE",
                        ceh.START_DATE,
                        ceh.END_DATE,
                        ceh.GRAD_DATE,
                        CAST('N' as CHAR(1)) "PROCESSED",
                        CAST('' as CHAR(1)) "INVALID_EDU_DATES"
                    FROM
                        R_EDU_ORG@RIS_SRC eo
                        JOIN R_CV_EDU_HIST@RIS_SRC ceh ON eo.EIN = ceh.EIN
                        JOIN R_CV@RIS_SRC cv ON ceh.ID_CV = cv.ID_CV
                        JOIN R_WORKER@RIS_SRC wrk ON cv.PIN = wrk.PIN
                        JOIN GSD.G_TITLE@GSD_SRC tit ON ceh.ID_TIT = tit.ID_TIT
                        JOIN GSD.G_EDU_FIELD_TYPE@GSD_SRC eft ON ceh.ID_EFT = eft.ID_EFT
                    WHERE
                        wrk.PIN BETWEEN p_pin_from AND p_pin_to
                        AND ceh.START_DATE >= p_start_date
                    ORDER BY
                        wrk.PIN,
                        ceh.START_DATE;
            TYPE src_type IS TABLE OF wt_ceh_1_curs%ROWTYPE;
            src_rows src_type;
        BEGIN
            v_status := 'Start';
            v_step := '';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);

            EXECUTE IMMEDIATE 'TRUNCATE TABLE STG_WT_CV_EDU_HISTORY_1';
            v_cnt := 0;

            v_invalid_date := 'N';

            OPEN wt_ceh_1_curs(PIN_FROM, PIN_TO, IN_START_DATE);
            LOOP
                FETCH wt_ceh_1_curs BULK COLLECT INTO src_rows LIMIT 1000;
                EXIT WHEN src_rows.COUNT = 0;
                v_cnt := v_cnt + src_rows.COUNT;
                BEGIN
                    FOR i IN 1..src_rows.COUNT LOOP
                        -- Verify education dates
                        IF NOT DWH_UTILS.VERIFY_EDU_DATES(src_rows(i).START_DATE, src_rows(i).END_DATE, src_rows(i).GRAD_DATE, src_rows(i).DOB) THEN
                            v_invalid_date := 'Y'; -- Invalid education dates
                            RIS_DWH.DWH_ERROR_LOG_SP(
                                TABLE_NAME_IN => c_verify_table,
                                VERIFY_COL_IN => c_verify_col,
                                ROW_ID_IN => src_rows(i).ID_CEH,
                                STATUS_IN => 'Invalid education dates',
                                ERROR_MSG_IN => 'Invalid combination of education dates for ' || c_verify_col || ': ' || src_rows(i).ID_CEH
                            );
                        ELSE
                            v_invalid_date := 'N'; -- Valid dates
                        END IF;
                            INSERT INTO STG_WT_CV_EDU_HISTORY_1
                                (
                                    PIN,
                                    NAME,
                                    SURNAME,
                                    ID_CEH,
                                    EIN,
                                    SCHOOL,
                                    EDU_FIELD,
                                    TITLE,
                                    START_DATE,
                                    END_DATE,
                                    GRAD_DATE,
                                    PROCESSED,
                                    INVALID_EDU_DATES
                                )
                            VALUES
                                (
                                    src_rows(i).PIN,
                                    src_rows(i).NAME,
                                    src_rows(i).SURNAME,
                                    src_rows(i).ID_CEH,
                                    src_rows(i).EIN,
                                    src_rows(i).SCHOOL,
                                    src_rows(i).EDU_FIELD,
                                    DWH_UTILS.VERIFY_TITLE(src_rows(i).TITLE),
                                    src_rows(i).START_DATE,
                                    src_rows(i).END_DATE,
                                    src_rows(i).GRAD_DATE,
                                    src_rows(i).PROCESSED,
                                    src_rows(i).INVALID_EDU_DATES
                                );
                    END LOOP;
                    COMMIT;
                EXCEPTION
                    WHEN OTHERS THEN
                        v_step := 'Exception';
                        v_status := SUBSTR(TRIM(SQLCODE || ' for rows: ' || SQL%BULK_EXCEPTIONS.COUNT),1,256);
                        RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
                END;
            END LOOP;
            CLOSE wt_ceh_1_curs;
            v_step := 'Forall';
            v_status := 'Rows extracted: ' || v_cnt;
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
            v_step := null;
            v_status := 'End';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
        EXCEPTION
            WHEN OTHERS THEN
                IF wt_ceh_1_curs%ISOPEN THEN CLOSE wt_ceh_1_curs; END IF;
                v_step := 'Exception';
                v_status := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
                RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
                RAISE;
        END;
    PROCEDURE TRANSFORM IS
        c_operation         CONSTANT VARCHAR2(128) := 'Transform';
        v_step              VARCHAR(128);
        v_status            VARCHAR(256);
        v_hash              VARCHAR(32);
        v_active            VARCHAR(16);
        v_highest_title     VARCHAR(64) := 'N/A';
        v_title_priority    NUMBER;
        v_old_pin           NUMBER;
        i                   NUMBER;
        TYPE target_row IS TABLE OF STG_WT_CV_EDU_HISTORY_1_READY%ROWTYPE;
        target target_row;
        CURSOR stg_curs IS
            SELECT
                    '' ID,
                    PIN,
                    NAME,
                    SURNAME,
                    EIN,
                    SCHOOL,
                    EDU_FIELD,
                    TITLE,
                    START_DATE,
                    END_DATE,
                    GRAD_DATE,
                    '' ACTIVE,
                    DWH_UTILS.DURATION(START_DATE, NVL(END_DATE, SYSDATE)) AS DURATION,
                    FIRST_VALUE(TITLE) OVER (
                                                PARTITION BY PIN
                                                ORDER BY DWH_UTILS.TITLE_PRIORITY(TITLE) DESC, START_DATE DESC
                                            ) AS TITLE_HIGHEST,
                    'N' PROCESSED
                FROM
                    STG_WT_CV_EDU_HISTORY_1
                WHERE
                    PROCESSED = 'N'
                    AND INVALID_EDU_DATES = 'N' OR INVALID_EDU_DATES IS NULL
                ORDER BY
                    PIN;
        TYPE stg_type IS TABLE OF stg_curs%ROWTYPE;
        stg_rows stg_type;
        BEGIN
            EXECUTE IMMEDIATE 'TRUNCATE TABLE STG_WT_CV_EDU_HISTORY_1_READY';
            v_status := 'Start';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
            OPEN stg_curs;
            LOOP
                FETCH stg_curs BULK COLLECT INTO stg_rows LIMIT 1000;
                EXIT WHEN stg_rows.COUNT = 0;

                BEGIN
                    FOR i IN 1..stg_rows.COUNT LOOP
                        INSERT INTO STG_WT_CV_EDU_HISTORY_1_READY
                        (ID, PIN, NAME, SURNAME, EIN, SCHOOL_CLEAN_NAME, EDU_FIELD, TITLE, START_DATE, END_DATE, GRAD_DATE, ACTIVE, DURATION, TITLE_HIGHEST, PROCESSED)
                        VALUES(
                            (SELECT
                            DWH_UTILS.TO_MD5(stg_rows(i).PIN, stg_rows(i).START_DATE, stg_rows(i).END_DATE) FROM dual),
                            stg_rows(i).PIN,
                            stg_rows(i).NAME,
                            stg_rows(i).SURNAME,
                            stg_rows(i).EIN,
                            DWH_UTILS.CLEAN_SCHOOL_NAME(stg_rows(i).SCHOOL),
                            stg_rows(i).EDU_FIELD,
                            stg_rows(i).TITLE,
                            stg_rows(i).START_DATE,
                            stg_rows(i).END_DATE,
                            stg_rows(i).GRAD_DATE,
                            DWH_UTILS.ACTIVE(stg_rows(i).END_DATE),
                            stg_rows(i).DURATION,
                            stg_rows(i).TITLE_HIGHEST,
                            'N'
                        );
                        v_old_pin := stg_rows(i).PIN;

                    END LOOP;
                    COMMIT;
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
        i               NUMBER;
        v_cnt           NUMBER;
        CURSOR load_curs IS
            SELECT
                    ID,
                    PIN,
                    NAME,
                    SURNAME,
                    TITLE,
                    START_DATE,
                    END_DATE,
                    GRAD_DATE,
                    EIN,
                    SCHOOL_CLEAN_NAME AS SCHOOL,
                    EDU_FIELD,
                    ACTIVE,
                    DURATION,
                    TITLE_HIGHEST,
                    PROCESSED
                FROM
                    STG_WT_CV_EDU_HISTORY_1_READY;
        TYPE stg_type IS TABLE OF load_curs%ROWTYPE;
        stg_rows stg_type;
        TYPE target_row IS TABLE OF WT_CV_EDU_HISTORY_1%ROWTYPE;
        target target_row;
        BEGIN
            v_step := null;
            v_status := 'Start';
            RIS_DWH.DWH_LOG_SP(MODULE_IN=>c_module, OPERATION_IN=>c_operation, STEP_IN=>v_step, STATUS_IN=>v_status);
            v_cnt := 0;
            OPEN load_curs;
            LOOP
                FETCH load_curs BULK COLLECT INTO stg_rows LIMIT 5000;
                EXIT WHEN stg_rows.COUNT = 0;
                v_cnt := v_cnt + stg_rows.COUNT;
                FOR i IN 1..stg_rows.COUNT LOOP
                    MERGE INTO WT_CV_EDU_HISTORY_1 tgt
                        USING(
                            SELECT
                                stg_rows(i).ID AS ID,
                                stg_rows(i).PIN AS PIN,
                                stg_rows(i).NAME AS NAME,
                                stg_rows(i).SURNAME AS SURNAME,
                                stg_rows(i).TITLE AS TITLE,
                                stg_rows(i).START_DATE AS START_DATE,
                                stg_rows(i).END_DATE AS END_DATE,
                                stg_rows(i).GRAD_DATE AS GRAD_DATE,
                                stg_rows(i).EIN AS EIN,
                                stg_rows(i).SCHOOL AS SCHOOL,
                                stg_rows(i).EDU_FIELD AS EDU_FIELD,
                                stg_rows(i).ACTIVE AS ACTIVE,
                                stg_rows(i).DURATION AS DURATION,
                                stg_rows(i).TITLE_HIGHEST AS TITLE_HIGHEST
                            FROM dual) stg
                                ON (tgt.ID = stg.ID)
                WHEN MATCHED THEN
                    UPDATE SET
                        tgt.PIN = stg.PIN,
                        tgt.NAME = stg.NAME,
                        tgt.SURNAME = stg.SURNAME,
                        tgt.TITLE = stg.TITLE,
                        tgt.START_DATE = stg.START_DATE,
                        tgt.END_DATE = stg.END_DATE,
                        tgt.GRAD_DATE = stg.GRAD_DATE,
                        tgt.EIN = stg.EIN,
                        tgt.SCHOOL = stg.SCHOOL,
                        tgt.EDU_FIELD = stg.EDU_FIELD,
                        tgt.ACTIVE = stg.ACTIVE,
                        tgt.DURATION = stg.DURATION,
                        tgt.TITLE_HIGHEST = stg.TITLE_HIGHEST
                    WHERE
                        tgt.ID = stg.ID
                        OR tgt.PIN != stg.PIN
                        OR tgt.NAME != stg.NAME
                        OR tgt.SURNAME != stg.SURNAME
                        OR tgt.TITLE != stg.TITLE
                        OR tgt.START_DATE != stg.START_DATE
                        OR tgt.END_DATE != stg.END_DATE
                        OR tgt.GRAD_DATE != stg.GRAD_DATE
                        OR tgt.EIN != stg.EIN
                        OR tgt.SCHOOL != stg.SCHOOL
                        OR tgt.EDU_FIELD != stg.EDU_FIELD
                        OR tgt.ACTIVE != stg.ACTIVE
                        OR tgt.DURATION != stg.DURATION
                        OR tgt.TITLE_HIGHEST != stg.TITLE_HIGHEST
                WHEN NOT MATCHED THEN
                    INSERT (
                        ID,
                        PIN,
                        NAME,
                        SURNAME,
                        TITLE,
                        START_DATE,
                        END_DATE,
                        GRAD_DATE,
                        EIN,
                        SCHOOL,
                        EDU_FIELD,
                        ACTIVE,
                        DURATION,
                        TITLE_HIGHEST
                    )
                    VALUES(
                        stg_rows(i).ID,
                        stg_rows(i).PIN,
                        stg_rows(i).NAME,
                        stg_rows(i).SURNAME,
                        stg_rows(i).TITLE,
                        stg_rows(i).START_DATE,
                        stg_rows(i).END_DATE,
                        stg_rows(i).GRAD_DATE,
                        stg_rows(i).EIN,
                        stg_rows(i).SCHOOL,
                        stg_rows(i).EDU_FIELD,
                        stg_rows(i).ACTIVE,
                        stg_rows(i).DURATION,
                        stg_rows(i).TITLE_HIGHEST
                    );

                FORALL i IN 1..stg_rows.COUNT
                    UPDATE STG_WT_CV_EDU_HISTORY_1_READY
                        SET PROCESSED = 'Y'
                        WHERE ID = stg_rows(i).ID;
                COMMIT;
                END LOOP;
        END LOOP;
        CLOSE load_curs;
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
