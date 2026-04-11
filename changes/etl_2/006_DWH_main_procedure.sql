CREATE OR REPLACE PROCEDURE RIS_DWH.DWH_MAIN_CEH_1_PROCEDURE (
        START_DATE IN DATE
    ) IS
    c_module        CONSTANT VARCHAR(32) := UTL_CALL_STACK.SUBPROGRAM(1)(1);
    ERRSTATUS       VARCHAR2(256);
    v_pin_from       NUMBER;
    v_pin_to         NUMBER;
    BEGIN
        SELECT MAX(PIN) INTO v_pin_from FROM RIS_DWH.WT_CV_EDU_HISTORY_1;
        IF v_pin_from IS NULL THEN
            v_pin_from := 1;
        END IF;
        v_pin_to := v_pin_from + 10000;
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => 'Extraction', STEP_IN => null, STATUS_IN => ERRSTATUS);
        WT_CEH_1_ETL_PCK.EXTRACTION(IN_START_DATE => START_DATE, PIN_FROM => v_pin_from, PIN_TO => v_pin_to);
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => 'Transformation', STEP_IN => null, STATUS_IN => ERRSTATUS);
        WT_CEH_1_ETL_PCK.TRANSFORM;
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => 'Loading', STEP_IN => null, STATUS_IN => ERRSTATUS);
        WT_CEH_1_ETL_PCK.LOADING;
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => 'Finish', STEP_IN => null, STATUS_IN => ERRSTATUS);
    EXCEPTION
    WHEN OTHERS THEN
        --MODULE_IN IN varchar,    OPERATION_IN IN varchar,    STATUS_IN IN varchar
        ERRSTATUS := SUBSTR(TRIM(SQLCODE || ' - ' || SQLERRM),1,256);
        DWH_LOG_SP(MODULE_IN => c_module, OPERATION_IN => 'Exception', STEP_IN => 'Exception', STATUS_IN => ERRSTATUS);
    END;
/
