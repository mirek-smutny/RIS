PROMPT ########## - GRANT TO ROLE_GSD_RO - ########################

CREATE ROLE ROLE_GSD_RO;
CREATE ROLE ROLE_SAMPLE_RO;

DECLARE
    sqlstring VARCHAR2(200);
    CURSOR c1 IS SELECT TABLE_NAME FROM DBA_TABLES WHERE OWNER = 'GSD' ORDER BY TABLE_NAME;
    cr c1%ROWTYPE; 
BEGIN
    FOR cr IN c1
    LOOP
        DBMS_OUTPUT.PUT_LINE('GSD.'|| cr.TABLE_NAME);
        sqlstring := 'GRANT SELECT ON GSD.'|| cr.TABLE_NAME || ' TO ROLE_GSD_RO';
        EXECUTE IMMEDIATE sqlstring;
        sqlstring := 'GRANT SELECT ON GSD.'|| cr.TABLE_NAME || ' TO RIS';
        EXECUTE IMMEDIATE sqlstring;
        sqlstring := 'GRANT REFERENCES ON GSD.'|| cr.TABLE_NAME || ' TO RIS';
        EXECUTE IMMEDIATE sqlstring;
    END LOOP;
END;    
/

DECLARE
    sqlstring VARCHAR2(200);
    CURSOR c1 IS SELECT TABLE_NAME FROM DBA_TABLES WHERE OWNER = 'RIS' ORDER BY TABLE_NAME;
    cr c1%ROWTYPE; 
BEGIN
    FOR cr IN c1
    LOOP
        DBMS_OUTPUT.PUT_LINE('RIS.'|| cr.TABLE_NAME);
        sqlstring := 'GRANT SELECT ON RIS.'|| cr.TABLE_NAME || ' TO GSD';
        EXECUTE IMMEDIATE sqlstring;
        sqlstring := 'GRANT REFERENCES ON RIS.'|| cr.TABLE_NAME || ' TO GSD';
        EXECUTE IMMEDIATE sqlstring;
    END LOOP;
END;    
/

/*DECLARE
    sqlstring VARCHAR2(200);
    CURSOR c1 IS SELECT TABLE_NAME FROM DBA_TABLES WHERE OWNER = 'SMPL' ORDER BY TABLE_NAME;
    cr c1%ROWTYPE; 
BEGIN
    FOR cr IN c1
    LOOP
        DBMS_OUTPUT.PUT_LINE('SMPL.'|| cr.TABLE_NAME);
        sqlstring := 'GRANT SELECT ON SMPL.'|| cr.TABLE_NAME || ' TO ROLE_SAMPLE_RO';
        EXECUTE IMMEDIATE sqlstring;
        sqlstring := 'GRANT SELECT ON SMPL.'|| cr.TABLE_NAME || ' TO RIS';
        EXECUTE IMMEDIATE sqlstring;
        sqlstring := 'GRANT REFERENCES ON SMPL.'|| cr.TABLE_NAME || ' TO RIS';
        EXECUTE IMMEDIATE sqlstring;
        sqlstring := 'GRANT ALL ON SMPL.'|| cr.TABLE_NAME || ' TO GSD';
        EXECUTE IMMEDIATE sqlstring;
    END LOOP;
END;    
/
*/

GRANT ROLE_GSD_RO TO RIS;
GRANT ROLE_SAMPLE_RO TO GSD;

PROMPT ########## - GRANT TO ROLE_GSD_EX - ########################

DROP ROLE ROLE_GSD_EX;
CREATE ROLE ROLE_GSD_EX;

GRANT EXECUTE ON GSD.G_INS_GSD_PCK TO ROLE_GSD_EX;

GRANT ROLE_GSD_EX TO RIS;

 
PROMPT ############## - END OF GSD - ############################
