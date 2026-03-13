CREATE OR REPLACE PROCEDURE RIS.R_GENERATE (cnt IN number)IS
    i_cnt   NUMBER;
    i_tmp   NUMBER;
    i_pin   NUMBER;
	v_module		VARCHAR(128);
	v_operation		VARCHAR(128);
	v_status		VARCHAR(128);
BEGIN
		v_module := 'R_GENERATE';
		v_operation := 'Start';
		v_status := 'Number: ' || cnt;
		R_LOG_SP(v_module, v_operation, v_status);
    i_cnt := cnt;
    i_tmp := 0;
    WHILE i_tmp <= i_cnt
    LOOP
    BEGIN
		-- Generate Man Worker
        R_GEN_WR_BY_ORG_PCK.SP_WORKER(1, 'M');
		-- Get newest worker ID
        SELECT MAX(PIN) INTO i_pin FROM R_WORKER;
        R_GEN_CV.SP_GEN_CV(1, i_pin, i_pin);
        R_GEN_CV_ITEM.SP_GEN_CEH(i_pin, i_pin);
        R_GEN_CV_ITEM.SP_GEN_CJH(i_pin,i_pin);
        R_GEN_REF_SP(i_pin);
        
        i_tmp := i_tmp + 1;
        
		-- Generate Woman Worker
        R_GEN_WR_BY_ORG_PCK.SP_WORKER(1, 'F');
		-- Get newest worker ID
        SELECT MAX(PIN) INTO i_pin FROM R_WORKER;
        R_GEN_CV.SP_GEN_CV(1, i_pin, i_pin);
        R_GEN_CV_ITEM.SP_GEN_CEH(i_pin, i_pin);
        R_GEN_CV_ITEM.SP_GEN_CJH(i_pin,i_pin);
        R_GEN_REF_SP(i_pin);
        
        i_tmp := i_tmp + 1;
    EXCEPTION
    WHEN OTHERS 
		THEN
			-- Skip current worker
			CONTINUE;
    END;
    END LOOP;   
		v_operation := 'End';
		v_status := null;
		R_LOG_SP(v_module, v_operation, v_status);
END;
/

CREATE OR REPLACE PROCEDURE RIS.R_BATCH_1K IS
    i NUMBER;
BEGIN
    RIS.R_GENERATE(1000);
END;
/