create or replace procedure RIS.R_GEN_REF_SP(i_pin IN number) IS
    ref_text        VARCHAR(300);
    ref_pin         NUMBER;
    ref_date        DATE;
    i_mf            CHAR(1);
    i_name          VARCHAR(100);
    i_surname       VARCHAR(100);
    i_cjh           NUMBER;
    rul_id          NUMBER;
    evt_id          NUMBER;
    lst_evt_id      NUMBER;
    itr             NUMBER;
    i_cnt           NUMBER;
    int_rnd_min     NUMBER;
    int_rnd_max     NUMBER;
    int_rnd_posit   NUMBER;
    end_date1       DATE;
    start_date1     DATE;
    end_date2       DATE; 
    start_date2     DATE;
    sqlstring       VARCHAR(200);
	v_module		VARCHAR(128);
	v_operation		VARCHAR(128);
	v_status		VARCHAR(128);
    CURSOR cv_c IS
        SELECT
            cv.ID_CV
            ,cjh.ID_CJH
        FROM
            RIS.R_WORKER wr
            JOIN RIS.R_CV cv ON wr.PIN=cv.PIN
            JOIN RIS.R_CV_JOB_HIST cjh ON cv.ID_CV=cjh.ID_CV
        WHERE
            wr.PIN=i_pin
            AND NOT EXISTS (
                        SELECT 
                            cjh.ID_CJH 
                        FROM 
                            RIS.R_CV_JOB_REFERENCE cjr
                            JOIN RIS.R_CV_JOB_HIST cjh2 ON cjh2.ID_CJH=cjr.ID_CJH
                        WHERE
                            cjh2.ID_CJH=cjh.ID_CJH
                        );
    cv_rec  cv_c%ROWTYPE;
BEGIN
	v_module := 'R_GEN_REF_SP';
	v_operation := 'Start';
	v_status := null;
	R_LOG_SP(v_module, v_operation, v_status);
	
    sqlstring := 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
    EXECUTE IMMEDIATE sqlstring;
    -- RIS.R_LOG_SP(MODULE_IN IN varchar, OPERATION_IN IN varchar, STATUS_IN IN varchar)
    SELECT
        COUNT(*) INTO itr
    FROM
        RIS.R_WORKER wr
        JOIN RIS.R_CV cv ON cv.PIN=wr.PIN
        LEFT JOIN RIS.R_CV_JOB_HIST cjh ON cjh.ID_CV=cv.ID_CV
    WHERE
        wr.PIN=i_pin
        AND ROWNUM < 2
    GROUP BY
        cv.ID_CV
    ;
    
	v_operation := 'cv_rec loop';
	v_status := 'Start';
	R_LOG_SP(v_module, v_operation, v_status);
    FOR cv_rec IN cv_c
    LOOP   
		BEGIN 
			v_operation := 'Select min, max RND';
			v_status := 'Start';
			R_LOG_SP(v_module, v_operation, v_status);
			SELECT 
				MIN(RWN),
				MAX(RWN) INTO int_rnd_min, int_rnd_max
			FROM
				(
				SELECT
					ROW_NUMBER() OVER (ORDER BY cjh1.ID_CJH, cjh2.ID_CJH) RWN
				FROM
					RIS.R_CV_JOB_HIST cjh1
					JOIN RIS.R_CV_JOB_HIST cjh2 ON cjh1.CIN=cjh2.CIN AND cjh1.ID_CV<>cjh2.ID_CV
					AND 
						(
						cjh1.START_DATE BETWEEN cjh2.START_DATE AND cjh2.END_DATE
						OR (cjh1.END_DATE BETWEEN cjh2.START_DATE AND cjh2.END_DATE)
						) 
					JOIN RIS.R_CV cv1 ON cv1.ID_CV=cjh1.ID_CV
					JOIN RIS.R_CV cv2 ON cv2.ID_CV=cjh2.ID_CV
					JOIN RIS.R_WORKER wr1 ON wr1.PIN=cv1.PIN
					JOIN RIS.R_WORKER wr2 ON wr2.PIN=cv2.PIN
				WHERE
					wr1.PIN=i_pin
					AND cjh1.ID_CJH=cv_rec.ID_CJH
			);
			
			v_status := 'End';
			R_LOG_SP(v_module, v_operation, v_status);
    
			
			SELECT 
				ROUND(DBMS_RANDOM.VALUE(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit 
			FROM 
				dual;
			
			v_operation := 'Select data';
			v_status := 'Start';
			R_LOG_SP(v_module, v_operation, v_status);
			SELECT 
				ID_CJH
				,M_F
				,PIN2
				,NAME1
				,SURNAME1
				,ED1
				,ED2
			INTO
				i_cjh
				,i_mf
				,ref_pin
				,i_name
				,i_surname
				,end_date1
				,end_date2
			FROM
				(
				SELECT
					wr1.PIN PIN1
					,wr1.M_F
					,wr2.PIN PIN2
					,cjh1.ID_CV ID_CV1
					,cjh2.ID_CV ID_CV2
					,cjh1.ID_CJH
					,wr1.NAME NAME1
					,wr1.SURNAME SURNAME1
					,cjh1.START_DATE SD1
					,cjh1.END_DATE ED1
					,cjh2.START_DATE SD2
					,cjh2.END_DATE ED2
					,ROW_NUMBER() OVER (ORDER BY cjh1.ID_CJH, cjh2.ID_CJH) RWN
				FROM
					RIS.R_CV_JOB_HIST cjh1
					JOIN RIS.R_CV_JOB_HIST cjh2 ON cjh1.CIN=cjh2.CIN AND cjh1.ID_CV<>cjh2.ID_CV
						AND (
							cjh1.START_DATE BETWEEN cjh2.START_DATE AND cjh2.END_DATE
							OR (cjh1.END_DATE BETWEEN cjh2.START_DATE AND cjh2.END_DATE)
							) 
					JOIN RIS.R_CV cv1 ON cv1.ID_CV=cjh1.ID_CV
					JOIN RIS.R_CV cv2 ON cv2.ID_CV=cjh2.ID_CV
					JOIN RIS.R_WORKER wr1 ON wr1.PIN=cv1.PIN
					JOIN RIS.R_WORKER wr2 ON wr2.PIN=cv2.PIN
				WHERE
					wr1.PIN=i_pin
					AND cjh1.ID_CJH=cv_rec.ID_CJH
				)
			WHERE
				RWN=int_rnd_posit;
				
			v_status := 'End';
			R_LOG_SP(v_module, v_operation, v_status);
		-- Select mail and replace diacritic
			IF lst_evt_id IS NULL AND itr >= 5
				THEN
					SELECT 
						MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max
					FROM
						(
							SELECT
								r.ID_RUL, 
								r.VALUE1, 
								SUBSTR(rt.NAME, 13, 1) EVT, 
								ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
							FROM
								GSD.G_RULES r 
								JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
							WHERE
								rt.NAME LIKE 'REFERENCE_'|| i_mf || '%'
						)
					WHERE 
						EVT BETWEEN 5 AND 7;
				
					SELECT 
						ROUND(DBMS_RANDOM.VALUE(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit 
					FROM 
						dual;
					SELECT 
						ID_RUL INTO rul_id 
					FROM
							(
							SELECT
								r.ID_RUL,
								r.VALUE1,
								SUBSTR(rt.NAME, 13, 1) EVT, 
								ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
							FROM
								GSD.G_RULES r 
								JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
							WHERE
								rt.NAME LIKE 'REFERENCE_'|| i_mf || '%'
							)
					WHERE
						EVT BETWEEN 5 AND 7
						AND RWN=int_rnd_posit;
			
					SELECT
						SUBSTR(rult.NAME, 13, 1) INTO evt_id
					FROM
						GSD.G_RULES rul 
						JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT 
					WHERE 
						rul.ID_RUL=rul_id;
					
					lst_evt_id := evt_id;
		
			ELSIF lst_evt_id IS NULL AND itr >= 2
				THEN
					SELECT 
						MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max
					FROM
						(
							SELECT
								r.ID_RUL,
								r.VALUE1,
								SUBSTR(rt.NAME, 13, 1) EVT, 
								ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
							FROM
								GSD.G_RULES r 
								JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
							WHERE
								rt.NAME LIKE 'REFERENCE_'|| i_mf || '%' || evt_id
						)
					WHERE 
						EVT BETWEEN 2 AND 5;
				
					SELECT 
						ROUND(DBMS_RANDOM.VALUE(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit 
					FROM 
						dual;
						
					SELECT 
						ID_RUL INTO rul_id 
					FROM
						(
							SELECT
								r.ID_RUL,
								r.VALUE1, 
								SUBSTR(rt.NAME, 13, 1) EVT, 
								ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
							FROM
								GSD.G_RULES r 
								JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
							WHERE
								rt.NAME LIKE 'REFERENCE_'|| i_mf || '%' || evt_id
						)
					WHERE
						EVT BETWEEN 2 AND 5
						AND RWN=int_rnd_posit;
			
					SELECT
						SUBSTR(rult.NAME, 13, 1) INTO evt_id
					FROM
						GSD.G_RULES rul 
						JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT 
					WHERE 
						rul.ID_RUL=rul_id;
			
					lst_evt_id := evt_id;
		
			ELSE
				IF lst_evt_id > 1
					THEN 
						evt_id := lst_evt_id - 1;       
						lst_evt_id := lst_evt_id - 1;
				END IF;
			
				SELECT 
					MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max 
				FROM
					(
						SELECT
							r.ID_RUL,
							r.VALUE1, 
							ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
						FROM
							GSD.G_RULES r 
							JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
						WHERE
							rt.NAME LIKE 'REFERENCE_'|| i_mf || '%' || evt_id
					);
				
				SELECT 
					ROUND(DBMS_RANDOM.VALUE(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit 
				FROM 
					dual;
				SELECT 
					ID_RUL INTO rul_id 
				FROM
					(
						SELECT
							ID_RUL,
							ROW_NUMBER() OVER(ORDER BY r.ID_RUL) AS RWN
						FROM
							GSD.G_RULES r 
							JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
						WHERE
							rt.NAME LIKE 'REFERENCE_'|| i_mf || '%' || evt_id
					)
				WHERE
					RWN=int_rnd_posit;
			
			END IF;
	
			
			SELECT 
				REPLACE(
						REPLACE(VALUE1, '$name', i_name), 
						'$surname', 
						i_surname
						) INTO ref_text 
			FROM 
				GSD.G_RULES 
			WHERE 
				ID_RUL=rul_id;
						
			IF end_date1 < end_date2
				THEN
					ref_date := end_date1;
				ELSE
					ref_date := end_date2;
			END IF;
			-- Insert into R_WORKER
			--PROCEDURE SP_CV_JOB_REFERENCE   (i_cjh NUMBER, i_text VARCHAR, i_pin NUMBER, i_evt NUMBER, ref_date);
			R_INS_RIS_PCK.SP_CV_JOB_REFERENCE(cv_rec.ID_CJH, ref_text, ref_pin, evt_id, ref_date);
		EXCEPTION
			WHEN NO_DATA_FOUND 
				THEN
					itr := 0;
			WHEN OTHERS 	
				THEN 
					EXIT;
		END;
    END LOOP;
	v_operation := 'cv_rec loop';
	v_status := 'End';
	R_LOG_SP(v_module, v_operation, v_status);
    COMMIT;
END;
/