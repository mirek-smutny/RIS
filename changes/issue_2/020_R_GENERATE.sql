CREATE OR REPLACE PROCEDURE RIS.R_GENERATE (cnt IN number)IS
    i_cnt           NUMBER;
    i_tmp           NUMBER;
    v_old_pin       NUMBER;
    v_max_pin       NUMBER;
	v_module		VARCHAR(128);
	v_operation		VARCHAR(128);
	v_status		VARCHAR(128);
BEGIN
	v_module := 'R_GENERATE';
	v_operation := 'Start';
	v_status := 'Number: ' || cnt;
	R_LOG_SP(v_module, v_operation, v_status);

    i_cnt := cnt/2;
    i_tmp := 0;

    BEGIN
        -- Check maximal PIN
        SELECT 
                MAX(PIN) INTO v_old_pin 
            FROM 
                R_WORKER;

        -- Generate Man Worker
        R_GEN_WR_BY_ORG_PCK.SP_WORKER(i_cnt, 'M');
        -- Generate Woman Worker
        R_GEN_WR_BY_ORG_PCK.SP_WORKER(i_cnt, 'F');
	    -- Get newest worker ID
        SELECT 
                MAX(PIN) INTO v_max_pin 
            FROM 
                R_WORKER;
        R_GEN_CV.SP_GEN_CV(1, v_old_pin, v_max_pin);
        R_GEN_CV_ITEM.SP_GEN_CEH(v_old_pin, v_max_pin);
        R_GEN_CV_ITEM.SP_GEN_CJH(v_old_pin,v_max_pin);
            --R_GEN_REF_SP(i_v_old_pinpin);
            
    EXCEPTION
        WHEN OTHERS 
    		THEN
			    -- Skip current worker
			    RETURN;
    END;
	
    v_operation := 'End';
	v_status := null;
	R_LOG_SP(v_module, v_operation, v_status);
END;
/

--CREATE OR REPLACE PROCEDURE RIS.R_BATCH_1K IS
    --i NUMBER;
--BEGIN
    --RIS.R_GENERATE(1000);
--END;
--  /