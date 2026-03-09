CREATE OR REPLACE PACKAGE RIS.R_INS_RIS_PCK IS
PROCEDURE SP_WORKER             (i_name VARCHAR, i_surname VARCHAR, i_v_name VARCHAR, i_v_surname VARCHAR, i_dob DATE, i_email VARCHAR, i_mf VARCHAR, i_ws NUMBER, i_regdate DATE, i_tofi NUMBER);
PROCEDURE SP_CV                 (i_pin NUMBER, i_name VARCHAR, i_created DATE, i_vis NUMBER);
PROCEDURE SP_CV_JOB_HIST        (i_cv NUMBER, i_cin NUMBER, i_jt NUMBER, i_jp NUMBER, i_start DATE, i_end DATE);
PROCEDURE SP_CV_EDU_HIST        (i_cv NUMBER, i_ein NUMBER, i_eft NUMBER, i_tit NUMBER, i_start DATE, i_end DATE, i_grad DATE);
PROCEDURE SP_COMPANY            (i_cin NUMBER, i_cmpt NUMBER, i_name VARCHAR, i_doe DATE, i_doi DATE, i_email VARCHAR);
PROCEDURE SP_EDU_ORG            (i_ein NUMBER, i_name VARCHAR, i_doe DATE, i_doi DATE, i_email VARCHAR);
PROCEDURE SP_CV_SKILLS          (i_cv NUMBER, i_name VARCHAR, i_evt NUMBER);
PROCEDURE SP_CV_JOB_REFERENCE   (i_cjh NUMBER, i_text VARCHAR, i_pin NUMBER, i_evt NUMBER, ref_date DATE);
PROCEDURE SP_JOB_OFFER          (i_cin NUMBER, i_pin NUMBER, i_jt NUMBER, i_jp NUMBER, i_start DATE);
PROCEDURE SP_JOB_ANSWER         (i_jo NUMBER, i_pin NUMBER, i_answer VARCHAR, i_a_date DATE);
END;
/ 

CREATE OR REPLACE PACKAGE BODY RIS.R_INS_RIS_PCK IS
PROCEDURE SP_WORKER             (i_name VARCHAR, i_surname VARCHAR, i_v_name VARCHAR, i_v_surname VARCHAR, i_dob DATE, i_email VARCHAR, i_mf VARCHAR, i_ws NUMBER, i_regdate DATE, i_tofi NUMBER) IS
BEGIN                                                  
    INSERT INTO R_WORKER(NAME, SURNAME, V_NAME, V_SURNAME, DOB, EMAIL, M_F, ID_WS, REG_DATE, STATUS, ID_TOFI) VALUES (i_name, i_surname, i_v_name, i_v_surname, i_dob, i_email, i_mf, i_ws, i_regdate, 'A', i_tofi);
END;
PROCEDURE SP_CV                 (i_pin NUMBER, i_name VARCHAR, i_created DATE, i_vis NUMBER) IS
BEGIN
    INSERT INTO R_CV(PIN, NAME, CREATED_DATE, VISIBLE, STATUS) VALUES (i_pin, i_name, i_created, i_vis, 'A');
END;
PROCEDURE SP_CV_JOB_HIST        (i_cv NUMBER, i_cin NUMBER, i_jt NUMBER, i_jp NUMBER, i_start DATE, i_end DATE) IS
BEGIN
    INSERT INTO R_CV_JOB_HIST(ID_CV, CIN, ID_JT, ID_JP, START_DATE, END_DATE, CREATED_DATE, VISIBLE, STATUS) VALUES (i_cv, i_cin, i_jt, i_jp, i_start, i_end, SYSDATE, 1, 'A');
END;
PROCEDURE SP_CV_EDU_HIST        (i_cv NUMBER, i_ein NUMBER, i_eft NUMBER, i_tit NUMBER, i_start DATE, i_end DATE, i_grad DATE) IS
BEGIN
    INSERT INTO R_CV_EDU_HIST(ID_CV, EIN, ID_EFT, ID_TIT, START_DATE, END_DATE, GRAD_DATE, CREATED_DATE, VISIBLE, STATUS) VALUES (i_cv, i_ein, i_eft, i_tit, i_start, i_end, i_grad, SYSDATE, 1, 'A');
END;
PROCEDURE SP_COMPANY            (i_cin NUMBER, i_cmpt NUMBER, i_name VARCHAR, i_doe DATE, i_doi DATE, i_email VARCHAR) IS
BEGIN
    INSERT INTO R_COMPANY(CIN, NAME, ID_CMPT, DOE, DOI, EMAIL, REG_DATE, STATUS) VALUES(i_cin, i_name, i_cmpt, i_doe, i_doi, i_email, SYSDATE, 'A');
END;
PROCEDURE SP_EDU_ORG            (i_ein NUMBER, i_name VARCHAR, i_doe DATE, i_doi DATE, i_email VARCHAR) IS
BEGIN
    INSERT INTO R_EDU_ORG(EIN, NAME, DOE, DOI, EMAIL, REG_DATE, STATUS ) VALUES (i_ein, i_name, i_doe, i_doi, i_email, SYSDATE, 'A');
END;
PROCEDURE SP_CV_SKILLS          (i_cv NUMBER, i_name VARCHAR, i_evt NUMBER) IS
BEGIN
    INSERT INTO R_CV_SKILLS(ID_CV, NAME, ID_EVT, VISIBLE, CREATED_DATE, STATUS) VALUES (i_cv, i_name, i_evt, 1, SYSDATE, 'A');
END;
PROCEDURE SP_CV_JOB_REFERENCE   (i_cjh NUMBER, i_text VARCHAR, i_pin NUMBER, i_evt NUMBER, ref_date DATE) IS
BEGIN
    INSERT INTO R_CV_JOB_REFERENCE(ID_CJH, REF_TEXT, REF_PIN, ID_EVT, REF_DATE, STATUS) VALUES (i_cjh, i_text, i_pin, i_evt, ref_date, 'A');
END;
PROCEDURE SP_JOB_OFFER          (i_cin NUMBER, i_pin NUMBER, i_jt NUMBER, i_jp NUMBER, i_start DATE) IS
BEGIN
    INSERT INTO R_JOB_OFFER(CIN, PIN, ID_JT, ID_JP, START_DATE, REG_DATE, STATUS) VALUES(i_cin, i_pin, i_jt, i_jp, i_start, SYSDATE, 'A');
END;
PROCEDURE SP_JOB_ANSWER         (i_jo NUMBER, i_pin NUMBER, i_answer VARCHAR, i_a_date DATE) IS
BEGIN
    INSERT INTO R_JOB_ANSWER(ID_JO, PIN, ANSWER, A_DATE, STATUS) VALUES(i_jo, i_pin, i_answer, i_a_date, 'A');
END;
END;
/
