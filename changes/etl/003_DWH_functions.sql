CREATE OR REPLACE PACKAGE RIS_DWH.DWH_UTILS IS
    c_module        CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(1);
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
END;
/