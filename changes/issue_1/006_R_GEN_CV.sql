CREATE OR REPLACE PACKAGE RIS.R_GEN_CV IS
PROCEDURE SP_GEN_CV (cnt NUMBER, pin_from NUMBER, pin_to NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY RIS.R_GEN_CV IS
PROCEDURE SP_GEN_CV (cnt NUMBER, pin_from NUMBER, pin_to NUMBER) IS
    pin NUMBER;
    name VARCHAR(200);
    surname VARCHAR(200);
    tofi NUMBER;
    cv_name VARCHAR(512);
    cv_cnt NUMBER;
    int_rnd_min     NUMBER;
    int_rnd_max     NUMBER;
    int_rnd_posit   NUMBER;
    rul_id          NUMBER;
	v_module		VARCHAR(128);
	v_operation		VARCHAR(128);
	v_status		VARCHAR(128);
	
    CURSOR wr_c1 IS
        SELECT wr.PIN, wr.NAME, wr.SURNAME, wr.ID_TOFI FROM R_WORKER wr WHERE wr.PIN BETWEEN pin_from AND pin_to
        AND NOT EXISTS (SELECT PIN FROM R_CV WHERE PIN=wr.PIN);
    wr_rec  wr_c1%ROWTYPE;
BEGIN

	v_module := 'R_GEN_CV.SP_GEN_CV';
	v_operation := 'Start';
	v_status := 'null';
	R_LOG_SP(v_module, v_operation, v_status);
	--- Cursor wr_c1 selects R_WORKERS where no CV has been created yet.
    FOR wr_rec IN wr_c1
    LOOP
	
		v_operation := 'wr_rec loop';
		v_status := 'Start';
		R_LOG_SP(v_module, v_operation, v_status);
		
		v_operation := 'CV name generation';
		v_status := 'Start';
		R_LOG_SP(v_module, v_operation, v_status);
		
	--- Pick whole row number set for CV name rules
    SELECT MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max FROM
        (
            SELECT 
                r.ID_RUL, r.VALUE1, ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
            FROM 
                GSD.G_RULES r JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
            WHERE
                rt.NAME='CV_NAME'     
        );
    
	--- Define random value and now actually select the CV name rule
    SELECT round(dbms_random.value(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit FROM dual;
        SELECT ID_RUL INTO rul_id FROM
        (
            SELECT
                ID_RUL, ROW_NUMBER() OVER(ORDER BY r.ID_RUL) AS RWN
            FROM
                GSD.G_RULES r JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
            WHERE
                rt.NAME = 'CV_NAME'
        )
        WHERE 
            RWN=int_rnd_posit
        ;
	
	--- Prepare number of the CV and set to variable
    SELECT COUNT(*) INTO cv_cnt FROM
        R_CV WHERE PIN=wr_rec.PIN; 
        SELECT
            REPLACE(
                REPLACE(
                    REPLACE(VALUE1, '$name', wr_rec.NAME),
                '$surname', wr_rec.SURNAME),
            '$cnt', cv_cnt+1)
        INTO cv_name FROM GSD.G_RULES WHERE ID_RUL=rul_id;
	
		
		v_status := 'End';
		R_LOG_SP(v_module, v_operation, v_status);
		
    --DBMS_OUTPUT.PUT_LINE(cv_name);
    -- R_INS_CV_SP(i_pin NUMBER, i_name VARCHAR, i_created DATE, i_vis NUMBER)
	
		v_operation := 'CV insert';
		v_status := 'Start';
		R_LOG_SP(v_module, v_operation, v_status);
	-- Insert into R_CV
    R_INS_RIS_PCK.SP_CV(wr_rec.PIN, cv_name, SYSDATE, 1);
		v_status := 'End';
		R_LOG_SP(v_module, v_operation, v_status);
    END LOOP;
		v_operation := 'wr_rec loop';
		v_status := 'End';
		R_LOG_SP(v_module, v_operation, v_status);
    COMMIT;
		v_operation := 'End';
		v_status := null;
		R_LOG_SP(v_module, v_operation, v_status);
END;
END;
/
