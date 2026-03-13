CREATE OR REPLACE PACKAGE RIS.R_GEN_CV_ITEM IS
PROCEDURE SP_GEN_CEH (pin_from NUMBER, pin_to NUMBER);
PROCEDURE SP_GEN_CJH (pin_from NUMBER, pin_to NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY RIS.R_GEN_CV_ITEM IS
PROCEDURE SP_GEN_CEH (pin_from NUMBER, pin_to NUMBER) IS
    pin 			NUMBER;
    tofi 			NUMBER;
    id_cv 			NUMBER;
    age 			NUMBER;
	age_min 		NUMBER;
	age_max 		NUMBER;
	grad_day        VARCHAR(2);
    grad_month      VARCHAR(2);
	grad_year		NUMBER;
    grad_date       DATE;
	start_day		VARCHAR(2);
	start_month		VARCHAR(2);
	start_year		NUMBER;
	start_date		DATE;
    start_year_lst    NUMBER;
	end_day			VARCHAR(2);
	end_month		VARCHAR(2);
	end_year		NUMBER;
	end_date		DATE;
    tit_id 			NUMBER;
    eft_id 			NUMBER;
    title 			VARCHAR(20);
    title_last      VARCHAR(20);
    dur             NUMBER;
	int_rnd_leng    NUMBER;
    int_rnd_year    NUMBER;
    int_rnd_month   NUMBER;
    int_rnd_day     NUMBER;
    int_rnd_min 	NUMBER;
    int_rnd_max 	NUMBER;
    int_rnd_posit   NUMBER;
    rul_id 			NUMBER;
    rul_iter 		VARCHAR(10);
    eoi 			NUMBER;
    item_eo 		NUMBER;
	item_tit		NUMBER;
	item_eft		NUMBER;
    eft_tmp         NUMBER;
    lvl 			NUMBER;
	itr				NUMBER;
	itr_tmp			NUMBER;
    skola           VARCHAR(200);
	v_module		VARCHAR(128);
	v_operation		VARCHAR(128);
	v_status		VARCHAR(128);
    CURSOR wrcv_c1 IS
        SELECT 
            wr.PIN, cv.ID_CV, wr.ID_TOFI, wr.DOB
        FROM 
            R_WORKER wr 
            JOIN R_CV cv ON wr.PIN=cv.PIN
        WHERE 
            wr.PIN BETWEEN pin_from AND pin_to
            AND NOT EXISTS (SELECT 
                                * 
                            FROM 
                                RIS.R_CV_EDU_HIST ceh 
                            WHERE 
                                ceh.ID_CV=cv.ID_CV);
    wrcv_rec 		wrcv_c1%ROWTYPE;
BEGIN
	
	v_module := 'R_GEN_CV_ITEM.SP_GEN_CEH';
	v_operation := 'Start';
	v_status := null;
	R_LOG_SP(v_module, v_operation, v_status);

	--- Cursor wrcv_c1 is for selecting Workers with CV where no education history has been created yet.
    FOR wrcv_rec IN wrcv_c1
    LOOP
		BEGIN
			v_operation := 'wrcv_rec loop';
			v_status := 'Start';
			R_LOG_SP(v_module, v_operation, v_status);
			
			v_operation := 'Title generation';
			v_status := 'Start';
			R_LOG_SP(v_module, v_operation, v_status);
			
			age := ROUND(((SYSDATE - wrcv_rec.DOB)/365.242199),1);
			
			-- SELECT TITLE AND MAX LEVEL
			SELECT ID_TIT, ID_EFT INTO tit_id, eft_id FROM GSD.G_TOFI WHERE ID_TOFI = wrcv_rec.ID_TOFI;
			SELECT NAME, LVL INTO title_last, lvl FROM GSD.G_TITLE WHERE ID_TIT = tit_id;

			IF lvl = 0 THEN
				lvl := 2;
			END IF;

			itr_tmp := lvl;
			start_year_lst := NULL;
        
			-- Loop for each level of education
			FOR itr IN 1..lvl
			LOOP
				BEGIN
					v_operation := 'Level itr loop';
					v_status := 'Start';
					R_LOG_SP(v_module, v_operation, v_status);
			
					-- SELECT AGE FROM RULES
					SELECT 
						MINI, MAXI INTO age_min, age_max	
					FROM 
						GSD.G_RULES rul 
						JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
					WHERE 
						NAME LIKE 'LVL%' 
						AND SUBSTR(NAME,5) = TO_CHAR(itr_tmp);
		
					-- Check if age is higher than the minimum age for graduation
					IF age > age_min THEN
        
						v_operation := 'Generate CEH dates';
						v_status := 'Start';
						R_LOG_SP(v_module, v_operation, v_status);
						-- Select duration for title
						SELECT
							MINI INTO dur
						FROM 
							GSD.G_RULES rul 
							JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
						WHERE
							NAME LIKE 'DUR_LVL%' 
							AND SUBSTR(NAME,9) = TO_CHAR(itr_tmp);
						--DBMS_OUTPUT.PUT_LINE('DURATION :' || dur);
				
						-- Generate End and Graduate Date
						IF start_year_lst IS NULL
							THEN
								SELECT 
									EXTRACT(YEAR FROM wrcv_rec.DOB)+ROUND(dbms_random.value(age_min, age_max)) INTO grad_year 
								FROM dual;
								--DBMS_OUTPUT.PUT_LINE('GEN_GRAD_YEAR: ' || grad_year);
						ELSE
							grad_year := start_year_lst;
						END IF;
					
						SELECT 
							ROUND(dbms_random.value(4, 6)) INTO int_rnd_month 
						FROM dual;
						SELECT 
							ROUND(dbms_random.value(1, 28)) INTO int_rnd_day 
						FROM dual;
		
						-- Set graduation and education end month
						IF (int_rnd_month < 10)
							THEN
								SELECT 
									TO_CHAR('0'||int_rnd_month) INTO grad_month 
								FROM dual;
								SELECT 
									TO_CHAR('0'||int_rnd_month-1) INTO end_month
								FROM dual;
						ELSE
								grad_month := TO_CHAR(int_rnd_month);
								end_month := TO_CHAR(int_rnd_month-1);
						END IF;

						end_year := grad_year;
        
						-- Set graduation and education end day
						IF (int_rnd_day < 10)
							THEN
								SELECT 
									TO_CHAR('0'||int_rnd_day) INTO grad_day
								FROM dual;
								SELECT 
									TO_CHAR(int_rnd_day+ROUND(dbms_random.value(9,19),0)) INTO end_day
								FROM dual;
							ELSE
								grad_day := TO_CHAR(int_rnd_day);
								end_day := TO_CHAR(int_rnd_day-ROUND(dbms_random.value(1,9),0));
						END IF;
        
						SELECT 
							TO_DATE(grad_day || '.'|| grad_month ||'.'|| grad_year, 'DD.MM.YYYY') INTO grad_date 
						FROM dual;
						SELECT 
							TO_DATE(end_day  || '.'|| end_month ||'.'|| end_year, 'DD.MM.YYYY') INTO end_date 
						FROM dual;
        
						-- Generate Start Date
						SELECT
							grad_year-dur INTO start_year 
						FROM dual;
				
						-- Education start month always at September
						int_rnd_month := 9;
						SELECT 
							ROUND(dbms_random.value(1, 30)) INTO int_rnd_day 
						FROM dual;
		
						IF (int_rnd_month < 10)
							THEN
								SELECT TO_CHAR('0'||int_rnd_month) INTO start_month FROM dual;
							ELSE
								start_month := TO_CHAR(int_rnd_month);
						END IF;

						IF (int_rnd_day < 10)
							THEN
								SELECT TO_CHAR('0'||int_rnd_day) INTO start_day FROM dual;
						ELSE
								start_day := TO_CHAR(int_rnd_day);
						END IF;

						SELECT TO_DATE(start_day || '.' || start_month || '.' || start_year, 'DD.MM.YYYY') INTO start_date FROM dual;
					END IF;
        
					start_year_lst := start_year;
						
					
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
					
					v_operation := 'Generate school';
					v_status := 'Start';
					R_LOG_SP(v_module, v_operation, v_status);
					-- Generate School
					SELECT 
						MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max 
					FROM
						(
						SELECT 
							eo.EIN,
							eof.ID_EFT,
							ROW_NUMBER() OVER (ORDER BY eo.EIN) RWN
						FROM
							GSD.G_EDU_TYPES eo
							JOIN GSD.G_EDU_ORG_TYPE eot ON eo.ID_EOT=eot.ID_EOT
							JOIN GSD.G_TOFI tf ON tf.ID_EOT=eo.ID_EOT
							JOIN GSD.G_EDU_ORG_FIELD eof ON eo.EIN=eof.EIN
							JOIN RIS.R_EDU_ORG reo ON reo.EIN=eo.EIN
						WHERE 
							eot.MAX_LVL = itr_tmp 
							AND eof.ID_EFT=eft_id
							AND (TO_CHAR(reo.DOE, 'YYYY_MM_DD') <= grad_day OR reo.DOE IS NULL)
						ORDER BY 
							eo.EIN
						);
			
					-- If no school is found, exit
					IF (SQL%ROWCOUNT = 0) 
						THEN
							EXIT;
					END IF;
			
					SELECT 
						round(dbms_random.value(int_rnd_min, int_rnd_max), 0) into int_rnd_posit 
					FROM dual;
					
					
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
					
					v_operation := 'Generate EFT';
					v_status := 'Start';
					R_LOG_SP(v_module, v_operation, v_status);
					-- Select school with education field type
					SELECT 
						EIN, ID_EFT INTO item_eo, item_eft  
					FROM
						(
						SELECT 
							eo.EIN,
							eof.ID_EFT,
							ROW_NUMBER() OVER (ORDER BY eo.EIN) RWN 
						FROM
							GSD.G_EDU_TYPES eo
							JOIN GSD.G_EDU_ORG_TYPE eot ON eo.ID_EOT=eot.ID_EOT
							JOIN GSD.G_TOFI tf ON tf.ID_EOT=eo.ID_EOT
							JOIN GSD.G_EDU_ORG_FIELD eof ON eo.EIN=eof.EIN
							JOIN RIS.R_EDU_ORG reo ON reo.EIN=eo.EIN
						WHERE
							eot.MAX_LVL = itr_tmp 
							AND eof.ID_EFT=eft_id
							AND (TO_CHAR(reo.DOE, 'YYYY_MM_DD') <= grad_day OR reo.DOE IS NULL)
						ORDER BY 
							eo.EIN
						)
					WHERE
						RWN = int_rnd_posit ;
					
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
					
					-- Lower title
					-- Do while iteration counter is lower than level
					v_operation := 'Level itr condition';
					v_status := 'Start';
					R_LOG_SP(v_module, v_operation, v_status);
					IF itr_tmp < lvl 
						THEN
							-- Select possible combinations
							SELECT
								MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max
							FROM 
								(
								SELECT
									VALUE2, 
									ROW_NUMBER() OVER (ORDER BY rul.ID_RUL) RWN
								FROM	
									GSD.G_RULES rul
									JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
								WHERE
									rult.NAME='TITLE_REQUESTED'
									AND rul.VALUE1=title_last
								ORDER BY
									rul.ID_RUL
								);
							-- If resultset is not null, generate random number from possibilities
							IF int_rnd_min IS NOT NULL AND int_rnd_max IS NOT NULL 
								THEN
									SELECT 
										round(dbms_random.value(int_rnd_min, int_rnd_max), 0) into int_rnd_posit 
									FROM dual;
	
									SELECT
										VALUE2 INTO title
									FROM 
										(
											SELECT 
												VALUE2, 
												ROW_NUMBER() OVER (ORDER BY rul.ID_RUL) RWN
											FROM
												GSD.G_RULES rul
												JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
											WHERE
												rult.NAME='TITLE_REQUESTED'
												AND rul.VALUE1=title_last
											ORDER BY
												rul.ID_RUL
										)
									WHERE 
										RWN = int_rnd_posit;
		
									-- Select ID Title
									SELECT 
										ID_TIT INTO item_tit 
									FROM
										GSD.G_TITLE 
									WHERE 
										NAME = title;
		
									-- Select ID of Field
									SELECT 
										MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max
									FROM 
										(
											SELECT 
												eft.NAME,
												ROW_NUMBER() OVER (ORDER BY eof.ID_EFT) RWN
											FROM
												GSD.G_EDU_ORG_FIELD eof
												JOIN GSD.G_EDU_FIELD_TYPE eft ON eof.ID_EFT=eft.ID_EFT
											WHERE
												eof.EIN=item_eo
											ORDER BY
												eft.ID_EFT);
									title_last := title;
							END IF;
				END IF;
				
				v_status := 'End';
				R_LOG_SP(v_module, v_operation, v_status);
				itr_tmp := itr_tmp - 1;
				
					v_operation := 'Level itr loop';
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
			
			
					v_operation := 'CEH insert';
					v_status := 'Start';
					R_LOG_SP(v_module, v_operation, v_status);
				--PROCEDURE SP_CV_EDU_HIST        (i_cv NUMBER, i_ein NUMBER, i_eft NUMBER, i_tit NUMBER, i_start DATE, i_end DATE, i_grad DATE);
				R_INS_RIS_PCK.SP_CV_EDU_HIST(
					i_cv => wrcv_rec.ID_CV , 
					i_ein => item_eo, 
					i_eft => item_eft,
					i_tit => item_tit, 
					i_start => start_date, 
					i_end => end_date, 
					i_grad => grad_date);
					
					
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
		EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                EXIT;
        END;
					v_operation := 'Level itr loop';
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
			END LOOP;
			COMMIT;
        EXCEPTION
			WHEN NO_DATA_FOUND
				THEN
				EXIT;
		END;
		v_operation := 'wrcv_rec loop';
		v_status := 'End';
		R_LOG_SP(v_module, v_operation, v_status);
    END LOOP;
END;
PROCEDURE SP_GEN_CJH (pin_from NUMBER, pin_to NUMBER) IS
    pin 			NUMBER;
    tofi 			NUMBER;
    id_cv 			NUMBER;
    age 			NUMBER;
	age_min 		NUMBER;
	age_max 		NUMBER;
	start_day		VARCHAR(2);
	start_month		VARCHAR(2);
	start_year		NUMBER;
	start_date		DATE;
    start_year_lst    NUMBER;
    start_month_lst     NUMBER;
	end_day			VARCHAR(2);
	end_month		VARCHAR(2);
	end_year		NUMBER;
	end_date		DATE;
    dur             NUMBER;
	int_rnd_leng    NUMBER;
    int_rnd_year    NUMBER;
    int_rnd_month   NUMBER;
    int_rnd_day     NUMBER;
    int_rnd_min 	NUMBER;
    int_rnd_max 	NUMBER;
    int_rnd_posit   NUMBER;
    rul_id 			NUMBER;
    rul_iter 		VARCHAR(10);
    item_cin        NUMBER;
    item_ji         NUMBER;
    item_jp         NUMBER;
	itr_tmp			NUMBER;
    company         VARCHAR(300);
	v_module		VARCHAR(128);
	v_operation		VARCHAR(128);
	v_status		VARCHAR(128);
	
    CURSOR wrcv_c1 IS
        SELECT 
            wr.PIN, cv.ID_CV, wr.ID_TOFI, wr.DOB
        FROM 
            R_WORKER wr 
            JOIN R_CV cv ON wr.PIN=cv.PIN
        WHERE 
            wr.PIN BETWEEN pin_from AND pin_to
            AND NOT EXISTS (SELECT 
                                * 
                            FROM 
                                RIS.R_CV_JOB_HIST cjh 
                            WHERE 
                                cjh.ID_CV=cv.ID_CV);
    wrcv_rec 		wrcv_c1%ROWTYPE;
    unique_violated     EXCEPTION;
    PRAGMA EXCEPTION_INIT(unique_violated, -02290);
BEGIN

	v_module := 'R_GEN_CV_ITEM.SP_GEN_CJH';
	v_operation := 'Start';
	v_status := null;
	R_LOG_SP(v_module, v_operation, v_status);
	
    FOR wrcv_rec IN wrcv_c1
    LOOP   
		BEGIN
				v_operation := 'wrcv_rec';
				v_status := 'Start';
				R_LOG_SP(v_module, v_operation, v_status);
				
			SAVEPOINT start_gen;
			
			v_operation := 'wrcv_rec';
			v_status := 'Start';
			R_LOG_SP(v_module, v_operation, v_status);
			
			v_operation := 'Set dates based on DOB';
			v_status := 'Start';
			R_LOG_SP(v_module, v_operation, v_status);
			
			age := ROUND(((SYSDATE - wrcv_rec.DOB)/365.242199),1);
			SELECT 
				rul.ID_RUL INTO rul_id
			FROM 
				GSD.G_RULES rul 
				JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
			WHERE 
				rult.NAME like 'WH%' 
				AND age BETWEEN MINI AND MAXI
				AND rownum < 2;
			
			v_status := 'End';
			R_LOG_SP(v_module, v_operation, v_status);
			
			SELECT 
				TO_CHAR(SUBSTR(rult.NAME,4)) INTO rul_iter 
			FROM  
				GSD.G_RULES rul 
				JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
			WHERE rul.ID_RUL = rul_id;
			
			itr_tmp := rul_iter;
			start_year_lst := NULL;
			
			FOR itr IN 1..rul_iter
			LOOP
				BEGIN
					v_operation := 'Iteration loop';
					v_status := 'Start';
					R_LOG_SP(v_module, v_operation, v_status);
					
					
					-- SELECT AGE FROM RULES
					SELECT 
						MINI, MAXI INTO age_min, age_max
					FROM 
						GSD.G_RULES rul 
						JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
					WHERE 
						NAME LIKE 'WH%'
						AND SUBSTR(NAME,4) = TO_CHAR(itr_tmp);
						
				-- DBMS_OUTPUT.PUT_LINE('AGE MIN :' || age_min || '; AGE_MAX:' || age_max);
					
					IF age > age_min
						THEN
							v_operation := 'Generate dates';
							v_status := 'Start';
							R_LOG_SP(v_module, v_operation, v_status);
							-- Generate End Date
							IF start_year_lst IS NULL
								THEN
									SELECT 
										EXTRACT(YEAR FROM wrcv_rec.DOB)+ROUND(dbms_random.value(age_min+2, age_max)) INTO end_year 
									FROM dual;
								ELSE
									end_year := start_year_lst;
							END IF;
								
							IF end_year < 2020
								THEN
					
									IF start_month_lst IS NULL
										THEN
											SELECT ROUND(dbms_random.value(1, 12)) INTO int_rnd_month FROM dual;
										ELSE
											int_rnd_month := start_month_lst - 1;
											IF int_rnd_month = 0
												THEN
													int_rnd_month := 12;
											END IF;
									END IF;
									SELECT
										ROUND(dbms_random.value(1, 30)) INTO int_rnd_day
									FROM dual;
									--DBMS_OUTPUT.PUT_LINE('MOOOOONTH: ' || int_rnd_month);
									IF (int_rnd_month < 10)
										THEN
											SELECT TO_CHAR('0'||int_rnd_month) INTO end_month FROM dual;
										ELSE
											end_month := TO_CHAR(int_rnd_month);
									END IF;
							
									SELECT 
										TO_CHAR(LAST_DAY(TO_DATE('01.'|| end_month || '.' || end_year ||'', 'DD.MM.YYYY')), 'DD') INTO end_day
									FROM dual;  
															
									SELECT 
										TO_DATE(end_day  || '.'|| end_month ||'.'|| end_year, 'DD.MM.YYYY') INTO end_date 
									FROM dual;
								ELSE
									end_date := NULL;
							END IF;            
							-- Generate Start Date
							SELECT 
								EXTRACT(YEAR FROM wrcv_rec.DOB)+ROUND(dbms_random.value(age_min, age_max-3)) INTO start_year 
							FROM dual;
								
							IF start_year >= 2020
								THEN
									start_year := start_year-((start_year-2020)+1);
							END IF;                            
				
							SELECT ROUND(dbms_random.value(1, 12)) INTO int_rnd_month FROM dual;
							SELECT ROUND(dbms_random.value(1, 30)) INTO int_rnd_day FROM dual;
			
							IF (int_rnd_month < 10)
								THEN
									SELECT TO_CHAR('0'||int_rnd_month) INTO start_month FROM dual;
								ELSE
									start_month := TO_CHAR(int_rnd_month);
							END IF;
							
							start_day := TO_CHAR('01');
									
							start_month_lst := int_rnd_month;
									
							SELECT TO_DATE(start_day  || '.'|| start_month ||'.'|| start_year, 'DD.MM.YYYY') INTO start_date FROM dual;
						
							IF end_date < start_date
								THEN
									end_date := start_date;
									SELECT TO_DATE(start_day  || '.'|| start_month ||'.'|| start_year, 'DD.MM.YYYY') INTO end_date FROM dual;
							END IF;
	
						
						v_status := 'End';
						R_LOG_SP(v_module, v_operation, v_status);
					END IF;
				
						v_operation := 'Generate work';
						v_status := 'Start';
						R_LOG_SP(v_module, v_operation, v_status);
						-- Generate Work
					SAVEPOINT start_work;
					SELECT MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max FROM
					(
						SELECT
							jp.ID_JP
							,ji.ID_JI
							,comp.CIN
							,ROW_NUMBER() OVER (ORDER BY tf.ID_TOFI) RWN
						FROM 
							GSD.G_TOFI tf
							JOIN GSD.G_JOB_POSITION jp ON tf.ID_JP=jp.ID_JP
							JOIN GSD.G_INDUSTRY_POSITION ip ON ip.ID_JP=jp.ID_JP
							JOIN GSD.G_JOB_INDUSTRY ji ON ip.ID_JI=ji.ID_JI
							JOIN GSD.G_COMPANY_INDUSTRY ci ON ji.ID_JI=ci.ID_JI
							JOIN RIS.R_COMPANY comp ON ci.CIN=comp.CIN
						WHERE
							tf.ID_TOFI=wrcv_rec.ID_TOFI
							AND (comp.DOE <= end_date OR comp.DOE IS NULL)
					);
			
					IF (SQL%ROWCOUNT = 0) 
						THEN
							EXIT;
					END IF;
				
					SELECT round(dbms_random.value(int_rnd_min, int_rnd_max), 0) into int_rnd_posit FROM dual;
					
					SELECT 
						ID_JI, ID_JP, CIN INTO item_ji, item_jp, item_cin
					FROM
						(
						SELECT
							jp.ID_JP
							,ji.ID_JI
							,comp.CIN
							,ROW_NUMBER() OVER (ORDER BY tf.ID_TOFI) RWN
						FROM 
							GSD.G_TOFI tf
							JOIN GSD.G_JOB_POSITION jp ON tf.ID_JP=jp.ID_JP
							JOIN GSD.G_INDUSTRY_POSITION ip ON ip.ID_JP=jp.ID_JP
							JOIN GSD.G_JOB_INDUSTRY ji ON ip.ID_JI=ji.ID_JI
							JOIN GSD.G_COMPANY_INDUSTRY ci ON ji.ID_JI=ci.ID_JI
							JOIN RIS.R_COMPANY comp ON ci.CIN=comp.CIN
						WHERE
							tf.ID_TOFI=wrcv_rec.ID_TOFI
							AND (comp.DOE <= end_date OR comp.DOE IS NULL)
						)
					WHERE
						RWN = int_rnd_posit;
					
					IF end_date IS NOT NULL
						THEN
							SELECT trunc(end_date) - start_date into dur FROM dual;
						ELSE
							SELECT trunc(sysdate) - start_date into dur from dual;
					END IF;
								
								
					SELECT NAME into company FROM RIS.R_COMPANY WHERE CIN=item_cin;
					
					itr_tmp := itr_tmp - 1;
				
					start_year_lst := start_year;
					
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
					
					v_operation := 'CJH insert';
					v_status := 'Start';
					R_LOG_SP(v_module, v_operation, v_status);
				-- PROCEDURE SP_CV_JOB_HIST        (i_cv NUMBER, i_cin NUMBER, i_jt NUMBER, i_jp NUMBER, i_start DATE, i_end DATE);
					R_INS_RIS_PCK.SP_CV_JOB_HIST(
						i_cv => wrcv_rec.ID_CV,
						i_cin => item_cin,
						i_jt => 1,
						i_jp => item_jp,
						i_start => start_date,
						i_end => end_date
						);
					
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
				EXCEPTION 
					WHEN NO_DATA_FOUND 
						THEN
							v_operation := 'No data found';
							v_status := 'Start';
							R_LOG_SP(v_module, v_operation, v_status);
							ROLLBACK TO start_work;
							
							v_status := 'End';
							R_LOG_SP(v_module, v_operation, v_status);
					WHEN DUP_VAL_ON_INDEX 
						THEN	
							v_operation := 'Duplicated value on index';
							v_status := 'Start';
							R_LOG_SP(v_module, v_operation, v_status);
							ROLLBACK TO start_gen;
							
							v_status := 'End';
							R_LOG_SP(v_module, v_operation, v_status);
				END;
					v_operation := 'Iteration loop';
					v_status := 'End';
					R_LOG_SP(v_module, v_operation, v_status);
			END LOOP;
			COMMIT;
    EXCEPTION
		WHEN UNIQUE_VIOLATED 
			THEN
				ROLLBACK TO start_work;
    END;
    END LOOP;
END;
END;
/