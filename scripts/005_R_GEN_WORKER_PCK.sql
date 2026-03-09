-- Generation had to separated due to different genders.

create or replace PACKAGE     R_GEN_WORKER_PCK IS
PROCEDURE SP_M_WORKER (i_cnt NUMBER);
PROCEDURE SP_W_WORKER (i_cnt NUMBER);
END;
/

create or replace PACKAGE BODY         R_GEN_WORKER_PCK IS
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
        sql_insert      VARCHAR(400);

BEGIN
    iters := i_cnt;
    diac :=     'áéěíýóůúžščřďťňľ';
    nodiac :=   'aeeiyouuzscrdtnl';

    sql_insert := 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
    EXECUTE IMMEDIATE sql_insert;

    FOR i IN 1..iters
    LOOP
        -- Select name
        SELECT ROUND(DBMS_RANDOM.VALUE(1, 280),0) INTO int_rnd_posit FROM dual;
        SELECT 
			MEN_NAME, MEN_NAME_V INTO name_rnd, name_v
        FROM 
			GSD.SAMPLE_MEN_NAME 
		WHERE ID_M_NAME = int_rnd_posit;

        -- Select surname
        SELECT 
			ROUND(DBMS_RANDOM.VALUE(1, 61365),0) INTO int_rnd_posit FROM dual;
		SELECT 
			MEN_SURNAME, MEN_SURNAME_V INTO surname_rnd, surname_v
        FROM 
			GSD.SAMPLE_MEN_SURNAME 
		WHERE 
			ID_M_SURNAME = int_rnd_posit;

        -- Generate DOB and AGE
        SELECT ROUND(DBMS_RANDOM.VALUE(1950, 2000)) INTO int_rnd_year FROM dual;
        SELECT ROUND(DBMS_RANDOM.VALUE(1, 12)) INTO int_rnd_month FROM dual;
        SELECT ROUND(DBMS_RANDOM.VALUE(1, 28)) INTO int_rnd_day FROM dual;

        IF (int_rnd_month < 10)
            THEN
                SELECT TO_CHAR('0'||int_rnd_month) INTO con_month FROM dual;
            ELSE
                con_month := TO_CHAR(int_rnd_month);
        END IF;

        IF (int_rnd_day < 10)
            THEN
                SELECT TO_CHAR('0'||int_rnd_day) INTO con_day FROM dual;
            ELSE
                con_day := TO_CHAR(int_rnd_day);
        END IF;
        SELECT int_rnd_year || '-'|| con_month ||'-'|| con_day INTO con_date FROM dual;

        SELECT ROUND((MONTHS_BETWEEN(TRUNC(SYSDATE), con_date)/12), 2) INTO int_age FROM dual;

        -- Select mail and replace diacritic
        SELECT 
			MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max 
		FROM
			(
			SELECT
				r.ID_RUL, r.VALUE1, ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
			FROM
				GSD.G_RULES r JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
			WHERE
				rt.NAME='EMAIL'
			);

        SELECT ROUND(DBMS_RANDOM.VALUE(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit FROM dual;
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

        SELECT TRANSLATE(lower(name_rnd), diac, nodiac) INTO name_nodiac FROM dual;
        SELECT TRANSLATE(lower(surname_rnd), diac, nodiac) INTO surname_nodiac FROM dual;

        SELECT
            REPLACE(
                    REPLACE(
                        REPLACE(VALUE1, 
								'$name_rnd', name_nodiac
								),
						'$surname_rnd', surname_nodiac
							),
					'$year_rnd', SUBSTR(TO_CHAR(int_rnd_year), 3, 2)
					) INTO email_gen 
		FROM 
			GSD.G_RULES 
		WHERE 
			ID_RUL=rul_id;

        -- Select tofi
        SELECT ROUND(DBMS_RANDOM.VALUE(MIN(RWN), MAX(RWN)),0) INTO tofi_rnd
        FROM (
            SELECT
				tf.ID_TOFI, ROW_NUMBER() OVER(ORDER BY tf.ID_TOFI) RWN
            FROM 
				GSD.G_TOFI tf
            WHERE 
				tf.ID_TIT IN (
							SELECT 
								ID_TIT 
							FROM 
								(
								SELECT 
									tit.ID_TIT, tit.NAME, ROW_NUMBER() OVER (ORDER BY tit.ID_TIT) RWN 
								FROM 
									GSD.G_TITLE tit
								WHERE 
									tit.LVL = (
											SELECT 
												TO_NUMBER(SUBSTR(rult.NAME,5)) LVL
											FROM 
												GSD.G_RULES rul
												JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
											WHERE 
												rult.NAME like 'LVL%' 
												AND int_age BETWEEN MINI and MAXI
											)
								)
						)
			);

        IF tofi_rnd IS NULL
        THEN
           -- Select tofi
            SELECT 	
				ROUND(DBMS_RANDOM.VALUE(
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
										GSD.G_TOFI
									)
										),0) INTO tofi_rnd FROM dual;
            DBMS_OUTPUT.PUT_LINE(tofi_rnd);
        END IF;

        -- Insert into R_WORKER
        DBMS_OUTPUT.PUT_LINE('Sample name: ' || name_rnd || ' ' || surname_rnd  );
        DBMS_OUTPUT.PUT_LINE('Sample email: ' || email_gen);
        DBMS_OUTPUT.PUT_LINE('Sample DOB: ' || con_date || ' Age: ' || int_age);
        DBMS_OUTPUT.PUT_LINE('VÃ¡Å¾enÃ½ pane ' || name_v || ' ' || surname_v);
        DBMS_OUTPUT.PUT_LINE('PohlavÃ­: M');
        DBMS_OUTPUT.PUT_LINE('TOFI: ' || tofi_rnd);
        --R_INS_WORKER_SP(i_name VARCHAR, i_surname VARCHAR, i_v_name VARCHAR, i_v_surname VARCHAR, i_dob DATE, i_email VARCHAR, i_mf VARCHAR, i_ws NUMBER, i_regdate DATE, i_tofi NUMBER)
        R_INS_RIS_PCK.SP_WORKER(name_rnd, surname_rnd, name_v, surname_v, con_date, email_gen, 'M', 1, SYSDATE, tofi_rnd);
    END LOOP;
    COMMIT;
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
        sql_insert      VARCHAR(400);

BEGIN
    iters := i_cnt;
    diac :=     'áéěíýóůúžščřďťňľ';
    nodiac :=   'aeeiyouuzscrdtnl';

    sql_insert := 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
    EXECUTE IMMEDIATE sql_insert;

    FOR i IN 1..iters
    LOOP
        -- Select name
        SELECT ROUND(DBMS_RANDOM.VALUE(1, 350),0) INTO int_rnd_posit FROM dual;
        SELECT WOMEN_NAME, WOMEN_NAME_V INTO name_rnd, name_v
        FROM GSD.SAMPLE_WOMEN_NAME WHERE ID_W_NAME = int_rnd_posit;

        -- Select surname
        SELECT ROUND(DBMS_RANDOM.VALUE(1, 65033),0) INTO int_rnd_posit FROM dual;
        SELECT WOMEN_SURNAME, WOMEN_SURNAME_V INTO surname_rnd, surname_v
        FROM GSD.SAMPLE_WOMEN_SURNAME WHERE ID_W_SURNAME = int_rnd_posit;

        -- Generate DOB and AGE
        SELECT ROUND(DBMS_RANDOM.VALUE(1960, 2000)) INTO int_rnd_year FROM dual;
        SELECT ROUND(DBMS_RANDOM.VALUE(1, 12)) INTO int_rnd_month FROM dual;
        SELECT ROUND(DBMS_RANDOM.VALUE(1, 28)) INTO int_rnd_day FROM dual;

        IF (int_rnd_month < 10)
            THEN
                SELECT TO_CHAR('0'||int_rnd_month) INTO con_month FROM dual;
            ELSE
                con_month := TO_CHAR(int_rnd_month);
        END IF;

        IF (int_rnd_day < 10)
            THEN
                SELECT TO_CHAR('0'||int_rnd_day) INTO con_day FROM dual;
            ELSE
                con_day := TO_CHAR(int_rnd_day);
        END IF;
        SELECT int_rnd_year || '-'|| con_month ||'-'|| con_day INTO con_date FROM dual;

        SELECT ROUND((MONTHS_BETWEEN(TRUNC(SYSDATE), con_date)/12), 2) INTO int_age FROM dual;

        -- Select mail and replace diacritic
        SELECT MIN(RWN), MAX(RWN) INTO int_rnd_min, int_rnd_max FROM
        (
            SELECT
                r.ID_RUL, r.VALUE1, ROW_NUMBER() OVER (ORDER BY r.ID_RUL) AS RWN
            FROM
                GSD.G_RULES r JOIN GSD.G_RULE_TYPES rt ON r.ID_RULT=rt.ID_RULT
            WHERE
                rt.NAME='EMAIL'
        );

        SELECT ROUND(DBMS_RANDOM.VALUE(int_rnd_min, int_rnd_max), 0) INTO int_rnd_posit FROM dual;
        SELECT ID_RUL INTO rul_id FROM
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

        SELECT TRANSLATE(LOWER(name_rnd), diac, nodiac) INTO name_nodiac FROM dual;
        SELECT TRANSLATE(LOWER(surname_rnd), diac, nodiac) INTO surname_nodiac FROM dual;

        SELECT
            REPLACE(
                    REPLACE(
                        REPLACE(VALUE1, '$name_rnd', name_nodiac),
                    '$surname_rnd', surname_nodiac),
            '$year_rnd', SUBSTR(TO_CHAR(int_rnd_year), 3, 2))
        INTO email_gen FROM GSD.G_RULES WHERE ID_RUL=rul_id;
        
        -- Select tofi
        SELECT ROUND(DBMS_RANDOM.VALUE(MIN(RWN), MAX(RWN)),0) INTO tofi_rnd
        FROM (
            SELECT
				tf.ID_TOFI, ROW_NUMBER() OVER(ORDER BY tf.ID_TOFI) RWN
            FROM 
				GSD.G_TOFI tf
            WHERE 
				tf.ID_TIT IN (
							SELECT 
								ID_TIT 
							FROM 
								(
								SELECT 
									tit.ID_TIT, tit.NAME, ROW_NUMBER() OVER (ORDER BY tit.ID_TIT) RWN 
								FROM 
									GSD.G_TITLE tit
								WHERE 
									tit.LVL = (
											SELECT 
												TO_NUMBER(SUBSTR(rult.NAME,5)) LVL
											FROM 
												GSD.G_RULES rul
												JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT
											WHERE 
												rult.NAME like 'LVL%' 
												AND int_age BETWEEN MINI and MAXI
											)
								)
						)
			);

        IF tofi_rnd IS NULL
        THEN
           -- Select tofi
            SELECT ROUND(DBMS_RANDOM.VALUE((SELECT MIN(ID_TOFI) FROM GSD.G_TOFI),
            (SELECT MAX(ID_TOFI) FROM GSD.G_TOFI)),0) INTO tofi_rnd FROM dual;
            DBMS_OUTPUT.PUT_LINE(tofi_rnd);
        END IF;

        -- Insert into R_WORKER
        DBMS_OUTPUT.PUT_LINE('Sample name: ' || name_rnd || ' ' || surname_rnd  );
        DBMS_OUTPUT.PUT_LINE('Sample email: ' || email_gen);
        DBMS_OUTPUT.PUT_LINE('Sample DOB: ' || con_date || ' Age: ' || int_age);
        DBMS_OUTPUT.PUT_LINE('VÃ¡Å¾enÃ½ pane ' || name_v || ' ' || surname_v);
        DBMS_OUTPUT.PUT_LINE('PohlavÃ­: M');
        DBMS_OUTPUT.PUT_LINE('TOFI: ' || tofi_rnd);
        --R_INS_WORKER_SP(i_name VARCHAR, i_surname VARCHAR, i_v_name VARCHAR, i_v_surname VARCHAR, i_dob DATE, i_email VARCHAR, i_mf VARCHAR, i_ws NUMBER, i_regdate DATE, i_tofi NUMBER)
        R_INS_RIS_PCK.SP_WORKER(name_rnd, surname_rnd, name_v, surname_v, con_date, email_gen, 'F', 1, SYSDATE, tofi_rnd);
    END LOOP;
    COMMIT;
END;
END;