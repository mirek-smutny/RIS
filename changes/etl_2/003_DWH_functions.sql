CREATE OR REPLACE PACKAGE RIS_DWH.DWH_UTILS IS
    c_module        CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(1);
    TYPE t_title_map IS TABLE OF NUMBER INDEX BY VARCHAR2(128);
    t_titles t_title_map;
    FUNCTION TO_MD5(
        PIN IN NUMBER,
        START_DATE IN DATE,
        END_DATE IN DATE
    ) RETURN VARCHAR DETERMINISTIC;
    FUNCTION ACTIVE(
        END_DATE IN DATE
    ) RETURN VARCHAR DETERMINISTIC;
    FUNCTION DURATION(
        START_DATE IN DATE,
        END_DATE IN DATE
    ) RETURN NUMBER DETERMINISTIC;
    FUNCTION SENIORITY(
        YEARS IN NUMBER
    ) RETURN VARCHAR DETERMINISTIC;
    FUNCTION VERIFY_EDU_DATES(
        START_DATE IN DATE,
        END_DATE IN DATE,
        GRAD_DATE IN DATE,
        DOB_DATE IN DATE
    ) RETURN BOOLEAN DETERMINISTIC;
    FUNCTION VERIFY_TITLE(
        RAW_TITLE IN VARCHAR
    ) RETURN VARCHAR DETERMINISTIC;
    FUNCTION TITLE_PRIORITY(
        TITLE IN VARCHAR
    ) RETURN NUMBER DETERMINISTIC;
    FUNCTION CLEAN_SCHOOL_NAME(
        RAW_SCHOOL IN VARCHAR
    ) RETURN VARCHAR DETERMINISTIC;
END;
/

CREATE OR REPLACE PACKAGE BODY RIS_DWH.DWH_UTILS IS
    FUNCTION TO_MD5 (
        PIN IN NUMBER,
        START_DATE IN DATE,
        END_DATE IN DATE
    ) RETURN VARCHAR DETERMINISTIC IS
        c_operation     CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(2);
        v_md5           VARCHAR2(32);
        ERRSTATUS       VARCHAR2(128);
    BEGIN
        SELECT
                RAWTOHEX(
                STANDARD_HASH(
                NVL(CAST(PIN AS VARCHAR(64)),'N/A') || '|' || NVL(CAST(START_DATE AS VARCHAR(20)),'N/A') || '|' || NVL(CAST(END_DATE AS VARCHAR(20)),'N/A'),'MD5')) INTO v_md5
        FROM
            dual;
        RETURN v_md5;
    EXCEPTION
    WHEN OTHERS THEN
        --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN IN varchar
        ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,128);
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => c_operation, STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
    END;

    FUNCTION ACTIVE(
        END_DATE IN DATE
    ) RETURN VARCHAR DETERMINISTIC IS
        c_operation     CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(2);
        v_active        VARCHAR2(16);
        ERRSTATUS       VARCHAR2(128);
    BEGIN
        IF END_DATE IS NULL THEN
            v_active := 'Active';
        ELSE
            v_active := 'Inactive';
        END IF;
        RETURN v_active;
    EXCEPTION
    WHEN OTHERS THEN
        --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN IN varchar
        ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => c_operation, STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
    END;

    FUNCTION DURATION(
        START_DATE IN DATE,
        END_DATE IN DATE
    ) RETURN NUMBER DETERMINISTIC IS
        c_operation     CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(2);
        v_lenght      NUMBER;
        ERRSTATUS       VARCHAR2(128);
    BEGIN
        SELECT ROUND(MONTHS_BETWEEN(NVL(END_DATE, SYSDATE), START_DATE)/12,0) INTO v_lenght FROM dual;
        RETURN v_lenght;
    EXCEPTION
    WHEN OTHERS THEN
        --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN IN varchar
        ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => c_operation, STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
    END;

    FUNCTION SENIORITY(
            YEARS IN NUMBER
        ) RETURN VARCHAR DETERMINISTIC IS
        c_operation     CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(2);
        v_seniority     VARCHAR(16);
        ERRSTATUS       VARCHAR2(128);
    BEGIN
        IF YEARS <= 4 THEN
            v_seniority := 'Junior';
        ELSIF YEARS >= 7 THEN
            v_seniority := 'Senior';
        ELSE
            v_seniority := 'Medior';
        END IF;
        RETURN v_seniority;
    EXCEPTION
    WHEN OTHERS THEN
        --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN IN varchar
        ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => c_operation, STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
    END;

    FUNCTION VERIFY_EDU_DATES(
        START_DATE IN DATE,
        END_DATE IN DATE,
        GRAD_DATE IN DATE,
        DOB_DATE IN DATE
    ) RETURN BOOLEAN DETERMINISTIC IS
        c_operation     CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(2);
        v_status        BOOLEAN;
        ERRSTATUS       VARCHAR2(128);
    BEGIN
        -- Implementation for verifying education dates
        IF
            START_DATE IS NULL OR END_DATE IS NULL OR GRAD_DATE IS NULL OR DOB_DATE IS NULL
            THEN
                v_status := FALSE;  -- Invalid if any date is null
        ELSIF
            DOB_DATE > START_DATE OR START_DATE > END_DATE OR END_DATE > GRAD_DATE
            THEN
                v_status := FALSE;  -- Invalid if dates are out of order
        ELSE
            v_status := TRUE;   -- Valid if all not null and in order
        END IF;
        RETURN v_status;
    EXCEPTION
    WHEN OTHERS THEN
        --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN IN varchar
        ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => c_operation, STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
    END;

    FUNCTION VERIFY_TITLE(
            RAW_TITLE IN VARCHAR
        ) RETURN VARCHAR DETERMINISTIC IS
            c_operation     CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(2);
            v_title         VARCHAR(128);
            ERRSTATUS       VARCHAR2(128);
        BEGIN
            IF RAW_TITLE IS NOT NULL THEN
                v_title := UPPER(
                    REPLACE(
                        REPLACE(
                            (RAW_TITLE),
                             ' ', '') -- remove spaces
                    , '.', '')); -- remove dots

                IF t_titles.EXISTS(v_title) THEN
                    v_title := v_title;
                ELSE
                    v_title := 'N/A';
                END IF;
            ELSE
                v_title := 'N/A';
            END IF;
            RETURN v_title;
        EXCEPTION
        WHEN OTHERS THEN
            --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN IN varchar
            ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
            DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => c_operation, STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
            RETURN NULL;
        END;
    -- Priority function assigns a numeric value to each title for sorting purposes, higher value means higher priority
    FUNCTION TITLE_PRIORITY(
            TITLE IN VARCHAR
        ) RETURN NUMBER DETERMINISTIC IS
            c_operation     CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(2);
            v_priority      NUMBER;
            ERRSTATUS       VARCHAR2(128);
        BEGIN
            IF t_titles.EXISTS(TITLE) THEN
                v_priority := t_titles(TITLE);
            ELSE
                v_priority := 0; -- Default priority for unknown titles
            END IF;
            RETURN v_priority;
        EXCEPTION
            WHEN OTHERS THEN
            --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN IN varchar
            ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
            DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => c_operation, STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
            RETURN 0;
        END;
    FUNCTION CLEAN_SCHOOL_NAME(
        RAW_SCHOOL IN VARCHAR
        ) RETURN VARCHAR DETERMINISTIC IS
            c_operation     CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(2);
            v_clean_school  VARCHAR(256);
            ERRSTATUS       VARCHAR2(128);
        BEGIN
            IF RAW_SCHOOL IS NOT NULL THEN
                v_clean_school := UPPER(TRIM(RAW_SCHOOL));
                -- Remove company suffixes
                v_clean_school := REPLACE(v_clean_school, 'S.R.O.', '');
                v_clean_school := REPLACE(v_clean_school, 'A.S.', '');
                v_clean_school := REPLACE(v_clean_school, 'V.O.S', '');
                -- Trim again in case removal left trailing spaces
                v_clean_school := TRIM(v_clean_school);
                RETURN v_clean_school;
            ELSE
                RETURN 'N/A';
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
            --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN => ERRSTATUS);
            ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
            DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => c_operation, STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
            RETURN 'N/A';
        END;

BEGIN
        t_titles('BC') := 10;
        t_titles('ING') := 20;
        t_titles('MUDR') := 30;
        t_titles('MDDR') := 40;
        t_titles('MVDR') := 50;
        t_titles('MGR') := 60;
        t_titles('JUDR') := 70;
        t_titles('PHDR') := 80;
        t_titles('RNDR') := 90;
        t_titles('PHMR') := 100;
        t_titles('MSDR') := 110;
        t_titles('PAEDDR') := 120;
        t_titles('RCDR') := 130;
        t_titles('RTDR') := 140;
        t_titles('PHD') := 150;
        t_titles('CSC') := 160;
        t_titles('PROF') := 170;
        t_titles('DR') := 180;
        t_titles('DRHC') := 190;
        t_titles('PROFHC') := 200;
        t_titles('DOC') := 210;
        t_titles('AS') := 220;
        t_titles('ODBAS') := 230;
        t_titles('DIS') := 240;
        t_titles('N/A') := 0;
END;
/