
VARIABLE FILE_SUFFIX VARCHAR2(200)

DECLARE
  param_exist NUMBER;
BEGIN
  SELECT COUNT(1) cnt INTO param_exist FROM dba_objects o WHERE o.owner='SCHEM' and o.object_name='PARAM_TABLE' AND o.OBJECT_TYPE='TABLE';
  IF param_exist = 1
    THEN
      EXECUTE IMMEDIATE 'SELECT ''_'' || VALUE_STRING || ''_'' || TO_CHAR(SYSDATE, ''DD_MM_YYYY_HH24MI'') INTO :val FROM SCHEM.PARAM_TABLE WHERE COL = ''NAME_DB''' INTO :file_suffix;
    ELSE
      SELECT '_' || upper(i.PDB_NAME) || '_' || TO_CHAR(SYSDATE, 'DD_MM_YYYY_HH24MI') INTO :file_suffix FROM v$pdbs i;
  END IF;
END;
/

COLUMN file_suffix new_val file_suffix
SELECT :file_suffix file_suffix FROM DUAL;

SPOOL install_RIS_DWH_ETL_002_&&file_suffix..log

--WHENEVER SQLERROR EXIT
SET FEEDBACK ON;
SET SERVEROUTPUT ON SIZE 1000000;


PROMPT ##############################################################
PROMPT ################## DWH Structures ############################
@@001_DWH_structures.sql
PROMPT ################## DWH Log Procedure #########################
@@007_DWH_error_log_procedure.sql
PROMPT ################## DWH Functions #############################
@@003_DWH_functions.sql
PROMPT ################## DWH DB Link ###############################
PROMPT ################## DWH ETL Procedures ########################
@@005_DWH_etl_procedures.sql
PROMPT ################## DWH ETL Main ##############################
@@006_DWH_main_procedure.sql

SPOOL OFF;
