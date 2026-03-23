CREATE OR REPLACE PACKAGE RIS.R_GEN_CV_ITEM IS
PROCEDURE SP_GEN_CEH (pin_from NUMBER, pin_to NUMBER);
PROCEDURE SP_GEN_CJH (pin_from NUMBER, pin_to NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY RIS.R_GEN_CV_ITEM IS
PROCEDURE SP_GEN_CEH (pin_from NUMBER, pin_to NUMBER) IS
    tofi 			NUMBER;
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
	itr_null		NUMBER;
	v_cnt			NUMBER;
	v_module		VARCHAR(128);
	v_operation		VARCHAR(128);
	v_status		VARCHAR(128);
    CURSOR wrcv_c1 IS
        SELECT 
				wr.PIN, 
				cv.ID_CV, 
				wr.ID_TOFI,
				wr.DOB
			FROM 
				R_WORKER wr 
				JOIN R_CV cv ON wr.PIN=cv.PIN
			WHERE 
				wr.PIN BETWEEN pin_from AND pin_to
				AND wr.STATUS = 'A'
				AND NOT EXISTS 
								(
									SELECT 
											* 
										FROM 
											RIS.R_CV_EDU_HIST ceh 
										WHERE 
											ceh.ID_CV=cv.ID_CV
								);
    wrcv_rec 		wrcv_c1%ROWTYPE;
BEGIN
	
	v_module := 'R_GEN_CV_ITEM.SP_GEN_CEH';
	v_operation := 'Start';
	v_status := null;
	R_LOG_SP(v_module, v_operation, v_status);

	v_cnt := 0;
	--- Cursor wrcv_c1 is for selecting Workers with CV where no education history has been created yet.
    FOR wrcv_rec IN wrcv_c1
    LOOP
		BEGIN
			
			itr_null := 0;
			--v_pin := wrcv_c1.PIN;
			--v_operation := 'wrcv_rec loop';
			--v_status := 'Start';
			--R_LOG_SP(v_module, v_operation, v_status);
			
			--v_operation := 'Title generation';
			--v_status := 'Start';
			--R_LOG_SP(v_module, v_operation, v_status);
			
			age := ROUND(((SYSDATE - wrcv_rec.DOB)/365.242199),1);
			
			-- SELECT TITLE AND MAX LEVEL
			SELECT 
					ID_TIT, 
					ID_EFT INTO tit_id, eft_id 
				FROM 
					GSD.G_TOFI 
				WHERE 
					ID_TOFI = wrcv_rec.ID_TOFI;
					
			SELECT 
					NAME, 
					LVL INTO title_last, lvl 
				FROM 
					GSD.G_TITLE 
				WHERE 
					ID_TIT = tit_id;

			IF lvl = 0 
				THEN
					lvl := 2;
			END IF;

			itr_tmp := lvl;
			start_year_lst := NULL;
        
			-- Loop for each level of education
			FOR itr IN 1..lvl
			LOOP
				BEGIN
					--v_operation := 'Level itr loop';
					--v_status := 'Start';
					--R_LOG_SP(v_module, v_operation, v_status);
			
					-- SELECT AGE FROM RULES
					SELECT 
							MINI, 
							MAXI INTO age_min, age_max	
						FROM 
							GSD.G_RULES rul 
							JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
						WHERE 
							NAME LIKE 'LVL%' 
							AND SUBSTR(NAME,5) = TO_CHAR(itr_tmp);
		
					-- Check if age is higher than the minimum age for graduation
					IF age > age_min THEN
        
						--v_operation := 'Generate CEH dates';
						--v_status := 'Start';
						--R_LOG_SP(v_module, v_operation, v_status);
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
									FROM 
										dual;
								--DBMS_OUTPUT.PUT_LINE('GEN_GRAD_YEAR: ' || grad_year);
						ELSE
							grad_year := start_year_lst;
						END IF;
					
						SELECT 
							ROUND(dbms_random.value(4, 6)), ROUND(dbms_random.value(1, 28)) INTO int_rnd_month, int_rnd_day
						FROM dual;
						
						-- Set graduation and education end month
						IF (int_rnd_month < 10)
							THEN
								SELECT 
										TO_CHAR('0'||int_rnd_month) INTO grad_month 
									FROM 
										dual;
								SELECT 
										TO_CHAR('0'||int_rnd_month-1) INTO end_month
									FROM 
										dual;
						ELSE
								grad_month := TO_CHAR(int_rnd_month);
								end_month := TO_CHAR(int_rnd_month-1);
						END IF;

						end_year := grad_year;
        
						-- Set graduation and education end day
						IF (int_rnd_day < 10)
							THEN
								SELECT 
										TO_CHAR('0'||int_rnd_day), TO_CHAR(int_rnd_day+ROUND(dbms_random.value(9,19),0)) INTO grad_day, end_day 
									FROM dual;
							ELSE
								grad_day := TO_CHAR(int_rnd_day);
								end_day := TO_CHAR(int_rnd_day-ROUND(dbms_random.value(1,9),0));
						END IF;
        
						SELECT 
								TO_DATE(grad_day || '.'|| grad_month ||'.'|| grad_year, 'DD.MM.YYYY'), TO_DATE(end_day  || '.'|| end_month ||'.'|| end_year, 'DD.MM.YYYY') INTO grad_date, end_date
							FROM 
								dual;
						        
						-- Generate Start Date
						SELECT
								grad_year-dur INTO start_year 
							FROM 
								dual;
				
						-- Education start month always at September
						start_month := '09';
						/*int_rnd_month := 9;
						SELECT 
							ROUND(dbms_random.value(1, 30)) INTO int_rnd_day 
						FROM dual;
		
						IF (int_rnd_month < 10)
							THEN
								SELECT TO_CHAR('0'||int_rnd_month) INTO start_month FROM dual;
							ELSE
								start_month := TO_CHAR(int_rnd_month);
						END IF;*/

						IF (int_rnd_day < 10)
							THEN
								SELECT 
										TO_CHAR('0'||int_rnd_day) INTO start_day 
									FROM 
										dual;
						ELSE
								start_day := TO_CHAR(int_rnd_day);
						END IF;

						SELECT 
								TO_DATE(start_day || '.' || start_month || '.' || start_year, 'DD.MM.YYYY') INTO start_date 
							FROM 
								dual;
					END IF;
        
					start_year_lst := start_year;
						
					
					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
					
					--v_operation := 'Generate school';
					--v_status := 'Start';
					--R_LOG_SP(v_module, v_operation, v_status);
					
					SAVEPOINT start_edu;
					-- Generate School
					SELECT 
							round(dbms_random.value(MIN(RWN), MAX(RWN)), 0) into int_rnd_posit 
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

					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
					
					--v_operation := 'Generate EFT';
					--v_status := 'Start';
					--R_LOG_SP(v_module, v_operation, v_status);
					-- Select school with education field type
					SELECT 
							EIN,
							ID_EFT INTO item_eo, item_eft  
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
					
					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
					
					-- Lower title
					-- Do while iteration counter is lower than level
					--v_operation := 'Level itr condition';
					--v_status := 'Start';
					--R_LOG_SP(v_module, v_operation, v_status);
					IF itr_tmp < lvl 
						THEN
							-- Select possible combinations
							SELECT
									MIN(RWN), 
									MAX(RWN) INTO int_rnd_min, int_rnd_max
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
										FROM 
											dual;
	
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
											MIN(RWN),
											MAX(RWN) INTO int_rnd_min, int_rnd_max
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
														eft.ID_EFT
											);
									title_last := title;
							END IF;
				END IF;
				
				--v_status := 'End';
				--R_LOG_SP(v_module, v_operation, v_status);
				itr_tmp := itr_tmp - 1;
				
					--v_operation := 'Level itr loop';
					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
			
			
					--v_operation := 'CEH insert';
					--v_status := 'Start';
					--R_LOG_SP(v_module, v_operation, v_status);
				--PROCEDURE SP_CV_EDU_HIST        (i_cv NUMBER, i_ein NUMBER, i_eft NUMBER, i_tit NUMBER, i_start DATE, i_end DATE, i_grad DATE);
				R_INS_RIS_PCK.SP_CV_EDU_HIST(
					i_cv => wrcv_rec.ID_CV , 
					i_ein => item_eo, 
					i_eft => item_eft,
					i_tit => item_tit, 
					i_start => start_date, 
					i_end => end_date, 
					i_grad => grad_date);
					
				v_cnt := v_cnt + 1;
					
					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
		EXCEPTION 
            WHEN NO_DATA_FOUND THEN
			
                itr_null := itr_null + 1;
							
							IF itr_null <= 3
								THEN
									ROLLBACK TO start_edu;
								ELSE
									UPDATE R_WORKER SET STATUS = 'D' WHERE PIN = wrcv_rec.PIN;
									COMMIT;
									v_operation := 'End';
									v_status := 'No data found' ;
									R_LOG_SP(v_module, v_operation, v_status);
									EXIT;
								END IF;
        END;
					--v_operation := 'Level itr loop';
					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
			END LOOP;
			COMMIT;
        EXCEPTION
			WHEN NO_DATA_FOUND
				THEN
				EXIT;
		END;
    END LOOP;	
	v_operation := 'End';
	v_status := 'Rows: ' || v_cnt ;
	R_LOG_SP(v_module, v_operation, v_status);
END;
PROCEDURE SP_GEN_CJH (pin_from NUMBER, pin_to NUMBER) IS
    tofi 			NUMBER;
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
    int_rnd_year    NUMBER;
    int_rnd_month   NUMBER;
    int_rnd_day     NUMBER;
    int_rnd_min 	NUMBER;
    int_rnd_max 	NUMBER;
    int_rnd_posit   NUMBER;
    rul_id 			NUMBER;
    rul_iter 		VARCHAR(10);
    --item_cin        NUMBER;
    --item_ji         NUMBER;
    --item_jp         NUMBER;
	itr_tmp			NUMBER;
	itr_null		NUMBER;
	v_cnt			NUMBER;
    company         VARCHAR(300);
	v_module		VARCHAR(128);
	v_operation		VARCHAR(128);
	v_status		VARCHAR(128);
	sqlrwcnt		NUMBER;
    CURSOR wrcv_c1 IS
        SELECT 
				wr.PIN, 
				cv.ID_CV, 
				wr.ID_TOFI, 
				wr.DOB
			FROM 
				R_WORKER wr 
				JOIN R_CV cv ON wr.PIN=cv.PIN
			WHERE 
				wr.PIN BETWEEN pin_from AND pin_to
				AND wr.STATUS = 'A'
				AND NOT EXISTS 
								(
									SELECT 
											* 
										FROM 
											RIS.R_CV_JOB_HIST cjh 
										WHERE 
											cjh.ID_CV=cv.ID_CV
								);
								
    wrcv_rec 		wrcv_c1%ROWTYPE;
	CURSOR wrtofi_c1 (i_id_tofi NUMBER) IS
		SELECT
				cbt.ID_JP
				,cbt.ID_JI
				,cbt.CIN
				,ROW_NUMBER() OVER (ORDER BY CIN) RWN
			FROM
				R_FIND_COMPANY_BY_TOFI_MV cbt
				JOIN GSD.G_TOFI tf ON cbt.ID_JP = tf.ID_JP
			WHERE
				tf.ID_TOFI=i_id_tofi;
	TYPE wrtofi_type IS TABLE OF wrtofi_c1%ROWTYPE;
	wrtofi_col		wrtofi_type;
	v_tofi_min		NUMBER;
	v_tofi_max		NUMBER;
	v_tofi_rnd		NUMBER;
	v_tofi_ind		wrtofi_c1%ROWTYPE;
    unique_violated     EXCEPTION;
    PRAGMA EXCEPTION_INIT(unique_violated, -02290);
BEGIN
	
	v_module := 'R_GEN_CV_ITEM.SP_GEN_CJH';
	v_operation := 'Start';
	v_status := null;
	R_LOG_SP(v_module, v_operation, v_status);
	
	v_cnt := 0;
	
    FOR wrcv_rec IN wrcv_c1
    LOOP   
		BEGIN
				--v_operation := 'wrcv_rec';
				--v_status := 'Start';
				--R_LOG_SP(v_module, v_operation, v_status);
			DBMS_OUTPUT.PUT_LINE('############################################################################');				
			SAVEPOINT start_gen;
			<<CJH_START>>
			itr_null := 0;
			--v_pin := wrcv_rec.PIN;
			--v_operation := 'wrcv_rec';
			--v_status := 'Start';
			--R_LOG_SP(v_module, v_operation, v_status);
			
			--v_operation := 'Set dates based on DOB';
			--v_status := 'Start';
			--R_LOG_SP(v_module, v_operation, v_status);
			
			--DBMS_OUTPUT.PUT_LINE('int_rnd_posit 0 - itr_null = ');
			
			age := ROUND(((SYSDATE - wrcv_rec.DOB)/365.242199),1);
			SELECT 
					rul.ID_RUL INTO rul_id
				FROM 
					GSD.G_RULES rul 
					JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
				WHERE 
					rult.NAME like 'WH%' 
					AND age BETWEEN MINI AND MAXI
					AND rownum < 2
				ORDER BY
					rul.ID_RUL;
			
			--v_status := 'End';
			--R_LOG_SP(v_module, v_operation, v_status);
			
			SELECT 
					TO_CHAR(SUBSTR(rult.NAME,4)) INTO rul_iter 
				FROM  
					GSD.G_RULES rul 
					JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
				WHERE 
					rul.ID_RUL = rul_id
				;
			
			-- Load TOFI template into collection
			OPEN wrtofi_c1 (wrcv_rec.ID_TOFI);
			FETCH wrtofi_c1 BULK COLLECT INTO wrtofi_col;
			CLOSE wrtofi_c1;

			sqlrwcnt := wrtofi_col.COUNT;

			--DBMS_OUTPUT.PUT_LINE('WRTOFI_C1 COUNT: ' || sqlrwcnt);

			-- Verify existence of TOFI templates
			IF (sqlrwcnt=0) 
						THEN
							DBMS_OUTPUT.PUT_LINE('sqlrowcount=0');
							UPDATE R_WORKER SET STATUS = 'D' WHERE PIN = wrcv_rec.PIN;
							--RETURN;
							CONTINUE;
					END IF;

			itr_tmp := rul_iter;
			start_year_lst := NULL;
			
			FOR itr IN 1..rul_iter
			LOOP
				BEGIN
					--v_operation := 'Iteration loop';
					--v_status := 'Start';
					--R_LOG_SP(v_module, v_operation, v_status);
					
					
					
					-- SELECT AGE FROM RULES
					SELECT 
							MINI, 
							MAXI INTO age_min, age_max
						FROM 
							GSD.G_RULES rul 
							JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
						WHERE 
							NAME LIKE 'WH%'
							AND SUBSTR(NAME,4) = TO_CHAR(itr_tmp)
						;
					
					IF age > age_min
						THEN
							--v_operation := 'Generate dates';
							--v_status := 'Start';
							--R_LOG_SP(v_module, v_operation, v_status);
							
							-- Generate End Date
							IF start_year_lst IS NULL
								THEN
									SELECT 
											EXTRACT(YEAR FROM wrcv_rec.DOB)+ROUND(dbms_random.value(age_min+2, age_max)) INTO end_year 
										FROM 
											dual;
								ELSE
									end_year := start_year_lst;
							END IF;
										--v_operation := 'Select random age for work';
										--v_status := end_year;
										--R_LOG_SP(v_module, v_operation, v_status);
								
							IF end_year <= 2026
								THEN
									--v_operation := 'IF end_year < 2026';
									--v_status := end_month;
									--R_LOG_SP(v_module, v_operation, v_status);
									IF start_month_lst IS NULL
										THEN
											SELECT 
													ROUND(dbms_random.value(1, 12)) INTO int_rnd_month 
												FROM 
													dual;
										ELSE
											int_rnd_month := start_month_lst - 1;
											IF int_rnd_month = 0
												THEN
													int_rnd_month := 12;
											END IF;
									END IF;
									
									SELECT
											ROUND(dbms_random.value(1, 30)) INTO int_rnd_day
										FROM 
											dual;
									
									IF (int_rnd_month < 10)
										THEN
											SELECT 
													TO_CHAR('0'||int_rnd_month) INTO end_month 
												FROM 
													dual;
										ELSE
											end_month := TO_CHAR(int_rnd_month);
									END IF;
							
									SELECT 
											TO_CHAR(LAST_DAY(TO_DATE('01.'|| end_month || '.' || end_year ||'', 'DD.MM.YYYY')), 'DD') INTO end_day
										FROM 
											dual;  
									
									--v_operation := 'Check end date';
									--v_status := end_month || ' check';
									--R_LOG_SP(v_module, v_operation, v_status);
									SELECT 
											TO_DATE(end_day  || '.'|| end_month ||'.'|| end_year, 'DD.MM.YYYY') INTO end_date 
										FROM 
											dual;
								ELSE

									end_date := NULL;
									--v_operation := 'Check end date else';
									--v_status := TO_CHAR(end_date,'DD.MM.YYYY') ||' check';
									--R_LOG_SP(v_module, v_operation, v_status);
							END IF;   

							-- Generate Start Date
							SELECT 
									EXTRACT(YEAR FROM wrcv_rec.DOB)+ROUND(dbms_random.value(age_min, age_max-3)) INTO start_year 
								FROM 
									dual;
								
							IF start_year >= 2026
								THEN
									start_year := start_year-((start_year-2026)+1);
							END IF;                            
				
								SELECT 
										ROUND(dbms_random.value(1, 12)), ROUND(dbms_random.value(1, 30)) INTO int_rnd_month, int_rnd_day 
									FROM 
										dual;
			
							IF (int_rnd_month < 10)
								THEN
									SELECT 
											TO_CHAR('0'||int_rnd_month) INTO start_month 
										FROM 
											dual;
								ELSE
									start_month := TO_CHAR(int_rnd_month);
							END IF;
							
							start_day := TO_CHAR('01');
									
							start_month_lst := int_rnd_month;
									
							SELECT 
									TO_DATE(start_day  || '.'|| start_month ||'.'|| start_year, 'DD.MM.YYYY') INTO start_date 
								FROM 
									dual;
						
							IF end_date < start_date
								THEN
									end_date := start_date;
									SELECT 
											TO_DATE(start_day  || '.'|| start_month ||'.'|| start_year, 'DD.MM.YYYY') INTO end_date 
										FROM 
											dual;
							END IF;
	
						--v_operation := 'Generate dates';
						--v_status := 'End';
						--R_LOG_SP(v_module, v_operation, v_status);
					END IF;
				
						--v_operation := 'Generate work';
						--v_status := 'Start';
						--R_LOG_SP(v_module, v_operation, v_status);
						-- Generate Work
					int_rnd_posit := 0;
					SAVEPOINT start_work;
					itr_null := itr_null + 1;
					
					/*WITH cbt AS 
						(		
							SELECT
									ID_JP
									,ID_JI
									,CIN
									,ROW_NUMBER() OVER (ORDER BY CIN) RWN
								FROM
									(
										SELECT
												cbt.ID_JP
												,cbt.ID_JI
												,cbt.CIN
												,RWN
											FROM
												TABLE(wrtofi_col)
										)
        
						)
							SELECT
									
									ID_JI
									,ID_JP
									,CIN INTO item_ji, item_jp, item_cin
								FROM
									cbt						
								WHERE 
									RWN  = 
											(
												SELECT 
														round(dbms_random.value(MIN(RWN), MAX(RWN)), 0)
													FROM cbt 
											);
											
					sqlrwcnt := SQL%ROWCOUNT;
					*/
					--v_operation := 'Random posit';
					--v_status := int_rnd_posit;
					--R_LOG_SP(v_module, v_operation, v_status);
						
					/*IF (sqlrwcnt=0) 
						THEN
							--DBMS_OUTPUT.PUT_LINE('sqlrowcount=0');
							UPDATE R_WORKER SET STATUS = 'D' WHERE PIN = wrcv_rec.PIN;
							RETURN;
					END IF;
					*/
							
					--v_operation := 'Gen Work #2';
					--v_status := null;
					--R_LOG_SP(v_module, v_operation, v_status);

					IF wrtofi_col.COUNT > 0
						THEN
							v_tofi_min := wrtofi_col(1).RWN;
							v_tofi_max := wrtofi_col(wrtofi_col.COUNT).RWN;
							DBMS_OUTPUT.PUT_LINE('Check TOFI min, max: ' || v_tofi_min || ' ' || v_tofi_max);
							FOR v_cnt IN 1..wrtofi_col.COUNT
								LOOP
									IF wrtofi_col(v_cnt).RWN < v_tofi_min 
										THEN 
											v_tofi_min := wrtofi_col(v_cnt).RWN;
									END IF;
									IF wrtofi_col(v_cnt).RWN > v_tofi_max
										THEN
											v_tofi_max := wrtofi_col(v_cnt).RWN;
									END IF;
								END LOOP;

							v_tofi_rnd	:= TRUNC(DBMS_RANDOM.VALUE(v_tofi_min, v_tofi_max));
							DBMS_OUTPUT.PUT_LINE('Check TOFI rnd: ' || v_tofi_rnd);
							v_tofi_ind 	:= wrtofi_col(v_tofi_rnd);
							DBMS_OUTPUT.PUT_LINE('Check wrtofi_col' || wrtofi_col(v_tofi_rnd).ID_JP);
					END IF;
					
					IF end_date IS NOT NULL
						THEN
							SELECT 
									trunc(end_date) - start_date into dur 
								FROM 
									dual;
						ELSE
							SELECT 
									trunc(sysdate) - start_date into dur 
								from dual;
					END IF;
													
					itr_tmp := itr_tmp - 1;
				
					start_year_lst := start_year;
					DBMS_OUTPUT.PUT_LINE('JI : ' || wrtofi_col(v_tofi_rnd).ID_JI || ' JP: ' || wrtofi_col(v_tofi_rnd).ID_JP || ' CIN: ' || wrtofi_col(v_tofi_rnd).CIN);
					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
					
					--v_operation := 'CJH insert';
					--v_status := 'Start';
					--R_LOG_SP(v_module, v_operation, v_status);
				-- PROCEDURE SP_CV_JOB_HIST        (i_cv NUMBER, i_cin NUMBER, i_jt NUMBER, i_jp NUMBER, i_start DATE, i_end DATE);
					R_INS_RIS_PCK.SP_CV_JOB_HIST(
						i_cv => wrcv_rec.ID_CV,
						i_cin => wrtofi_col(v_tofi_rnd).CIN,
						i_jt => 1,
						i_jp => wrtofi_col(v_tofi_rnd).ID_JP,
						i_start => start_date,
						i_end => end_date
						);
					v_cnt := v_cnt + 1;
					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
				EXCEPTION 
					WHEN NO_DATA_FOUND 
						THEN
							--v_operation := 'No data found';
							--v_status := 'Start';
							--R_LOG_SP(v_module, v_operation, v_status);
							--itr_null := itr_null + 1;
							DBMS_OUTPUT.PUT_LINE('No data found - itr_null ');
							DBMS_OUTPUT.PUT_LINE('Chyba na řádku: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
							--IF itr_null <= 3
								--THEN
									--ROLLBACK TO start_work;
								--ELSE
									UPDATE R_WORKER SET STATUS = 'D' WHERE PIN = wrcv_rec.PIN;
									COMMIT;
								--END IF;
								
							--v_status := 'End';
							--R_LOG_SP(v_module, v_operation, v_status);
							--GOTO CJH_START;
					WHEN DUP_VAL_ON_INDEX 
						THEN	
							--v_operation := 'Duplicated value on index';
							--v_status := 'Start';
							--R_LOG_SP(v_module, v_operation, v_status);
							ROLLBACK TO start_gen;
							
							--v_status := 'End';
							--R_LOG_SP(v_module, v_operation, v_status);
				END;
					--v_operation := 'Iteration loop';
					--v_status := 'End';
					--R_LOG_SP(v_module, v_operation, v_status);
			END LOOP;
		COMMIT;
    EXCEPTION
		WHEN UNIQUE_VIOLATED 
			THEN
				ROLLBACK TO start_work;
    END;
    END LOOP;
	v_operation := 'End';
	v_status := 'Rows: ' || v_cnt ;
	R_LOG_SP(v_module, v_operation, v_status);
END;
END;
/