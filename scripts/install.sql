
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

@@004_GSD_GRANT.sql

PROMPT ##############################################################
PROMPT ################## GSD Structures ############################
@@001_GSD_structures.sql
@@004_GSD_GRANT.sql
PROMPT ################## RIS Structures ############################
@@001_RIS_structures.sql
@@004_GSD_GRANT.sql
PROMPT ################## GSD Structures 2 ##########################
@@002_GSD_structures_2.sql
PROMPT ################## G_INS_GSD_PCK #############################
@@003_G_INS_GSD_PCK.sql
PROMPT ################## R_INS_RIS_PCK  ############################
@@003_R_INS_RIS_PCK.sql
PROMPT ################## GSD Grant #################################
@@004_GSD_GRANT.sql
PROMPT ################## GSD Inserts ###############################
@@004_GSD_inserts.sql
PROMPT ################## TOFI Inserts ##############################
@@004_TOFI_inserts.sql
PROMPT ################## R_GEN_CV ##################################
@@006_R_GEN_CV.sql
PROMPT ################## R_GEN_CV_ITEM #############################
@@007_R_GEN_CV_ITEM.sql
PROMPT ################## R_WORKER_PCK ##############################
@@008_R_WORKER_PCK.sql
PROMPT # Import input_data into defined table (5 files) and run install2.sql#
SPOOL OFF;
