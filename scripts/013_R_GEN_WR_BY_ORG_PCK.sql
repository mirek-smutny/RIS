create or replace PACKAGE   RIS.R_GEN_WR_BY_ORG_PCK IS
PROCEDURE SP_M_WORKER (i_cnt NUMBER);
PROCEDURE SP_W_WORKER (i_cnt NUMBER);
END;
/

create or replace PACKAGE BODY RIS.R_GEN_WR_BY_ORG_PCK IS
PROCEDURE SP_M_WORKER (i_cnt NUMBER) IS
        name_rnd        VARCHAR(128);
        name_v          VARCHAR(128);
        name_nodiac     VARCHAR(128);
        surname_rnd     VARCHAR(128);
        surname_v       VARCHAR(128);
        surname_nodiac  VARCHAR(128);
        diac            VARCHAR(50);
        nodiac          VARCHAR(50);
        email_gen       VARCHAR(128);
        tofi_rnd        NUMBER;
        int_tit         NUMBER;
        int_eot         NUMBER;
        int_eft         NUMBER;
        int_jp          NUMBER;
        int_lvl         NUMBER;
        int_rnd_leng    NUMBER;
        int_rnd_year    NUMBER;
        int_rnd_month   NUMBER;
        int_rnd_day     NUMBER;
        int_age         NUMBER;
        con_day         VARCHAR(2);
        con_month       VARCHAR(2);
        con_date        DATE;
        int_rnd_min     NUMBER;
        int_rnd_max     NUMBER;
        int_rnd_posit   NUMBER;
        iters           NUMBER;
        rul_id          NUMBER;
		chck			NUMBER;
        sql_insert      VARCHAR(400);

BEGIN
    iters := i_cnt;
    --diac :=     'áéeíýóuúzzzzzzzz';
    diac :=     'áéeíýóuúzscrdtnl';
    nodiac :=   'aeeiyouuzscrdtnl';
    
    sql_insert := 'alter session set nls_date_format = ''YYYY-MM-DD''';
    execute immediate (sql_insert);

    FOR i IN 1..iters
    LOOP
		-- Select name and surname		
		SELECT 
			MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max 
		FROM
			(
			SELECT 
				*
            FROM
                GSD.G_M_NAME_BY_ORG_MV
			);

        SELECT 
			round(dbms_random.value(int_rnd_min, int_rnd_max),0) INTO int_rnd_posit 
		FROM 
			dual;

		SELECT 
			MEN_NAME,
			MEN_NAME_V,
			MEN_SURNAME,
			MEN_SURNAME_V INTO name_rnd, name_v, surname_rnd, surname_v 
		FROM
			(
			SELECT 
				*
            FROM
                GSD.G_M_NAME_BY_ORG_MV
			)
		WHERE
			RWN = int_rnd_posit
			;

        -- Generate DOB and AGE
        SELECT 
			ROUND(dbms_random.value(1970, 2000)) INTO int_rnd_year 
		FROM 
			dual;
			
        SELECT 
			ROUND(dbms_random.value(1, 12)) INTO int_rnd_month 
		FROM 
			dual;
			
        SELECT 
			ROUND(dbms_random.value(1, 28)) INTO int_rnd_day 
		FROM 
			dual;

		-- Add prefix zero to month number for the TO_DATE conversion
        IF (int_rnd_month < 10)
            THEN
                SELECT TO_CHAR('0'||int_rnd_month) INTO con_month FROM dual;
            ELSE
                con_month := TO_CHAR(int_rnd_month);
        END IF;

		-- Add prefix zero to day number for the TO_DATE conversion
        IF (int_rnd_day < 10)
            THEN
                SELECT TO_CHAR('0'||int_rnd_day) INTO con_day FROM dual;
            ELSE
                con_day := TO_CHAR(int_rnd_day);
        END IF;
        
		SELECT 
			int_rnd_year || '-'|| con_month ||'-'|| con_day INTO con_date 
		FROM 
			dual;
			
        SELECT
			ROUND((MONTHS_BETWEEN(TRUNC(SYSDATE), con_date)/12), 2) INTO int_age 
		FROM 
			dual;

		<<MAIL>>
        -- Select mail and replace diacritic
        SELECT 
			MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max 
		FROM
			(
            SELECT
                r.ID_RUL, r.VALUE1, ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
            FROM
                GSD.G_RULES r 
				JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
            WHERE
                rt.NAME='EMAIL'
			);

        SELECT 
			round(dbms_random.value(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit 
		FROM 
			dual;
        SELECT 
			ID_RUL INTO rul_id 
		FROM
			(
            SELECT
                ID_RUL, ROW_NUMBER() OVER(ORDER BY r.ID_RUL) AS RWN
            FROM
                GSD.G_RULES r JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
            WHERE
                rt.NAME = 'EMAIL'
			)
        WHERE
            RWN=int_rnd_posit
        ;

		-- Remove diacritic from name and surname
        SELECT 
			TRANSLATE(lower(name_rnd), diac, nodiac) INTO name_nodiac 
		FROM 
			dual;
        SELECT 
			TRANSLATE(lower(surname_rnd), diac, nodiac) INTO surname_nodiac 
		FROM 
			dual;

		-- fill the email pattern with name and surname
        SELECT
            REPLACE(
                    REPLACE(
							REPLACE(VALUE1, '$name_rnd', name_nodiac),'$surname_rnd', surname_nodiac
							),
					'$year_rnd', SUBSTR(TO_CHAR(int_rnd_year), 3, 2)
					) INTO email_gen 
		FROM 
			GSD.G_RULES 
		WHERE 
			ID_RUL=rul_id;

		SELECT 
			COUNT(*) INTO chck 
		FROM 
			RIS.R_WORKER 
		WHERE 
			EMAIL=email_gen;
		
		-- Check if email generate was succesful and go back to <<MAIL>> if needed
		IF chck > 0
			THEN
				GOTO MAIL;
		END IF;

        -- Select tofi
        SELECT 
			MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max 
        FROM 
			(
            SELECT
				tf.ID_TOFI,
				ROW_NUMBER() OVER(ORDER BY tf.ID_TOFI) RWN
            FROM 
				GSD.G_TOFI tf);
            
                        
        SELECT 
			round(dbms_random.value(int_rnd_min, int_rnd_max), 0) into int_rnd_posit 
		FROM 	
			dual;
            
        SELECT 
			ID_TOFI INTO tofi_rnd
        FROM 
			(
            SELECT
				tf.ID_TOFI,
				ROW_NUMBER() OVER(ORDER BY tf.ID_TOFI) RWN
            FROM 
				GSD.G_TOFI tf
			) 
		WHERE 
			rwn = int_rnd_posit; 
        
        -- Check if TOFI random position is valid
         IF (SQL%ROWCOUNT = 0) 
			THEN
				EXIT;
        END IF;
            
        
        IF tofi_rnd IS NULL
			THEN
           -- Select tofi
            SELECT 
				round(dbms_random.value(
											(
											SELECT 
												MIN(ID_TOFI)
											FROM 
												GSD.G_TOFI
											),
											(
											SELECT 
												MAX(ID_TOFI) 
											FROM GSD.G_TOFI
											)
										),0
					) INTO tofi_rnd 
			FROM 
				dual;
        END IF;

        
        --R_INS_WORKER_SP(i_name VARCHAR, i_surname VARCHAR, i_v_name VARCHAR, i_v_surname VARCHAR, i_dob DATE, i_email VARCHAR, i_mf VARCHAR, i_ws NUMBER, i_regdate DATE, i_tofi NUMBER)
        R_INS_RIS_PCK.SP_WORKER(name_rnd, surname_rnd, name_v, surname_v, con_date, email_gen, 'M', 1, SYSDATE, tofi_rnd);
        COMMIT;
    END LOOP;
END;

PROCEDURE SP_W_WORKER (i_cnt NUMBER) IS
        name_rnd        VARCHAR(128);
        name_v          VARCHAR(128);
        name_nodiac     VARCHAR(128);
        surname_rnd     VARCHAR(128);
        surname_v       VARCHAR(128);
        surname_nodiac  VARCHAR(128);
        diac            VARCHAR(50);
        nodiac          VARCHAR(50);
        email_gen       VARCHAR(128);
        tofi_rnd        NUMBER;
        int_tit         NUMBER;
        int_cmpt        NUMBER;
        int_eot         NUMBER;
        int_eft         NUMBER;
        int_jp          NUMBER;
        int_lvl         NUMBER;
        int_rnd_leng    NUMBER;
        int_rnd_year    NUMBER;
        int_rnd_month   NUMBER;
        int_rnd_day     NUMBER;
        int_age         NUMBER;
        con_day         VARCHAR(2);
        con_month       VARCHAR(2);
        con_date        DATE;
        int_rnd_min     NUMBER;
        int_rnd_max     NUMBER;
        int_rnd_posit   NUMBER;
        iters           NUMBER;
        rul_id          NUMBER;
		chck			NUMBER;
        sql_insert      VARCHAR(400);

BEGIN
    iters := i_cnt;
    diac :=     'áéeíýóuúzscrdtnl';
    nodiac :=   'aeeiyouuzscrdtnl';

    sql_insert := 'alter session set nls_date_format = ''YYYY-MM-DD''';
    execute immediate (sql_insert);

    FOR i IN 1..iters
    LOOP
		-- Select name and surname		
		SELECT 
			MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max 
		FROM
			(
			SELECT
                *
            FROM
                GSD.G_W_NAME_BY_ORG_MV
			);


        SELECT
			round(dbms_random.value(int_rnd_min, int_rnd_max),0) INTO int_rnd_posit 
		FROM
			dual;

		SELECT 
			WOMEN_NAME, 
			WOMEN_NAME_V, 
			WOMEN_SURNAME, 
			WOMEN_SURNAME_V INTO name_rnd, name_v, surname_rnd, surname_v 
		FROM
			(
			SELECT
                *
            FROM
                GSD.G_W_NAME_BY_ORG_MV
			)
		WHERE 
			RWN = int_rnd_posit
		;

        -- Generate DOB and AGE
        SELECT 
			ROUND(dbms_random.value(1970, 2000)) INTO int_rnd_year 
		FROM 
			dual;
			
        SELECT
			ROUND(dbms_random.value(1, 12)) INTO int_rnd_month 
		FROM dual;
		
        SELECT 
			ROUND(dbms_random.value(1, 28)) INTO int_rnd_day 
		FROM 
			dual;

		-- Add prefix zero to month number for the TO_DATE conversion
        IF (int_rnd_month < 10)
            THEN
                SELECT 
					TO_CHAR('0'||int_rnd_month) INTO con_month 
				FROM
					dual;
            ELSE
                con_month := TO_CHAR(int_rnd_month);
        END IF;

		-- Add prefix zero to day number for the TO_DATE conversion
        IF (int_rnd_day < 10)
            THEN
                SELECT 
					TO_CHAR('0'||int_rnd_day) INTO con_day 
				FROM 
					dual;
            ELSE
                con_day := TO_CHAR(int_rnd_day);
        END IF;
		
        SELECT 
			int_rnd_year || '-'|| con_month ||'-'|| con_day INTO con_date 
		FROM 
			dual;

        SELECT 
			ROUND((MONTHS_BETWEEN(TRUNC(SYSDATE), con_date)/12), 2) INTO int_age 
		FROM 
			dual;

		<<MAIL>>
        -- Select mail and replace diacritic
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
					rt.NAME='EMAIL'
        );

        SELECT 	
			round(dbms_random.value(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit 
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
					rt.NAME = 'EMAIL'
        )
        WHERE
            RWN=int_rnd_posit
        ;

		-- Remove diacritic from name and surname
        SELECT 
			TRANSLATE(lower(name_rnd), diac, nodiac) INTO name_nodiac 
		FROM 
			dual;
        SELECT 
			TRANSLATE(lower(surname_rnd), diac, nodiac) INTO surname_nodiac 
		FROM 
			dual;

        -- fill the email pattern with name and surname
        SELECT
            REPLACE(
                    REPLACE(
							REPLACE(VALUE1, '$name_rnd', name_nodiac),'$surname_rnd', surname_nodiac
							),
					'$year_rnd', SUBSTR(TO_CHAR(int_rnd_year), 3, 2)
					) INTO email_gen 
		FROM 
			GSD.G_RULES 
		WHERE 
			ID_RUL=rul_id;

		SELECT 
			COUNT(*) INTO chck 
		FROM 
			RIS.R_WORKER 
		WHERE 
			EMAIL=email_gen;
			
		-- Check if email generate was succesful and go back to <<MAIL>> if needed
		IF chck > 0
			THEN
				GOTO MAIL;
		END IF;

        -- Select tofi
        SELECT 
			MIN(RWN), 
			MAX(RWN) INTO int_rnd_min, int_rnd_max 
        FROM 
			(
            SELECT
				tf.ID_TOFI,
				ROW_NUMBER() OVER(ORDER BY tf.ID_TOFI) RWN
            FROM 
				GSD.G_TOFI tf
			);
           
                        
        SELECT 
			round(dbms_random.value(int_rnd_min, int_rnd_max), 0) into int_rnd_posit 
		FROM 
			dual;
            
        SELECT 
			ID_TOFI INTO tofi_rnd
        FROM 
			(
            SELECT
				tf.ID_TOFI, ROW_NUMBER() OVER(ORDER BY tf.ID_TOFI) RWN
            FROM 
				GSD.G_TOFI tf
			) 
		WHERE 
			rwn = int_rnd_posit; 
        
        
        -- Check if TOFI random position is valid
         IF (SQL%ROWCOUNT = 0) 
			THEN
				EXIT;
        END IF;
            

        IF tofi_rnd IS NULL
			THEN
				-- Select tofi
				SELECT 
					round(dbms_random.value(
											(
											SELECT 
												MIN(ID_TOFI) 
											FROM 
												GSD.G_TOFI
											),
											(
											SELECT 
												MAX(ID_TOFI) 
											FROM 
												GSD.G_TOFI)
											),0
						) INTO tofi_rnd 
				FROM 
					dual;
        END IF;

        -- Insert into R_WORKER
        --R_INS_WORKER_SP(i_name VARCHAR, i_surname VARCHAR, i_v_name VARCHAR, i_v_surname VARCHAR, i_dob DATE, i_email VARCHAR, i_mf VARCHAR, i_ws NUMBER, i_regdate DATE, i_tofi NUMBER)
		R_INS_RIS_PCK.SP_WORKER(name_rnd, surname_rnd, name_v, surname_v, con_date, email_gen, 'F', 1, SYSDATE, tofi_rnd);
        COMMIT;
    END LOOP;
END;
END;
/
