PROMPT ############## - INSERT INTO RIS - ############################

PROMPT ############## - ORGANIZATION - ###############################

-- DELETE BAD ORGANIZATIONS
DELETE
FROM 
	GSD.G_ORGANIZATION 
WHERE
	REGEXP_LIKE(LOWER(NAME), 'v likvidaci|nadace|nadační|společenství|skupina|bankrot|');

/*SELECT 
    OIN, --NAME 
    REGEXP_SUBSTR(NAME,'[^ ]+ ') NAME,
    SUBSTR(NAME, INSTR(NAME, ' ')+1) SURNAME
FROM 
	GSD.G_ORGANIZATION 
WHERE
    lower(NAME) NOT LIKE '%učiliště%' 
	AND lower(NAME) NOT LIKE '%odborná%'
	AND lower(NAME) NOT LIKE '%průmyslová%'
	AND lower(NAME) NOT LIKE '%střední škola%'
    AND lower(NAME) NOT LIKE '%univerzita%'
    AND lower(NAME) NOT LIKE '%vysoké učení%'
    AND lower(NAME) NOT LIKE '%fakulta%'
	AND lower(NAME) NOT LIKE '%s.r.o.%'
	AND lower(NAME) NOT LIKE '%a.s.%'
	AND lower(NAME) NOT LIKE '% o.s.%'
	AND lower(NAME) NOT LIKE '%v.o.s.%'
	AND lower(NAME) NOT LIKE '%k.s.%'
	AND lower(NAME) NOT LIKE '%s.p.%'
	AND lower(NAME) NOT LIKE '%mudr%'
	AND lower(NAME) NOT LIKE '%judr%'
    AND LOWER(NAME) NOT LIKE '%administr%'
    AND LOWER(NAME) NOT LIKE '%auto%'
    AND LOWER(NAME) NOT LIKE '%vozid%'
    AND LOWER(NAME) NOT LIKE '%karosá%'
	AND	LOWER(NAME) NOT LIKE '%klempíř%'
    AND LOWER(NAME) NOT LIKE '%bank%'
    AND LOWER(NAME) NOT LIKE '%pneu%'
	AND	LOWER(NAME) NOT LIKE '%finan%'
    AND LOWER(NAME) NOT LIKE '%cestovní%' 
    AND LOWER(NAME) NOT LIKE '%výlet%'
	AND	LOWER(NAME) NOT LIKE '%desing%'
	AND	LOWER(NAME) NOT LIKE '%interier%' 
    AND LOWER(NAME) NOT LIKE '%doprava%'
	AND	LOWER(NAME) NOT LIKE '%ekolog%'
    AND LOWER(NAME) NOT LIKE '%ekonom%'
    AND LOWER(NAME) NOT LIKE '%elektro%'
    AND LOWER(NAME) NOT LIKE '%elektri%'
    AND LOWER(NAME) NOT LIKE '%farmacie%' 
	AND	LOWER(NAME) NOT LIKE '%fotog%'
    AND LOWER(NAME) NOT LIKE '%gastron%'
    AND LOWER(NAME) NOT LIKE '%restaur%'
    AND LOWER(NAME) NOT LIKE '%občer%'
    AND LOWER(NAME) NOT LIKE '%pensi%'
	AND	LOWER(NAME) NOT LIKE '%hotel%'
    AND	LOWER(NAME) NOT LIKE '%holič%'
	AND	LOWER(NAME) NOT LIKE '%ubyt%'
	AND	LOWER(NAME) NOT LIKE '%persona%'
    AND LOWER(NAME) NOT LIKE '%chemi%'
	AND	LOWER(NAME) NOT LIKE '%system%'
	AND	LOWER(NAME) NOT LIKE '%softwa%'
	AND	LOWER(NAME) NOT LIKE '%jakost%'
	AND	LOWER(NAME) NOT LIKE '%kvalit%'
    AND LOWER(NAME) NOT LIKE '%kultur%'
	AND	LOWER(NAME) NOT LIKE '%kovář%'
	AND	LOWER(NAME) NOT LIKE '%zámeč%'
    AND	LOWER(NAME) NOT LIKE '%lakýr%'
    AND	LOWER(NAME) NOT LIKE '%konstru%'
	AND	LOWER(NAME) NOT LIKE '%lesn%'
	AND	LOWER(NAME) NOT LIKE '%řezb%'
	AND	LOWER(NAME) NOT LIKE '%dřev%'
    AND LOWER(NAME) NOT LIKE '%marketing%'
	AND	LOWER(NAME) NOT LIKE '%propag%'
    AND LOWER(NAME) NOT LIKE '%reklama%'
    AND LOWER(NAME) NOT LIKE '%publicis%' 
    AND LOWER(NAME) NOT LIKE '%vydavat%'
	AND	LOWER(NAME) NOT LIKE '%publ%relations%'
    AND LOWER(NAME) NOT LIKE '%ostrah%' 
    AND LOWER(NAME) NOT LIKE '%bezpečno%'
    AND LOWER(NAME) NOT LIKE '%pojištov%'
    AND LOWER(NAME) NOT LIKE '%potrav%'
    AND LOWER(NAME) NOT LIKE '%řeznic%'
    AND LOWER(NAME) NOT LIKE '%uzen%'
    AND LOWER(NAME) NOT LIKE '%právní%'
    AND LOWER(NAME) NOT LIKE '%judr.%'
    AND LOWER(NAME) NOT LIKE '%prodej%'
    AND LOWER(NAME) NOT LIKE '%obchod%'
    AND LOWER(NAME) NOT LIKE '%natěrač%' 
    AND LOWER(NAME) NOT LIKE '%oděv%'
    AND LOWER(NAME) NOT LIKE '%švadl%'
    AND LOWER(NAME) NOT LIKE '%šití%'
    AND LOWER(NAME) NOT LIKE '%kameni%'
    AND LOWER(NAME) NOT LIKE '%instalat%'
    AND LOWER(NAME) NOT LIKE '%květin%'
    AND LOWER(NAME) NOT LIKE '%knih%'
    AND LOWER(NAME) NOT LIKE '%oprav%'
    AND LOWER(NAME) NOT LIKE '%krejco%'
    AND LOWER(NAME) NOT LIKE '%praní%'
    AND LOWER(NAME) NOT LIKE '%služb%'
    AND LOWER(NAME) NOT LIKE '%služeb%'
	AND	LOWER(NAME) NOT LIKE '%řemesl%'
    AND LOWER(NAME) NOT LIKE '%úřad%'
    AND LOWER(NAME) NOT LIKE '%stát%'
    AND LOWER(NAME) NOT LIKE '%stavby%'
    AND LOWER(NAME) NOT LIKE '%staveb%'
    AND LOWER(NAME) NOT LIKE '%stavb%'
    AND LOWER(NAME) NOT LIKE '%zedn%'
    AND LOWER(NAME) NOT LIKE '%výkop%'
    AND LOWER(NAME) NOT LIKE '%projektan%'
    AND LOWER(NAME) NOT LIKE '%střeš%'
    AND LOWER(NAME) NOT LIKE '%střech%'
    AND LOWER(NAME) NOT LIKE '%podlah%'
    AND LOWER(NAME) NOT LIKE '%izola%'
    AND LOWER(NAME) NOT LIKE '%realit%'
    AND LOWER(NAME) NOT LIKE '%strojírens%'
    AND LOWER(NAME) NOT LIKE '%strojař%'
    AND LOWER(NAME) NOT LIKE '%soustr%'
    AND LOWER(NAME) NOT LIKE '%fréza%'
	AND LOWER(NAME) NOT LIKE '%pedag%'
    AND LOWER(NAME) NOT LIKE '%škol%'
    AND LOWER(NAME) NOT LIKE '%technic%'
    AND LOWER(NAME) NOT LIKE '%telef%'
	AND LOWER(NAME) NOT LIKE '%pokrýv%'
    AND LOWER(NAME) NOT LIKE '%stolar%'
    AND LOWER(NAME) NOT LIKE '%truhl%'
    AND LOWER(NAME) NOT LIKE '%tesař%'
    AND LOWER(NAME) NOT LIKE '%věd%'
    AND LOWER(NAME) NOT LIKE '%manag%'
    AND LOWER(NAME) NOT LIKE '%manaž%'
    AND LOWER(NAME) NOT LIKE '%tisk%'
    AND LOWER(NAME) NOT LIKE '%výroba%'
    AND LOWER(NAME) NOT LIKE '%průmysl%'
    AND LOWER(NAME) NOT LIKE '%ocel%'
    AND LOWER(NAME) NOT LIKE '%sklář%'
    AND LOWER(NAME) NOT LIKE '%sklen%'
    AND LOWER(NAME) NOT LIKE '%kovár%'
    AND LOWER(NAME) NOT LIKE '%zdravotnictví%' 
    AND LOWER(NAME) NOT LIKE '%lékár%'
    AND LOWER(NAME) NOT LIKE '%nemoc%'
    AND LOWER(NAME) NOT LIKE '%zemědělství%'
    AND LOWER(NAME) NOT LIKE '%zahrad%'
    AND LOWER(NAME) NOT LIKE '%brambor%'
    AND LOWER(NAME) NOT LIKE '%osev%'
    AND LOWER(NAME) NOT LIKE '%zeměděl%'
    AND LOWER(NAME) NOT LIKE '%svářeč%'
	AND LOWER(NAME) NOT LIKE '%svářeč%'
    AND LOWER(NAME) NOT LIKE '%stolař%'
    AND LOWER(NAME) NOT LIKE '%kadeř%'
    --AND LOWER(NAME) NOT LIKE '%sport%'
    --AND LOWER(NAME) NOT LIKE '%svaz%'
    --AND LOWER(NAME) NOT LIKE '%spole%'
    --AND LOWER(NAME) NOT LIKE '%klub%'
    AND LOWER(NAME) NOT LIKE '%účet%'
    AND LOWER(NAME) NOT LIKE '%kavárn%'
    AND LOWER(NAME) NOT LIKE '%shop%'
    AND LOWER(NAME) NOT LIKE '%analyt%'
    AND LOWER(NAME) NOT LIKE '%soft%'
    AND LOWER(NAME) NOT LIKE '%počíta%'
    ;	

/*	
SELECT 
    COUNT(*)
    --org.NAME, smn.MEN_NAME, sms.MEN_SURNAME 
FROM 
    SMPL.SAMPLE_MEN_NAME smn, SMPL.SAMPLE_MEN_SURNAME sms,GSD.G_ORGANIZATION org 
WHERE smn.MEN_NAME||' '=REGEXP_SUBSTR(org.NAME,'[^ ]+ ')
        AND sms.MEN_SURNAME=SUBSTR(org.NAME, INSTR(org.NAME, ' ')+1)
;

SELECT MIN(RWN), MAX(RWN) FROM
(
SELECT 
    org.NAME, swn.WOMEN_NAME, sws.WOMEN_SURNAME,
    ROW_NUMBER() OVER(ORDER BY org.OIN) RWN
FROM 
    GSD.G_ORGANIZATION org, 
    SMPL.SAMPLE_WOMEN_NAME swn, SMPL.SAMPLE_WOMEN_SURNAME sws 
WHERE swn.ID_W_NAME < 12000 AND sws.ID_W_SURNAME < 61000 AND 
swn.WOMEN_NAME||' '=REGEXP_SUBSTR(org.NAME,'[^ ]+ ')
    AND sws.WOMEN_SURNAME=SUBSTR(org.NAME, INSTR(org.NAME, ' ')+1)
ORDER BY org.OIN
)
--WHERE RWN=1
ORDER BY RWN
;

(SELECT '%'||REGEXP_SUBSTR(org.NAME,'[^ ]+ ')||'%' FROM GSD.G_ORGANIZATION org)
; 
	
    
    SELECT * FROM SMPL.SAMPLE_WOMEN_SURNAME WHERE WOMEN_SURNAME='Kotas';	
	--AND lower(NAME) NOT LIKE '%%';
*/

/* Rozdeleni 



*/


PROMPT ############# - EDU ORG - ################################

-- SOU
DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOI, DOE, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org 
				WHERE 
					lower(NAME) LIKE '%střední%'
					AND lower(NAME) LIKE '%učiliště%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'odborná|průmyslová|střední škola|ústav|klub|svaz|oddíl')
                    AND NOT EXISTS (SELECT EIN FROM RIS.R_EDU_ORG eo WHERE eo.EIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
    c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(2);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..fields.count
        LOOP   
            sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_EDU_ORG(:1, :2, :3, :4, :5); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_TYPES(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- SS

DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOI, DOE, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org 
				WHERE 
					lower(NAME) LIKE '%střední škola%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'učiliště|odborná|průmyslová|ústav|klub|svaz|oddíl')
                    AND NOT EXISTS (SELECT EIN FROM RIS.R_EDU_ORG eo WHERE eo.EIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
	c := 0;
	fields := t_fields(3);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
            sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_EDU_ORG(:1, :2, :3, :4, :5); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_TYPES(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- SPS

DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOI, DOE, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org 
				WHERE 
					lower(NAME) LIKE '%střední průmyslová škola%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'učiliště|odborná|ústav|klub|svaz|oddíl')
                    AND NOT EXISTS (SELECT EIN FROM RIS.R_EDU_ORG eo WHERE eo.EIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(4);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
            sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_EDU_ORG(:1, :2, :3, :4, :5); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_TYPES(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- SOS

DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOI, DOE, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org 
				WHERE 
					lower(NAME) LIKE '%střední odborná škola%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'učiliště|akademie|konzervatoř|ústav|klub|svaz|oddíl')
                    AND NOT EXISTS (SELECT EIN FROM RIS.R_EDU_ORG eo WHERE eo.EIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(5);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
            sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_EDU_ORG(:1, :2, :3, :4, :5); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_TYPES(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- OA

DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOI, DOE, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org 
				WHERE 
					lower(NAME) LIKE '%obchodní akademie%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'učiliště|konzervatoř|ústav|klub|svaz|oddíl')	
                    AND NOT EXISTS (SELECT EIN FROM RIS.R_EDU_ORG eo WHERE eo.EIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(6);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
            sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_EDU_ORG(:1, :2, :3, :4, :5); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_TYPES(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- VOS

DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOI, DOE, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org
				WHERE 
					lower(NAME) LIKE '%vyšší %škola%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'učiliště|konzervatoř|akademie|střední|ústav|klub|svaz|oddíl')
                    AND NOT EXISTS (SELECT EIN FROM RIS.R_EDU_ORG eo WHERE eo.EIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(7);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
            sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_EDU_ORG(:1, :2, :3, :4, :5); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_TYPES(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- VS - I - II - III

DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOI, DOE, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org 
				WHERE 
					(lower(NAME) LIKE '%vysoká%škola%'
					OR REGEXP_LIKE(LOWER(NAME), 'univerzita|vysoké učení|fakulta'))
					AND NOT REGEXP_LIKE(LOWER(NAME), 'učiliště|konzervatoř|akademie|ústav|klub|svaz|oddíl')
                    AND NOT EXISTS (SELECT EIN FROM RIS.R_EDU_ORG eo WHERE eo.EIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(4) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(8, 9, 10, 11);
    FOR c1_rec IN c1     
    LOOP
        sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_EDU_ORG(:1, :2, :3, :4, :5); END;';
        EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_TYPES(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/


PROMPT ############## - EDU ORG FIELD - ##############################

-- Automotive
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%auto%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(12) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(2, 3, 4, 22, 42, 101, 106, 134, 180, 184, 203, 358);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Architektonická
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%architek%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(3) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(381, 382, 383);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Cestovni ruch
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
					REGEXP_LIKE(LOWER(eo.NAME), 'cesto|turis')
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(6) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(74, 152, 168, 331, 366, 419);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Chemické
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%chemi%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(11) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(6, 77, 78, 79, 80, 159, 326, 327, 330, 353, 395);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Dopravní
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%doprav%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(13) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(28, 29, 30, 31, 96, 143, 155, 169, 248, 318, 319, 358, 461);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Dřevař
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%dřeva%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(10) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(34, 35, 36, 220, 400, 417, 418, 420, 485, 490);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Ekonomická
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE
					REGEXP_LIKE(LOWER(eo.NAME), 'ekonom|podnikatel')
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'staveb|oděvní|nadační') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(33) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(1, 7, 8, 9, 18, 19, 38, 39, 40, 41, 54, 55, 56, 57, 58, 61, 225, 226, 227, 228, 229, 276, 278, 279, 280, 283, 284, 286, 422, 423, 424, 486);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Elektronické
DECLARE
    CURSOR c1 IS SELECT 
					eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%elektro%'; 
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(18) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(44, 45, 46, 47, 48, 49, 157, 170, 181, 184, 185, 186, 187, 188, 189, 190, 405, 471);
    FOR c1_rec IN c1
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Farmaceutika
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%farmaceuti%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(3) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(52, 132, 246);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Gastronomie
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%gastron%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(13) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(63, 64, 65, 73, 128, 129, 130, 164, 216, 295, 297, 404, 456);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Informatiky
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
					REGEXP_LIKE(LOWER(eo.NAME), 'info|počít|techno|vysoké účení')
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační|potrav|chemi') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(24) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(5, 84, 85, 86, 87, 88, 89, 90, 174, 208, 209, 274, 275, 333, 313, 377, 378, 393, 397, 409, 446, 447, 448, 449);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Lékařská
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%lékař%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(14) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(23, 24, 25, 26, 240, 261, 305, 356, 443, 473, 474, 475, 476, 477);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Lesnictví
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%lesni%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(3) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(137, 138, 139);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Hotel
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%hotel%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(7) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(17, 64, 74, 75, 158, 285, 352);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Textilni

DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%textilní%'
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(14) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(118, 119, 120, 121, 122, 123, 124, 125, 167, 412, 413, 414, 415, 416);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Odevni

DECLARE
    CURSOR c1 IS SELECT 
					eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%oděvní%'
                ;
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(14) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(118, 119, 120, 121, 122, 123, 124, 125, 167, 412, 413, 414, 415, 416);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Strojirenske

DECLARE
    CURSOR c1 IS SELECT 
					eo.EIN, eo.NAME 
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%strojírensk%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'stavební') 
                    ;
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(31) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(160, 166, 183, 191, 192, 
	194, 195, 196, 197, 198, 
	199, 200, 201, 202, 203, 
	204, 205, 206, 256, 385, 
	386, 387, 388, 389, 390, 
	391, 392, 394, 396, 397, 
	458);    
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/


-- Stavebni
DECLARE
    CURSOR c1 IS SELECT 
					eo.EIN, eo.NAME 
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%stavební%' 
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'obchodní|strojní') 
					;
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(20) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(32, 66, 95, 96, 97, 173, 257, 262, 281, 299, 300, 334, 359, 381, 382, 384, 402, 407, 441, 453);
    FOR c1_rec IN c1
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Sklenářství
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%sklář%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(7) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(12, 165, 360, 361, 362, 363, 406);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Sociální
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%sociál%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační|zdravo') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(9) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(136, 263, 264, 265, 368, 369, 371, 373, 466);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/


-- Managementu
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%managemen%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(33) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(38, 51, 59, 85, 150, 151, 152 ,153, 154, 155 ,156 , 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173 ,174, 175, 176, 277, 388);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Multimédia
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%multim%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(4) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(217, 218, 219, 411);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Mezinárodní
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%mezinár%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(4) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(210, 211, 212, 309);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Nábytkářské
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%nábytká%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(5) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(111, 220, 221, 345, 400);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Technické
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%technick%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(17) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(48, 67, 181, 193, 197, 199, 204, 302, 349, 394, 397, 399, 400, 401, 402, 403, 470);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Pedagogicka
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%pedago%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(7) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(136, 263, 264, 265, 369, 425, 444);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Potravinářské
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%potravinář%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(8) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(164, 295, 296, 297, 404, 456, 487, 488);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Přírodovědecká
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
					REGEXP_LIKE(LOWER(eo.NAME), 'přírodověd|fyzik')
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační') 
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(9) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(77, 78, 79, 80, 159, 326, 327, 330, 353);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Propagace a marketing
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE
					REGEXP_LIKE(LOWER(eo.NAME), 'propa|polygr|marke')
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(24) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(68, 69, 93, 109, 126, 177, 178, 179, 217, 218, 219, 225, 272, 273, 291, 292, 293, 315, 316, 317, 342, 343, 437, 495);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Právní a policejní
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
					REGEXP_LIKE(LOWER(eo.NAME), 'právní|policej')
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(15) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(10, 11, 110, 289, 306, 307, 308, 309, 310, 311, 340, 367, 431);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Psychologie, personalistika
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%psycho%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(267);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Veterinární
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%veteri%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(6) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(62, 81, 82, 83, 434, 435);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Vojenská
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%vojensk%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(7) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(10, 140, 245, 320, 442, 459, 472);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Veřejnosprávní
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
					REGEXP_LIKE(LOWER(eo.NAME), 'veřejno|správ')
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(7) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(290, 380, 428, 429, 430, 432, 433);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Zemědělství
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%zeměděl%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(9) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(43, 53, 172, 282, 480, 481, 482, 483, 484);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Železnické
DECLARE
    CURSOR c1 IS SELECT 
                    eo.EIN, eo.NAME
                FROM 
                    RIS.R_EDU_ORG eo 
                    JOIN GSD.G_EDU_TYPES et ON eo.EIN=et.EIN
                    JOIN GSD.G_EDU_ORG_TYPE eot ON et.ID_EOT=eot.ID_EOT
                WHERE 
                    lower(eo.NAME) LIKE '%železni%'
					AND NOT REGEXP_LIKE(LOWER(eo.NAME), 'nadační')  
                    ;              
    c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(492);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_EDU_ORG_FIELD(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.ein, fields(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

PROMPT ############## - COMPANY TYPE - ###############################

-- s.r.o.
DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOE, DOI, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org
				WHERE 
					lower(NAME) LIKE '%s.r.o.%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'svaz|oddíl|nadace|nadační') 
                    AND NOT EXISTS (SELECT CIN FROM RIS.R_COMPANY comp WHERE comp.CIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(1);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_COMPANY(:1, :2, :3, :4, :5, :6); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i), c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- a.s.
DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOE, DOI, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org
				WHERE 
					lower(NAME) LIKE '%a.s.%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'svaz|oddíl|nadace|nadační')
                    AND NOT EXISTS (SELECT CIN FROM RIS.R_COMPANY comp WHERE comp.CIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(2);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_COMPANY(:1, :2, :3, :4, :5, :6); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i), c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- o.s.
DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOE, DOI, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org
				WHERE 
					lower(NAME) LIKE '% o.s.%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'svaz|oddíl|nadace|nadační')
                    AND NOT EXISTS (SELECT CIN FROM RIS.R_COMPANY comp WHERE comp.CIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(3);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_COMPANY(:1, :2, :3, :4, :5, :6); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i), c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- v.o.s.
DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOE, DOI, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org
				WHERE 
					lower(NAME) LIKE '%v.o.s.%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'svaz|oddíl|nadace|nadační')
                    AND NOT EXISTS (SELECT CIN FROM RIS.R_COMPANY comp WHERE comp.CIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(4);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_COMPANY(:1, :2, :3, :4, :5, :6); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i), c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- k.s.
DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOE, DOI, EMAIL 
				FROM 
					GSD.G_ORGANIZATION org
				WHERE 
					lower(NAME) LIKE '%k.s.%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'svaz|oddíl|nadace|nadační')
                    AND NOT EXISTS (SELECT CIN FROM RIS.R_COMPANY comp WHERE comp.CIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(5);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
		sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_COMPANY(:1, :2, :3, :4, :5, :6); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i), c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- s.p.
DECLARE
	CURSOR c1 IS SELECT 
					OIN, NAME, DOE, DOI, EMAIL
				FROM 
					GSD.G_ORGANIZATION org
				WHERE 
					lower(NAME) LIKE '%s.p.%'
					AND NOT REGEXP_LIKE(LOWER(NAME), 'svaz|oddíl|nadace|nadační')
                    AND NOT EXISTS (SELECT CIN FROM RIS.R_COMPANY comp WHERE comp.CIN=org.OIN)
                    ;
	c1_rec c1%ROWTYPE;
	TYPE t_fields IS VARRAY(1) OF INTEGER;
	fields t_fields;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	fields := t_fields(6);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..fields.count
        LOOP
			sqlstring := 'BEGIN RIS.R_INS_RIS_PCK.SP_COMPANY(:1, :2, :3, :4, :5, :6); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.oin, fields(i), c1_rec.name, c1_rec.doe, c1_rec.doi, c1_rec.email;
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/


PROMPT ############## - COMPANY INDUSTRY - ###########################

-- Automotive
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE
					REGEXP_LIKE(LOWER(NAME), 'servis|auto')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'doprava')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(7) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 2, 32, 38, 42);
    FOR c1_rec IN c1     
    LOOP
		FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
			--DBMS_OUTPUT.PUT_LINE(sqlstring);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Bankovnictvi
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE
					REGEXP_LIKE(LOWER(NAME), 'komerční banka|česká spořite|československá obchodní bank|bank')
					AND NOT REGEXP_LIKE(LOWER(NAME), 'bankrot|zo os|zo |základ|os pracovníků|investič|odbor|fond|factor|infor')
					AND NOT REGEXP_LIKE(LOWER(NAME), 'fc|závod|vín|export|zvuk|akademie|realit|bez banky|banket|sperm|neřeš')
					AND NOT REGEXP_LIKE(LOWER(NAME), 'první|včelí|privat|živnost|pobočka|ludo|univer|data|coko|buněk|neban')
					AND NOT REGEXP_LIKE(LOWER(NAME), 'embank|tradebank|bankovský|finnes|invest|clearing|bankonaut|sdružení|team')
					AND NOT REGEXP_LIKE(LOWER(NAME), 'zdravo|seed|škola|ochranná')
				;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(14) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 16, 17, 18, 23, 24, 25, 26, 27, 29, 44, 3);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Cestovní ruch
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(NAME), 'cestov|turist')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'zo |fond|lékař|skupina|v likvidaci');
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(11) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 16, 17, 18, 23, 24, 25, 29, 4);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Desing
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(NAME), 'desing')
					AND NOT REGEXP_LIKE(LOWER(NAME), 'zo |enginee')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(4) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 9);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Elektro
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'elektro|elektor')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'doprava|v likvidaci')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(4) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 9);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Farmacie
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'medicon|hoffmann| johnson, s.r.o|novartis|bioderma')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|stavby|spa|invests|grand|steel|doprava|v likvidaci')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(4) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 10);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Marketing
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'marketin')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|stavby|spa|invests|grand|steel|doprava|v likvidaci|soukrom')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(12) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 23, 5, 16, 17, 23, 24, 25, 29, 44);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Média
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'mediál')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|stavby|spa|invests|grand|steel|doprava|v likvidaci|škola')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(12) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 23, 5, 16, 17, 24, 25, 29, 44);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Hotelnictví
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'hotel')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|stavby|spa|invests|grand|steel|doprava|v likvidaci|škola')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(10) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 13, 14, 23, 17, 25, 26, 29, 33);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Gastronomie
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'restau')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|stavby|spa|invests|grand|steel|doprava|v likvidaci|škola')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(6) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 12, 25, 28, 33);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Chemie
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'chem')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|stavby|spa|invests|grand|steel|doprava|v likvidaci|škola')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(5) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 15, 25, 28);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Stavebniny
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'stave')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|spa|invests|grand|steel|doprava|v likvidaci|škola')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(4) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 36, 42);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Telekomunikace
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'telek|o2|cetin|t-mob|vodafo')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|spa|invests|grand|steel|doprava|v likvidaci|škola')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(9) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 14, 16, 17, 18, 25, 29, 39);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/

-- Zdravotnictví
DECLARE
	CURSOR c1 IS SELECT 
					CIN, NAME 
				FROM 
					RIS.R_COMPANY comp 
				WHERE 
					REGEXP_LIKE(LOWER(comp.NAME), 'ošetř|nemoc')
					AND NOT REGEXP_LIKE(LOWER(comp.NAME), 'auto|asten|truhl|reality|spa|invests|grand|steel|doprava|v likvidaci|škola')
					;
	c1_rec c1%ROWTYPE;
	TYPE t_indu IS VARRAY(6) OF INTEGER;
	indu t_indu;
	i NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
	indu := t_indu(1, 8, 16, 25, 29, 46);
    FOR c1_rec IN c1     
    LOOP
        FOR i IN 1..indu.count
        LOOP
			sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_COMPANY_INDUSTRY(:1, :2); END;';
            EXECUTE IMMEDIATE sqlstring USING c1_rec.cin, indu(i);
            c := c + 1;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows');
END;
/


-------

/*
PROCEDURE SP_JOB_TYPE          (name VARCHAR, long_name VARCHAR);
PROCEDURE SP_JOB_INDUSTRY      (name VARCHAR, long_name VARCHAR);
PROCEDURE SP_JOB_POSITION      (name VARCHAR, long_name VARCHAR);
PROCEDURE SP_INDUSTRY_POSITION (id_ji NUMBER, id_jp NUMBER);
PROCEDURE SP_WORKER_STATUS     (name VARCHAR, long_name VARCHAR);
PROCEDURE SP_EVALUATION        (name VARCHAR, long_name VARCHAR);
PROCEDURE SP_TITLE             (name VARCHAR, long_name VARCHAR, fa VARCHAR, lvl NUMBER);
PROCEDURE SP_EDU_ORG_TYPE      (name VARCHAR, long_name VARCHAR, max NUMBER);
PROCEDURE SP_EDU_FIELD_TYPE    (name VARCHAR, long_name VARCHAR);
PROCEDURE SP_EDU_ORG_FIELD	   (ein NUMBER, id_eft NUMBER);
PROCEDURE SP_EDU_TYPES         (ein NUMBER, id_eot NUMBER);
PROCEDURE SP_COMPANY_TYPE      (name VARCHAR, long_name VARCHAR);
PROCEDURE SP_COMPANY_INDUSTRY  (cin NUMBER, id_ji NUMBER);
PROCEDURE SP_LANGUAGE          (name VARCHAR, long_name VARCHAR);
PROCEDURE SP_ORGANIZATION      (i_oin NUMBER, i_name VARCHAR, i_doe DATE, i_doi DATE, i_email VARCHAR)
PROCEDURE SP_TOFI              (id_tit NUMBER, id_eot NUMBER, id_eft NUMBER, id_jp NUMBER);
PROCEDURE SP_RULE_TYPES        (rule VARCHAR);
PROCEDURE SP_RULES             (rt NUMBER, min NUMBER, max NUMBER);
PROCEDURE SP_RULES             (rt NUMBER, val1 VARCHAR, val2 VARCHAR);


-- Kontrola

SELECT 
	OIN, NAME 
FROM 
	GSD.G_ORGANIZATION org 
WHERE 
	NOT EXISTS (
			SELECT 
				CIN 
			FROM 
				RIS.R_COMPANY comp 
			WHERE 
				org.OIN=comp.CIN
			) 
	OR NOT EXISTS (
			SELECT 
				EIN 
			FROM 
				RIS.R_EDU_ORG eo 
			WHERE 
				org.OIN=eo.EIN
				)
;

DECLARE
	sqlstring VARCHAR2(200);
	CURSOR c1 IS SELECT OWNER, OBJECT_NAME FROM DBA_OBJECTS WHERE OWNER IN ('RIS', 'GSD') AND OBJECT_TYPE = 'TABLE'
        ORDER BY OWNER, OBJECT_NAME;
	c1_rec c1%ROWTYPE;
    cnt NUMBER;
BEGIN
	FOR c1_rec IN c1
	LOOP
		sqlstring := 'SELECT COUNT(*) FROM '||c1_rec.OWNER||'.'||c1_rec.OBJECT_NAME||'';
        EXECUTE IMMEDIATE sqlstring INTO cnt;
        DBMS_OUTPUT.PUT_LINE(c1_rec.OWNER||'.'||c1_rec.OBJECT_NAME||': ' || cnt);
    END LOOP;
END;
/

*/
