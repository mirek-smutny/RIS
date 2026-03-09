CREATE OR REPLACE VIEW RIS.R_A11 AS
SELECT
    /* A11 - Employee */
    wr.PIN 
    ,
    (
		SELECT
			TITLE
		FROM
			( 
				SELECT
					cv.PIN
					,tit.NAME TITLE
					,ROW_NUMBER() OVER 
						(PARTITION BY cv.ID_CV ORDER BY ceh.END_DATE DESC) RWN
				FROM
					RIS.R_CV cv
					JOIN RIS.R_CV_EDU_HIST ceh 
						ON cv.ID_CV=ceh.ID_CV
					JOIN GSD.G_TITLE tit 
						ON tit.ID_TIT=ceh.ID_TIT
				WHERE
					ceh.STATUS='A'
			)
		WHERE
			RWN=1
			AND PIN=wr.PIN
    ) TITLE 
    ,wr.NAME 
    ,wr.SURNAME 
    ,wr.DOB
    ,wr.EMAIL
    ,CASE 
		WHEN wr.M_F = 'M' THEN 'Muž'
		WHEN wr.M_F = 'F' THEN 'Žena'
    END GENDER 
    ,ROUND(((SYSDATE - wr.DOB)/365.242199),1) AS AGE   
FROM
    RIS.R_WORKER wr
    JOIN GSD.G_WORKER_STATUS ws 
		ON ws.ID_WS=wr.ID_WS
WHERE
    ws.ID_WS IN (1, 2, 3)
	AND wr.STATUS='A'
	AND cv.STATUS='A'
	AND ceh.STATUS='A'
;

CREATE OR REPLACE VIEW RIS.R_A12 AS
SELECT
    /* A12 - Employee - query rewrite - subquery */
    PIN
    ,TITLE
    ,NAME
    ,SURNAME
    ,DOB
    ,EMAIL
    ,GENDER
    ,AGE
FROM
    (
		SELECT
			wr.PIN 
			,wr.NAME 
			,wr.SURNAME 
			,wr.DOB
			,wr.EMAIL
			,CASE 
				WHEN wr.M_F = 'M' THEN 'Muž'
				WHEN wr.M_F = 'F' THEN 'Žena'
			END GENDER 
			,ROUND(((SYSDATE - wr.DOB)/365.242199),1) AS AGE
			,tit.NAME TITLE
			,ROW_NUMBER() OVER 
				(PARTITION BY ceh.ID_CV ORDER BY ceh.END_DATE DESC) RWN    
		FROM
			RIS.R_WORKER wr
			JOIN GSD.G_WORKER_STATUS ws 
				ON ws.ID_WS=wr.ID_WS
			JOIN RIS.R_CV cv 
				ON cv.PIN=wr.PIN
			LEFT OUTER JOIN RIS.R_CV_EDU_HIST ceh 
				ON cv.ID_CV=ceh.ID_CV
			JOIN GSD.G_TITLE tit 
				ON ceh.ID_TIT=tit.ID_TIT
		WHERE
			ws.ID_WS IN (1, 2, 3)
			AND wr.STATUS='A'
			AND cv.STATUS='A'
			AND ceh.STATUS='A'
    )
WHERE
    RWN=1
;

CREATE OR REPLACE VIEW RIS.R_A13 AS 
WITH tit1 AS
    (
		SELECT
			tit1.NAME TITLE
			,cvh1.ID_CV
		FROM
			GSD.G_TITLE tit1
			JOIN RIS.R_CV_EDU_HIST cvh1 
				ON cvh1.ID_TIT=tit1.ID_TIT
    )
SELECT
    /* A13 - Employee - query rewrite - CTE */
    PIN
    ,TITLE
    ,NAME
    ,SURNAME
    ,DOB
    ,EMAIL
    ,GENDER
    ,AGE
FROM
    (
		SELECT
			wr.PIN 
			,wr.NAME 
			,wr.SURNAME 
			,wr.DOB
			,wr.EMAIL
			,CASE 
				WHEN wr.M_F = 'M' THEN 'Muž'
				WHEN wr.M_F = 'F' THEN 'Žena'
			END GENDER 
			,ROUND(((SYSDATE - wr.DOB)/365.242199),1) AS AGE
			,TITLE
			,ROW_NUMBER() OVER (PARTITION BY ceh.ID_CV ORDER BY ceh.END_DATE DESC) RWN    
		FROM
			RIS.R_WORKER wr
			JOIN GSD.G_WORKER_STATUS ws
				ON ws.ID_WS=wr.ID_WS
			JOIN RIS.R_CV cv 
				ON cv.PIN=wr.PIN
			LEFT OUTER JOIN RIS.R_CV_EDU_HIST ceh
				ON cv.ID_CV=ceh.ID_CV
			JOIN tit1 
				ON cv.ID_CV=tit1.ID_CV 
		WHERE
			ws.ID_WS IN (1, 2, 3)
			AND wr.STATUS='A'
    )
WHERE
    RWN=1
;

PROMP #################################################################################################################

CREATE OR REPLACE VIEW RIS.R_B11
AS
SELECT
    /* B11 - CV - Work History*/
    cv.NAME CV_NAME
    ,cjh.START_DATE
    ,(NVL(TO_CHAR(cjh.END_DATE), 'Nyní')) AS "END_DATE"
    ,ROUND(((NVL(cjh.END_DATE, SYSDATE) - cjh.START_DATE)/365.242199),1) AS INYEARS
    ,
    (
		SELECT
			jp.NAME JOB_POSITION
		FROM
			GSD.G_JOB_POSITION jp
		WHERE
			jp.ID_JP=cjh.ID_JP
    ) JOB_POSITION
    ,
    (
		SELECT
			jt.NAME JOB_TYPE
		FROM
			GSD.G_JOB_TYPE jt
		WHERE
			jt.ID_JT=cjh.ID_JT    
    ) JOB_TYPE
    ,cmp.NAME COMPANY
	,cmpt.NAME COMPANY_TYPE
FROM
    RIS.R_CV_JOB_HIST cjh
    JOIN RIS.R_COMPANY cmp 
		ON cjh.CIN=cmp.CIN
	JOIN GSD.G_COMPANY_TYPE cmpt 
		ON cmpt.ID_CMPT=cmp.ID_CMPT
    JOIN RIS.R_CV cv 
		ON cjh.ID_CV=cv.ID_CV
    JOIN RIS.R_WORKER wr 
		ON wr.PIN=cv.PIN
WHERE
    cjh.STATUS='A'
    AND cjh.VISIBLE=1
    AND wr.STATUS='A'
ORDER BY
	cjh.END_DATE DESC
;


CREATE OR REPLACE VIEW RIS.R_B12
AS
SELECT
    /* B12 - CV - Work History - query rewrite - no nested query */
    cv.NAME CV_NAME
    ,cjh.START_DATE
    ,(NVL(TO_CHAR(cjh.END_DATE), 'Nyní')) AS "END_DATE"
    ,ROUND(((NVL(cjh.END_DATE, SYSDATE) - cjh.START_DATE)/365.242199),1) AS INYEARS
    ,jp.NAME JOB_POSITION
    ,jt.NAME JOB_TYPE
    ,cmp.NAME COMPANY
	,cmpt.NAME COMPANY_TYPE
FROM
    RIS.R_CV_JOB_HIST cjh
    JOIN GSD.G_JOB_POSITION jp 
		ON jp.ID_JP=cjh.ID_CJH
    JOIN GSD.G_JOB_TYPE jt 
		ON jt.ID_JT=cjh.ID_JT
    JOIN RIS.R_COMPANY cmp 
		ON cjh.CIN=cmp.CIN
	JOIN GSD.G_COMPANY_TYPE cmpt 
		ON cmpt.ID_CMPT=cmp.ID_CMPT
    JOIN RIS.R_CV cv 
		ON cjh.ID_CV=cv.ID_CV
    JOIN RIS.R_WORKER wr 
		ON wr.PIN=cv.PIN
WHERE
    cjh.STATUS='A'
    AND cjh.VISIBLE=1
    AND wr.STATUS='A'
;


CREATE OR REPLACE VIEW RIS.R_B13
AS
WITH cmp1 AS
    (
    SELECT
        cmp.NAME COMPANY
        ,cmpt.NAME COMPANY_TYPE
        ,cmp.CIN
    FROM
        RIS.R_COMPANY cmp
        JOIN GSD.G_COMPANY_TYPE cmpt 
			ON cmp.ID_CMPT=cmpt.ID_CMPT
    )
SELECT
    /* B13 - CV - Work History - query rewrite - CTE */
    cv.NAME CV_NAME
    ,cjh.START_DATE
    ,(NVL(TO_CHAR(cjh.END_DATE), 'Nyní')) AS "END_DATE"
    ,ROUND(((NVL(cjh.END_DATE, SYSDATE) - cjh.START_DATE)/365.242199),1) AS INYEARS
    ,jp.NAME JOB_POSITION
    ,jt.NAME JOB_TYPE
    ,cmp1.COMPANY
    ,cmp1.COMPANY_TYPE
FROM
    RIS.R_CV_JOB_HIST cjh
    JOIN GSD.G_JOB_POSITION jp 
		ON jp.ID_JP=cjh.ID_CJH
    JOIN GSD.G_JOB_TYPE jt 
		ON jt.ID_JT=cjh.ID_JT
    JOIN cmp1 
		ON cjh.CIN=cmp1.CIN
    JOIN RIS.R_CV cv 
		ON cjh.ID_CV=cv.ID_CV
    JOIN RIS.R_WORKER wr 
		ON wr.PIN=cv.PIN
WHERE
    cjh.STATUS='A'
    AND cjh.VISIBLE=1
    AND wr.STATUS='A'
;

PROMPT #################################################################################################################

CREATE OR REPLACE VIEW RIS.R_B21
AS
SELECT
    /* B21 - CV - Education History */
    cv.NAME CV_NAME
    ,ceh.START_DATE
    ,(NVL(TO_CHAR(ceh.END_DATE), 'Nyní')) AS "END_DATE"
    ,ROUND(((NVL(ceh.END_DATE, SYSDATE) - ceh.START_DATE)/365.242199),1) AS INYEARS
    ,
    (
		SELECT
			eft.NAME FIELD
		FROM
			GSD.G_EDU_FIELD_TYPE eft
		WHERE
			eft.ID_EFT=ceh.ID_EFT
    ) FIELD
    ,
    (
		SELECT
			tit.NAME TITLE
		FROM
			GSD.G_TITLE tit
		WHERE
			tit.ID_TIT=ceh.ID_TIT
    ) TITLE
    ,eo.NAME SCHOOL
FROM
    RIS.R_CV_EDU_HIST ceh
    JOIN RIS.R_EDU_ORG eo 
		ON ceh.EIN=eo.EIN
    JOIN RIS.R_CV cv 
		ON ceh.ID_CV=cv.ID_CV
    JOIN RIS.R_WORKER wr 
		ON wr.PIN=cv.PIN
WHERE
    ceh.STATUS='A'
    AND ceh.VISIBLE=1
    AND wr.STATUS='A'
    AND wr.PIN = :pin
ORDER BY
	ceh.END_DATE DESC
;


CREATE OR REPLACE VIEW RIS.R_B22
AS
SELECT
    /* B22 - CV - Education History - no nested query */
    cv.NAME CV_NAME
    ,cjh.START_DATE
    ,(NVL(TO_CHAR(cjh.END_DATE), 'Nyní')) AS "END_DATE"
    ,ROUND(((NVL(cjh.END_DATE, SYSDATE) - cjh.START_DATE)/365.242199),1) AS INYEARS
    ,jp.NAME JOB_POSITION
    ,jt.NAME JOB_TYPE
    ,cmp.NAME COMPANY
	,cmpt.NAME COMPANY_TYPE
FROM
    RIS.R_CV_JOB_HIST cjh
    JOIN GSD.G_JOB_POSITION jp 
		ON jp.ID_JP=cjh.ID_CJH
    JOIN GSD.G_JOB_TYPE jt 
		ON jt.ID_JT=cjh.ID_JT
    JOIN RIS.R_COMPANY cmp 
		ON cjh.CIN=cmp.CIN
	JOIN GSD.G_COMPANY_TYPE cmpt 
		ON cmpt.ID_CMPT=cmp.ID_CMPT
    JOIN RIS.R_CV cv 
		ON cjh.ID_CV=cv.ID_CV
    JOIN RIS.R_WORKER wr 
		ON wr.PIN=cv.PIN
WHERE
    cjh.STATUS='A'
    AND cjh.VISIBLE=1
    AND wr.STATUS='A'
;

--CREATE OR REPLACE VIEW RIS.R_C11
--AS
--;

--CREATE OR REPLACE VIEW RIS.R_C12
--AS
--;

--CREATE OR REPLACE VIEW RIS.R_C13
--AS
--;

