-- Check not used Industries

SELECT
    *
FROM
    GSD.G_JOB_INDUSTRY ji
WHERE NOT EXISTS
    (SELECT * FROM GSD.G_COMPANY_INDUSTRY ci WHERE ci.ID_JI=ji.ID_JI)
;

SELECT
    *
FROM
    GSD.G_JOB_INDUSTRY ji
WHERE NOT EXISTS
    (SELECT * FROM GSD.G_INDUSTRY_POSITION ip WHERE ip.ID_JI=ji.ID_JI)
;

-- Missing positions

SELECT
    *
FROM
    GSD.G_JOB_POSITION jp
WHERE NOT EXISTS
    (SELECT * FROM GSD.G_INDUSTRY_POSITION ip WHERE ip.ID_JP=jp.ID_JP)
;

SELECT
    *
FROM
    GSD.G_JOB_POSITION jp
WHERE NOT EXISTS
    (SELECT * FROM GSD.G_INDUSTRY_POSITION ip WHERE ip.ID_JP=jp.ID_JP)
;

SELECT
    ji.ID_JI
    ,ji.NAME INDUSTRY
    ,jp.ID_JP
    ,jp.NAME POSITION
FROM
    GSD.G_JOB_INDUSTRY ji
    JOIN GSD.G_INDUSTRY_POSITION ip ON ji.ID_JI=ip.ID_JI
    JOIN GSD.G_JOB_POSITION jp ON ip.ID_JP=jp.ID_JP
;

SELECT * FROM GSD.G_JOB_INDUSTRY ORDER BY ID_JI;

-- Check TOFIes
SELECT 
    tf.ID_TOFI, tt.NAME AS TITLE, eot.NAME AS ORG, eft.NAME AS FIELD, jp.NAME AS POSITION, ji.NAME AS INDUSTRY 
FROM
    GSD.G_TOFI tf 
    JOIN GSD.G_TITLE tt ON tf.ID_TIT=tt.ID_TIT 
    JOIN GSD.G_EDU_ORG_TYPE eot ON tf.ID_EOT=eot.ID_EOT 
    JOIN GSD.G_EDU_FIELD_TYPE eft ON tf.ID_EFT=eft.ID_EFT 
    JOIN GSD.G_JOB_POSITION jp ON tf.ID_JP=jp.ID_JP
    LEFT OUTER JOIN GSD.G_INDUSTRY_POSITION ip ON jp.ID_JP=ip.ID_JP
    LEFT OUTER JOIN GSD.G_JOB_INDUSTRY ji ON ip.ID_JI=ji.ID_JI
WHERE  tf.ID_TOFI IN (SELECT ID_TOFI FROM RIS.R_WORKER)
;



SELECT 
    wr.PIN,
    wr.NAME,
    wr.SURNAME,
    wr.EMAIL,
    CASE
    WHEN M_F = 'F' THEN 'Female'
    WHEN M_F = 'M' THEN 'Male'
    END AS M_F,
    cv.NAME AS CV_NAME,
    tit.NAME AS TITLE,
    eo.NAME AS SCHOOL,
    eft.NAME AS FIELD,
    TO_CHAR(ceh.START_DATE, 'YYYY-MM-DD') AS START_DATE,
    TO_CHAR(ceh.END_DATE, 'YYYY-MM-DD') AS END_DATE
FROM
    RIS.R_WORKER wr
    JOIN RIS.R_CV cv ON wr.PIN=cv.PIN
    JOIN RIS.R_CV_EDU_HIST ceh ON cv.ID_CV=ceh.ID_CV
    JOIN GSD.G_TITLE tit ON ceh.ID_TIT=tit.ID_TIT
    JOIN RIS.R_EDU_ORG eo ON ceh.EIN=eo.EIN
    JOIN GSD.G_EDU_FIELD_TYPE eft ON ceh.ID_EFT=eft.ID_EFT
WHERE
    wr.PIN = 2
;

---- SCHOOL
SELECT
     wr.PIN, wr.NAME, wr.SURNAME, wr.DOB
    ,cv.NAME AS CV
    ,eo.NAME AS SCHOOL
    ,eft.NAME AS FIELD
    ,ceh.START_DATE
    ,ceh.END_DATE
    ,tit.NAME TITLE
FROM
    RIS.R_WORKER wr
    JOIN RIS.R_CV cv ON wr.PIN=cv.PIN
    JOIN RIS.R_CV_EDU_HIST ceh ON cv.ID_CV=ceh.ID_CV
    JOIN RIS.R_EDU_ORG eo ON ceh.EIN=eo.EIN
    JOIN GSD.G_WORKER_STATUS ws ON wr.ID_WS=ws.ID_WS
    JOIN GSD.G_EDU_FIELD_TYPE eft ON ceh.ID_EFT=eft.ID_EFT
    LEFT JOIN GSD.G_TITLE tit ON ceh.ID_TIT=tit.ID_TIT
;

########################################################################################################################

SELECT
    /* A1-SUBQUERY-HARDPARSE */
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
    ,
    (
    SELECT
        TITLE
    FROM
        ( 
        SELECT
            cv.PIN
            ,tit.NAME TITLE
            ,ROW_NUMBER() OVER (PARTITION BY cv.ID_CV ORDER BY ceh.END_DATE DESC) RWN
        FROM
            RIS.R_CV cv
            JOIN RIS.R_CV_EDU_HIST ceh ON cv.ID_CV=ceh.ID_CV
            JOIN GSD.G_TITLE tit ON tit.ID_TIT=ceh.ID_TIT
        WHERE
            ceh.STATUS='A'
        )
    WHERE
        RWN=1
        AND PIN=wr.PIN
    ) TITLE    
FROM
    RIS.R_WORKER wr
    JOIN GSD.G_WORKER_STATUS ws ON ws.ID_WS=wr.ID_WS
WHERE
    ws.ID_WS IN (1, 2, 3)
    AND wr.STATUS='A'
    AND wr.PIN=45
;

SELECT
    /* A1-HARDPARSE */
    PIN
    ,NAME
    ,SURNAME
    ,DOB
    ,EMAIL
    ,GENDER
    ,AGE
    ,TITLE
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
        ,ROW_NUMBER() OVER (PARTITION BY ceh.ID_CV ORDER BY ceh.END_DATE DESC) RWN    
    FROM
        RIS.R_WORKER wr
        JOIN GSD.G_WORKER_STATUS ws ON ws.ID_WS=wr.ID_WS
        JOIN RIS.R_CV cv ON cv.PIN=wr.PIN
        LEFT OUTER JOIN RIS.R_CV_EDU_HIST ceh ON cv.ID_CV=ceh.ID_CV
        JOIN GSD.G_TITLE tit ON ceh.ID_TIT=tit.ID_TIT
    WHERE
        ws.ID_WS IN (1, 2, 3)
        AND wr.STATUS='A'
        AND wr.PIN=45
    )
WHERE
    RWN=1
; 
          
########################################################################################################################
WITH
    ceh2 AS
    (
    SELECT /*+ materialize */
        ceh.ID_CEH
        ,ceh.ID_CV
        ,eo.NAME SCHOOL
        ,ceh.ID_EFT
        ,tit.NAME TITLE
        ,ceh.START_DATE
        ,ceh.END_DATE
        ,ceh.GRAD_DATE
        ,ROW_NUMBER() OVER (PARTITION BY ceh.ID_CV ORDER BY ceh.START_DATE DESC) RWN
    FROM
        RIS.R_CV_EDU_HIST ceh
        JOIN RIS.R_EDU_ORG eo ON ceh.EIN=eo.EIN
        LEFT OUTER JOIN GSD.G_TITLE tit ON tit.ID_TIT=ceh.ID_TIT
    WHERE
        ceh.VISIBLE=1
    )
SELECT
    wr.NAME
    ,wr.SURNAME
    ,wr.DOB
    ,CASE
        WHEN wr.M_F='M' THEN 'Muž'
        WHEN wr.M_F='F' Then 'Žena'
    END M_F
    ,ceh2.SCHOOL
    ,ceh2.TITLE
    ,ceh2.START_DATE
    ,ceh2.END_DATE
    ,ROUND(((ceh2.END_DATE-ceh2.START_DATE)/365.242199),1) YEARS
FROM
    ceh2
    JOIN RIS.R_CV cv ON cv.ID_CV=ceh2.ID_CV
    JOIN RIS.R_WORKER wr ON wr.PIN=cv.PIN
WHERE
    ceh2.RWN=1
    AND wr.PIN<=10
;


SELECT
    wr.NAME
    ,wr.SURNAME
    ,wr.DOB
    ,CASE
        WHEN wr.M_F='M' THEN 'Muž'
        WHEN wr.M_F='F' Then 'Žena'
    END M_F
    ,ceh2.SCHOOL
    ,ceh2.TITLE
    ,ceh2.START_DATE
    ,ceh2.END_DATE
    ,ROUND(((ceh2.END_DATE-ceh2.START_DATE)/365.242199),1) YEARS
FROM
    (
    SELECT
        ceh.ID_CEH
        ,ceh.ID_CV
        ,eo.NAME SCHOOL
        ,ceh.ID_EFT
        ,tit.NAME TITLE
        ,ceh.START_DATE
        ,ceh.END_DATE
        ,ceh.GRAD_DATE
        ,ROW_NUMBER() OVER (PARTITION BY ceh.ID_CV ORDER BY ceh.START_DATE DESC) RWN
    FROM
        RIS.R_CV_EDU_HIST ceh
        JOIN RIS.R_EDU_ORG eo ON ceh.EIN=eo.EIN
        LEFT OUTER JOIN GSD.G_TITLE tit ON tit.ID_TIT=ceh.ID_TIT
    WHERE
        ceh.VISIBLE=1
    ) ceh2
    JOIN RIS.R_CV cv ON cv.ID_CV=ceh2.ID_CV
    JOIN RIS.R_WORKER wr ON wr.PIN=cv.PIN
WHERE
    ceh2.RWN=1
    AND wr.PIN<=10
;

########################################################################################################################

--- JOB

SELECT
    /* CJH */
     wr.PIN, wr.NAME, wr.SURNAME, wr.DOB, ROUND(((SYSDATE - wr.DOB)/365.242199),1) AS AGE
    ,cv.NAME AS CV
    ,cmp.NAME AS EMPLOYER
    ,cjh.START_DATE
    ,cjh.END_DATE
    ,CASE WHEN cjh.END_DATE IS NULL
    THEN (SYSDATE - cjh.START_DATE)
    ELSE (cjh.END_DATE - cjh.START_DATE)
    END DURATION
    ,jt.NAME AS CONTRACT
    ,jp.NAME AS POSITION
FROM
    RIS.R_WORKER wr
    JOIN RIS.R_CV cv ON wr.PIN=cv.PIN
    JOIN RIS.R_CV_JOB_HIST cjh ON cv.ID_CV=cjh.ID_CV
    JOIN RIS.R_COMPANY cmp ON cjh.CIN=cmp.CIN
    JOIN GSD.G_WORKER_STATUS ws ON wr.ID_WS=ws.ID_WS
    JOIN GSD.G_JOB_TYPE jt ON jt.ID_JT=cjh.ID_JT
    JOIN GSD.G_JOB_POSITION jp ON jp.ID_JP=cjh.ID_JP
WHERE
    wr.PIN=524
ORDER BY PIN, cjh.START_DATE
;

########################################################################################################################

SELECT
    tit.NAME, COUNT(*)
FROM
    RIS.R_CV_EDU_HIST ceh
    LEFT OUTER JOIN GSD.G_TITLE tit ON ceh.ID_TIT=tit.ID_TIT
GROUP BY
    tit.NAME
;

SELECT rul.ID_RUL, rult.ID_RULT, rult.NAME, rul.MINI, rul.MAXI, rul.VALUE1, rul.VALUE2 
FROM GSD.G_RULES rul JOIN GSD.G_RULE_TYPES rult ON rul.ID_RULT=rult.ID_RULT WHERE rult.NAME NOT IN ('EMAIL')
ORDER BY rult.NAME;


