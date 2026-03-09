EXEC DBMS_STATS.GATHER_SCHEMA_STATS('GSD');
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('RIS');

PROMPT ##############################################################
PROMPT ################## Rebuild IND  ##############################

DECLARE
	CURSOR ind_c1 (owner VARCHAR2) IS
		SELECT INDEX_NAME FROM DBA_INDEXES WHERE OWNER = ind_c1.owner;
	indx 		ind_c1%ROWTYPE;
	sqlstring 	VARCHAR2(200);
	TYPE typ_owner IS VARRAY(3) OF VARCHAR2(10);
	own 		typ_owner;
	i 			NUMBER;
BEGIN
	own := typ_owner('GSD', 'RIS');
	FOR i IN 1..own.count
	LOOP
		DBMS_OUTPUT.PUT_LINE('#########################################################');
		DBMS_OUTPUT.PUT_LINE(own(i));
		FOR indx IN ind_c1(own(i))
		LOOP
			sqlstring := 'ALTER INDEX ' || own(i) || '.' || indx.INDEX_NAME || ' REBUILD';
			EXECUTE IMMEDIATE sqlstring;
			DBMS_OUTPUT.PUT_LINE(sqlstring);
		END LOOP;
		DBMS_OUTPUT.PUT_LINE('#########################################################');
	END LOOP;
END;
/

	