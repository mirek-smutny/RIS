create or replace PACKAGE RIS.R_WORKER_PCK IS
PROCEDURE SP_GETFULLWORKER (i_pin NUMBER);
PROCEDURE SP_GETWORKERCV (i_pin NUMBER);
PROCEDURE SP_GETWORKERCV (i_surname VARCHAR, i_name VARCHAR, i_dob DATE);
END;
/

create or replace PACKAGE BODY RIS.R_WORKER_PCK IS
PROCEDURE SP_GETFULLWORKER (i_pin NUMBER) IS
    o_datum DATE;
BEGIN
    execute immediate 'alter session set nls_date_format = ''YYYY-MM-DD HH24:MI:SS''';
    SELECT SYSDATE into o_datum FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('PRC_GETFULLWORKER(pin)' || o_datum);
END;
PROCEDURE SP_GETWORKERCV (i_pin NUMBER) IS
    o_datum DATE;
BEGIN
    execute immediate 'alter session set nls_date_format = ''YYYY-MM-DD HH24:MI:SS''';
    SELECT SYSDATE into o_datum FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('PRC_GETWORKER_CV(pin)' || o_datum);
END;
PROCEDURE SP_GETWORKERCV (i_surname VARCHAR, i_name VARCHAR, i_dob DATE) IS
    o_datum DATE;
BEGIN
    execute immediate 'alter session set nls_date_format = ''YYYY-MM-DD HH24:MI:SS''';
    SELECT SYSDATE into o_datum FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('PRC_GETWORKER_CV(surname, name, dob)'|| o_datum);

END;
END;
/
