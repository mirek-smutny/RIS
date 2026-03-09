CREATE OR REPLACE PROCEDURE RIS.R_GENERATE (cnt IN number)IS
    i_cnt   NUMBER;
    i_tmp   NUMBER;
    i_pin   NUMBER;
BEGIN
    i_cnt := cnt;
    i_tmp := 0;
    WHILE i_tmp <= i_cnt
    LOOP
    BEGIN
		-- Generate Man Worker
        R_GEN_WR_BY_ORG_PCK.SP_M_WORKER(1);
		-- Get newest worker ID
        SELECT MAX(PIN) INTO i_pin FROM R_WORKER;
        R_GEN_CV.SP_GEN_CV(1, i_pin, i_pin);
        R_GEN_CV_ITEM.SP_GEN_CEH(i_pin, i_pin);
        R_GEN_CV_ITEM.SP_GEN_CJH(i_pin,i_pin);
        R_GEN_REF_SP(i_pin);
        
        i_tmp := i_tmp + 1;
        
		-- Generate Woman Worker
        R_GEN_WR_BY_ORG_PCK.SP_W_WORKER(1);
		-- Get newest worker ID
        SELECT MAX(PIN) INTO i_pin FROM R_WORKER;
        R_GEN_CV.SP_GEN_CV(1, i_pin, i_pin);
        R_GEN_CV_ITEM.SP_GEN_CEH(i_pin, i_pin);
        R_GEN_CV_ITEM.SP_GEN_CJH(i_pin,i_pin);
        R_GEN_REF_SP(i_pin);
        
        i_tmp := i_tmp + 1;
    EXCEPTION
    WHEN OTHERS 
		THEN
			-- Skip current worker
			CONTINUE;
    END;
    END LOOP;   
END;
/

CREATE OR REPLACE PROCEDURE RIS.R_BATCH_1K IS
    i NUMBER;
BEGIN
    RIS.R_GENERATE(1000);
END;
/


exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_1' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_2' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_3' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_4' ,force => TRUE);

exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_5' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_6' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_7' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_8' ,force => TRUE);

exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_9' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_10' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_11' ,force => TRUE);
exec DBMS_SCHEDULER.STOP_JOB(job_name => 'RIS.BATCH_1K_12' ,force => TRUE);

exec dbms_scheduler.disable('RIS.BATCH_1K_2', true);
exec dbms_scheduler.disable('RIS.BATCH_1K_4', true);
exec dbms_scheduler.disable('RIS.BATCH_1K_6', true);
exec dbms_scheduler.disable('RIS.BATCH_1K_8', true);
exec dbms_scheduler.disable('RIS.BATCH_1K_10', true);
exec dbms_scheduler.disable('RIS.BATCH_1K_12', true);
  
exec dbms_scheduler.enable('RIS.BATCH_1K_1');
exec dbms_scheduler.enable('RIS.BATCH_1K_2');
exec dbms_scheduler.enable('RIS.BATCH_1K_3');
exec dbms_scheduler.enable('RIS.BATCH_1K_4');

EXEC DBMS_SCHEDULER.DROP_JOB('RIS.BATCH_1K_1');
EXEC DBMS_SCHEDULER.DROP_JOB('RIS.BATCH_1K_2');
EXEC DBMS_SCHEDULER.DROP_JOB('RIS.BATCH_1K_3');
EXEC DBMS_SCHEDULER.DROP_JOB('RIS.BATCH_1K_4');
EXEC DBMS_SCHEDULER.DROP_JOB('RIS.BATCH_1K_5');
EXEC DBMS_SCHEDULER.DROP_JOB('RIS.BATCH_1K_6');

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_1',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=00;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_2',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=05;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_3',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=10;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_4',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=15;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_5',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=20;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_6',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=25;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_7',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=30;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_8',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=35;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_9',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=40;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_10',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=45;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_11',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=50;');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_12',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=55;');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_1',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:00', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=HOURLY;', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 1');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_2',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:15', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=HOURLY;', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 2');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_3',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:30', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=HOURLY;', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 3');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_4',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-11 17:45', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=HOURLY;', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 4');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_5',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-11 00:00', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=HOURLY;', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 5');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_6',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-11 00:10', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=HOURLY;', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 6');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_7',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:05', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=MINUTELY;BYMINUTE=05', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 7');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_8',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:25', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=MINUTELY;BYMINUTE=15', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 8');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_9',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:25', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=MINUTELY;BYMINUTE=25', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 9');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_10',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:35', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=MINUTELY;BYMINUTE=35', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 10');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_11',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:55', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=MINUTELY;BYMINUTE=45', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 11');
END;
/

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'RIS.BATCH_1K_12',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN RIS.R_BATCH_1K; END;',
   start_date           => TO_DATE('2020-02-10 17:55', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=MINUTELY;BYMINUTE=55', 
   end_date             => TO_DATE('2020-03-09 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Generate RIS workers - 12');
END;
/


BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'RIS.BATCH_1K_9',
    attribute      =>   'comments',
    value          =>   'Generate RIS workers - 9');
END;
/


CREATE TABLE GSD.G_RIS_COUNT
(
OWNNAME VARCHAR(20),
TBL VARCHAR2(30),
CNT NUMBER(30),
DATUM TIMESTAMP
)
TABLESPACE GSD_DATA;

create or replace PROCEDURE     gsd.G_COUNT(ownname IN varchar)
IS
    CURSOR tbl_c1 IS
    SELECT OWNER, TABLE_NAME FROM SYS.DBA_TABLES WHERE OWNER=ownname;
    tbl_rec tbl_c1%ROWTYPE;
    tmstmp TIMESTAMP;
    sqlstring VARCHAR2(300);
BEGIN
    SELECT SYSTIMESTAMP INTO tmstmp FROM dual;
    FOR tbl_rec IN tbl_c1
    LOOP
        sqlstring := 'INSERT INTO GSD.G_RIS_COUNT(OWNNAME, TBL, CNT, DATUM) VALUES(:1, :2, (SELECT COUNT(*) FROM '|| tbl_rec.OWNER || '.' || tbl_rec.TABLE_NAME || '), :3)';
        EXECUTE IMMEDIATE sqlstring USING tbl_rec.owner, tbl_rec.table_name, tmstmp;
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
    COMMIT;
END;


BEGIN
DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'GSD.G_RIS_COUNT_JOB',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN GSD.G_COUNT(''RIS''); END;',
   start_date           => TO_DATE('2020-02-13 21:30', 'YYYY-MM-DD HH24:MI:SS'),
   repeat_interval      => 'FREQ=MINUTELY;BYMINUTE=30', 
   end_date             => TO_DATE('2026-03-15 01:20', 'YYYY-MM-DD HH24:MI:SS'),
   enabled              =>  TRUE,
   comments             => 'Get counts of RIS tables');
END;
/

BEGIN
    DBMS_SCHEDULER.SET_ATTRIBUTE (
    name           =>   'GSD.G_RIS_COUNT_JOB',
    attribute      =>   'repeat_interval',
    value          =>   'FREQ=MINUTELY;BYMINUTE=00,30');
END;
/

CREATE VIEW GSD.G_HIST_RIS_COUNT_V AS
SELECT
    OWNNAME
    ,TBL
    ,CNT
    ,PREV_CNT
    ,(CNT - PREV_CNT) DIFF
    ,DATUM
    ,PREV_DATUM
    ,EXTRACT( DAY FROM (DATUM-PREV_DATUM)*24*60*60) DIFF_DATUM
    ,ROUND(((CNT-PREV_CNT)/EXTRACT( DAY FROM (DATUM-PREV_DATUM)*24*60*60)),2) RATE
FROM
    (
    SELECT
        grc.OWNNAME
        ,grc.TBL
        ,grc.CNT
        ,CASE 
			WHEN
				(LAG(grc.CNT, 1, 0) OVER (PARTITION BY grc.OWNNAME, grc.TBL ORDER BY grc.DATUM)) <> 0
            THEN 
				(LAG(grc.CNT, 1, 0) OVER (PARTITION BY grc.OWNNAME, grc.TBL ORDER BY grc.DATUM))
			ELSE NULL 
		END PREV_CNT
        ,grc.DATUM
        ,LAG(grc.DATUM, 1) OVER (PARTITION BY grc.OWNNAME, grc.TBL ORDER BY grc.DATUM) PREV_DATUM
    FROM
        GSD.G_RIS_COUNT grc
    ORDER BY
        grc.DATUM DESC
        ,grc.OWNNAME
        ,grc.TBL
    )
WHERE
    PREV_CNT IS NOT NULL AND (CNT-PREV_CNT)<>0
    AND EXTRACT( DAY FROM (DATUM-PREV_DATUM)*24*60*60) < 20000
ORDER BY   
    DATUM DESC,
    RATE DESC
;

select * from gsd.g_hist_ris_count_v