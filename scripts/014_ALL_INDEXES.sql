PROMPT ##############################################################
PROMPT ###### - Referential Information System - ####################
PROMPT ############### - CREATE INDEXES - ###########################

SET SERVEROUTPUT ON;  

DECLARE
	sqlstring 	VARCHAR2(400);
	CURSOR c1 IS 
		SELECT 
		'CREATE INDEX ' || OWNER || '.'|| SUBSTR(OWNER, 1, 1) || '_' ||
		CASE TABLE_NAME 
			WHEN 'R_WORKER'             THEN 'WR'
			WHEN 'R_COMPANY'            THEN 'COMP'
			WHEN 'R_CV'                 THEN 'CV'
			WHEN 'R_CV_SKILLS'          THEN 'CVS'
			WHEN 'R_CV_SKILL_REFERENCE' THEN 'CVSR'
			WHEN 'R_EDU_ORG'            THEN 'EO'
			WHEN 'R_CV_EDU_HIST'        THEN 'CEH'
			WHEN 'R_CV_JOB_HIST'        THEN 'CJH'
			WHEN 'R_CV_JOB_REFERENCE'   THEN 'CJR'
			WHEN 'R_JOB_OFFER'          THEN 'JO'
			WHEN 'R_JOB_ANSWER'         THEN 'JA'
			ELSE 'NOTHING'
			END 
			|| '_' || COLUMN_NAME || '_IDX ON ' || 
			OWNER || '.' || TABLE_NAME || ' ('||
			COLUMN_NAME||') TABLESPACE '|| OWNER ||'_INDEX' txt 
		FROM 
			DBA_TAB_COLUMNS dtc
		WHERE 
			NOT EXISTS (SELECT * FROM DBA_IND_COLUMNS dic WHERE dtc.COLUMN_NAME=dic.COLUMN_NAME AND dtc.TABLE_NAME=dic.TABLE_NAME)
			AND dtc.OWNER IN ('RIS')
			AND dtc.DATA_TYPE NOT IN ('VARCHAR2', 'DATE', 'TIMESTAMP(6)')
			AND dtc.COLUMN_NAME NOT IN ('STATUS', 'VISIBLE', 'M_F', 'F_A');
    c1_rec c1%ROWTYPE;
	c		NUMBER;
BEGIN
	c := 0;
	FOR c1_rec IN c1
	LOOP
        --DBMS_OUTPUT.PUT_LINE(c1_rec.txt);
		EXECUTE IMMEDIATE c1_rec.txt;
		c := c + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('Indexes created: ' || c);
END;
/

DECLARE
	sqlstring 	VARCHAR2(400);
	CURSOR c1 IS 
		SELECT 
		'CREATE BITMAP INDEX ' || OWNER || '.'|| SUBSTR(OWNER, 1, 1) || '_' ||
		CASE TABLE_NAME 
			WHEN 'R_WORKER'             THEN 'WR'
			WHEN 'R_COMPANY'            THEN 'COMP'
			WHEN 'R_CV'                 THEN 'CV'
			WHEN 'R_CV_SKILLS'          THEN 'CVS'
			WHEN 'R_CV_SKILL_REFERENCE' THEN 'CVSR'
			WHEN 'R_EDU_ORG'            THEN 'EO'
			WHEN 'R_CV_EDU_HIST'        THEN 'CEH'
			WHEN 'R_CV_JOB_HIST'        THEN 'CJH'
			WHEN 'R_CV_JOB_REFERENCE'   THEN 'CJR'
			WHEN 'R_JOB_OFFER'          THEN 'JO'
			WHEN 'R_JOB_ANSWER'         THEN 'JA'
			ELSE 'NOTHING'
			END 
			|| '_' || COLUMN_NAME || '_BIDX ON ' || 
			OWNER || '.' || TABLE_NAME || ' ('||
			COLUMN_NAME||') TABLESPACE '|| OWNER ||'_INDEX' txt 
		FROM 
			DBA_TAB_COLUMNS dtc
		WHERE 
			NOT EXISTS (SELECT * FROM DBA_IND_COLUMNS dic WHERE dtc.COLUMN_NAME=dic.COLUMN_NAME AND dtc.TABLE_NAME=dic.TABLE_NAME)
			AND dtc.OWNER IN ('RIS')
			AND dtc.COLUMN_NAME IN ('STATUS', 'VISIBLE', 'M_F', 'VALID_T');
    c1_rec c1%ROWTYPE;
	c		NUMBER;
BEGIN
	c := 0;
	FOR c1_rec IN c1
	LOOP
        --DBMS_OUTPUT.PUT_LINE(c1_rec.txt);
		EXECUTE IMMEDIATE c1_rec.txt;
		c := c + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('Indexes created: ' || c);
END;
/


