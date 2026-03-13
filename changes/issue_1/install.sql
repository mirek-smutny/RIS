
VARIABLE FILE_SUFFIX VARCHAR2(200)

DECLARE
  param_exist NUMBER;
BEGIN
  SELECT COUNT(1) cnt INTO param_exist FROM dba_objects o WHERE o.owner='SCHEM' and o.object_name='PARAM_TABLE' AND o.OBJECT_TYPE='TABLE';
  IF param_exist = 1
    THEN
      EXECUTE IMMEDIATE 'SELECT ''_'' || VALUE_STRING || ''_'' || TO_CHAR(SYSDATE, ''DD_MM_YYYY_HH24MI'') INTO :val FROM SCHEM.PARAM_TABLE WHERE COL = ''NAME_DB''' INTO :file_suffix;
    ELSE
      SELECT '_' || upper(i.INSTANCE_NAME) || '_' || upper(i.HOST_NAME) || '_' || TO_CHAR(SYSDATE, 'DD_MM_YYYY_HH24MI') INTO :file_suffix FROM v$instance i;
  END IF;
END;
/

COLUMN file_suffix new_val file_suffix
SELECT :file_suffix file_suffix FROM DUAL;

SPOOL install&&file_suffix..log

--WHENEVER SQLERROR EXIT
SET FEEDBACK ON;
SET SERVEROUTPUT ON SIZE 1000000;


PROMPT ##############################################################
PROMPT ################## R_LOG Structures ##########################
@@001_R_LOG_structure.sql
@@002_R_LOG_PRC.sql
PROMPT ################## G_NAME_BY_ORG_MV ##########################
@@012_G_NAME_BY_ORG_MV.sql
PROMPT ################## R_GEN_CV ##################################
@@006_R_GEN_CV.sql
PROMPT ################## R_GEN_CV_ITEM #############################
@@007_R_GEN_CV_ITEM.sql
PROMPT ################## R_GEN_WR_BY_ORG_PCK #######################
@@013_R_GEN_WR_BY_ORG_PCK.sql
PROMPT ################## R_GENERATE  ###############################
@@020_R_GENERATE.sql

SPOOL OFF;
