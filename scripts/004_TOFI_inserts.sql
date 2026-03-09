PROMPT ############### - INSERTS INTO GSD.G_TOFI - ###############
--SP_TOFI(id_tit NUMBER, id_eot NUMBER, id_eft NUMBER, id_jp NUMBER);
--SP_INDUSTRY_POSITION (id_ji NUMBER, id_jp NUMBER);

-- Administrativa
DECLARE
    TYPE t_tit IS VARRAY(7) OF INTEGER;
    TYPE t_eo IS VARRAY(7) OF INTEGER;
    TYPE t_jp IS VARRAY(33) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
    c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 2, 4, 20, 27, 28, 29); 
    edus := t_eo(3, 5, 7, 8, 9, 10, 11);
    jobs := t_jp(1, 2, 3, 7, 8, 25, 33, 34, 47, 48, 49, 103, 105, 106, 107, 108, 116, 136, 161, 170, 171, 172, 183, 192, 193, 194, 199, 201, 204, 224, 232, 233, 234);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    --IF 
                        /*(tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                        THEN  */
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 1, :3); END;';
                        --EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    --END IF;
                END LOOP;
            END LOOP;  
        END LOOP; 
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
       
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(1, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/
  

-- Autoelektrikář
DECLARE
    TYPE t_tit IS VARRAY(1) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(6) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1); 
    edus := t_eo(2, 3, 4, 5);
    jobs := t_jp(9, 35, 36, 37, 38, 40);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 2, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 181, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 184, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 185, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 186, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 187, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 188, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 198, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    c := c + 8;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(2, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Autolakýrník
DECLARE
    TYPE t_tit IS VARRAY(1) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(3) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1); 
    edus := t_eo(2, 3, 4, 5);
    jobs := t_jp(10, 71, 81);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 3, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    c := c + 1;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(2, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Automechanik
DECLARE
    TYPE t_tit IS VARRAY(1) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(3) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1); 
    edus := t_eo(2, 3, 4, 5);
    jobs := t_jp(11, 100);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 4, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 180, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 183, :3); END;';
                    EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                    c := c + 3;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(2, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Automatizace a informatika
DECLARE
    TYPE t_tit IS VARRAY(9) OF INTEGER;
    TYPE t_eo IS VARRAY(9) OF INTEGER;
    TYPE t_jp IS VARRAY(42) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 2, 4, 20, 23, 26, 27, 28, 29); 
    edus := t_eo(3, 4, 5, 7, 8, 9, 10, 11);
    jobs := t_jp(4, 14, 18, 26, 27, 54, 60, 65, 66, 67, 68, 69, 146, 147, 148, 149, 150, 152, 153, 154, 155, 156, 159, 184, 188, 191, 197, 208, 210, 211, 222, 223, 224, 225, 226, 227, 233, 237, 242);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                        THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 5, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 84, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 85, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 86, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 87, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 88, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 89, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 90, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(16, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(17, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(18, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(16, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(39, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(27, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(16, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Automatizace chemických procesů
DECLARE
    TYPE t_tit IS VARRAY(8) OF INTEGER;
    TYPE t_eo IS VARRAY(7) OF INTEGER;
    TYPE t_jp IS VARRAY(9) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 20, 23, 26, 27, 28, 29); 
    edus := t_eo(4, 5, 7, 8, 9, 10, 11);
    jobs := t_jp(20, 21, 22, 45, 224, 225, 233, 237, 238);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                        THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 6, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(10, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(15, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(19, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(28, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(42, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(43, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
    END LOOP;
END;
/

-- Bankovnictví - (finance)
DECLARE
    TYPE t_tit IS VARRAY(10) OF INTEGER;
    TYPE t_eo IS VARRAY(8) OF INTEGER;
    TYPE t_jp IS VARRAY(35) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 2, 4, 9, 20, 23, 26, 27, 28, 29); 
    edus := t_eo(3, 4, 5, 7, 8, 9, 10, 11);
    jobs := t_jp(1, 2, 8, 13, 15, 17, 25, 33, 34, 47, 48, 49, 59, 72, 75, 82, 86, 101, 105, 106, 107, 108, 125, 140, 171, 177, 192, 193, 199, 201, 204, 224, 223, 233, 242);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 7, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 9, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 2;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(8, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
    END LOOP;
END;
/

-- Bankovnictví - manager
DECLARE
    TYPE t_tit IS VARRAY(7) OF INTEGER;
    TYPE t_eo IS VARRAY(8) OF INTEGER;
    TYPE t_jp IS VARRAY(35) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 9, 20, 23, 26, 29); 
    edus := t_eo(3, 4, 5, 7, 8, 9, 10, 11);
    jobs := t_jp(1, 2, 13, 15, 17, 25, 33, 34, 47, 48, 49, 59, 72, 75, 82, 86, 101, 105, 106, 107, 108, 125, 140, 171, 177, 192, 193, 199, 201, 204, 224, 223, 233, 242);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 8, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 54, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 2;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(8, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
    END LOOP;
END;
/ 

-- Bezpečnostní služby
DECLARE
    TYPE t_tit IS VARRAY(6) OF INTEGER;
    TYPE t_eo IS VARRAY(8) OF INTEGER;
    TYPE t_jp IS VARRAY(8) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 2, 4, 27, 28, 29); 
    edus := t_eo(3, 4, 5, 7, 8, 9, 10, 11);
    jobs := t_jp(17, 64, 65, 90, 135, 197, 233, 237);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 10, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(26, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
    END LOOP;
END;
/

-- Brýlová optika
DECLARE
    TYPE t_tit IS VARRAY(7) OF INTEGER;
    TYPE t_eo IS VARRAY(6) OF INTEGER;
    TYPE t_jp IS VARRAY(1) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 2, 4, 9, 27, 28, 29); 
    edus := t_eo(3, 4, 5, 7, 8, 9);
    jobs := t_jp(109);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 13, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
END;
/

-- Celnictví a spedice
DECLARE
    TYPE t_tit IS VARRAY(4) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(1) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 27, 28, 29); 
    edus := t_eo(3, 4, 5, 7);
    jobs := t_jp(135);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 14, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
END;
/

-- Cukrář  
DECLARE
    TYPE t_tit IS VARRAY(1) OF INTEGER;
    TYPE t_eo IS VARRAY(3) OF INTEGER;
    TYPE t_jp IS VARRAY(3) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1); 
    edus := t_eo(2, 3, 5);
    jobs := t_jp(19, 234, 238);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 15, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(12, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(13, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(28, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
    END LOOP;
END;
/

-- Čalounictví  
DECLARE
    TYPE t_tit IS VARRAY(1) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(2) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1); 
    edus := t_eo(2, 3, 4, 5);
    jobs := t_jp(29, 102);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 16, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
END;
/

-- Čísník  
DECLARE
    TYPE t_tit IS VARRAY(1) OF INTEGER;
    TYPE t_eo IS VARRAY(3) OF INTEGER;
    TYPE t_jp IS VARRAY(3) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1); 
    edus := t_eo(2, 3, 5);
    jobs := t_jp(12, 24, 234);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 17, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(12, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(14, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Daně a účetnictví  
DECLARE
    TYPE t_tit IS VARRAY(11) OF INTEGER;
    TYPE t_eo IS VARRAY(8) OF INTEGER;
    TYPE t_jp IS VARRAY(15) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 2, 4, 9, 20, 22, 23, 26, 27, 28, 29); 
    edus := t_eo(3, 5, 6, 7, 8, 9, 10, 11);
    jobs := t_jp(1, 2, 8, 15, 25, 101, 136, 170, 171, 199, 201, 204, 224, 233, 242);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 18, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 55, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 56, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 57, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 4;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
        FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(8, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Daňová a finanční správa  
DECLARE
    TYPE t_tit IS VARRAY(11) OF INTEGER;
    TYPE t_eo IS VARRAY(8) OF INTEGER;
    TYPE t_jp IS VARRAY(13) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 2, 4, 9, 20, 22, 23, 26, 27, 28, 29); 
    edus := t_eo(3, 5, 6, 7, 8, 9, 10, 11);
    jobs := t_jp(1, 2, 8, 25, 33, 34, 47, 48, 49, 136, 199, 224, 233);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 19, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);

                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
        FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(8, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Doprava  
DECLARE
    TYPE t_tit IS VARRAY(11) OF INTEGER;
    TYPE t_eo IS VARRAY(8) OF INTEGER;
    TYPE t_jp IS VARRAY(20) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(1, 2, 4, 9, 20, 22, 23, 26, 27, 28, 29); 
    edus := t_eo(3, 5, 6, 7, 8, 9, 10, 11);
    jobs := t_jp(2, 5, 6, 8, 28, 31, 33, 50, 61, 74, 113, 115, 124, 141, 161, 162, 213, 216, 233, 231);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 28, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 29, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 30, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 31, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 32, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 357, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 358, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 359, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);

                        c := c + 8;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
        FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(6, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Ekonomika a management  
DECLARE
    TYPE t_tit IS VARRAY(10) OF INTEGER;
    TYPE t_eo IS VARRAY(5) OF INTEGER;
    TYPE t_jp IS VARRAY(16) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 9, 20, 22, 23, 26, 27, 28, 29); 
    edus := t_eo(7, 8, 9, 10, 11);
    jobs := t_jp(33, 34, 47, 48, 49, 59, 105, 106, 107, 108, 125, 136, 170, 171, 224, 233);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 38, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 39, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 40, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 41, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 42, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 43, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(8, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Elektro  
DECLARE
    TYPE t_tit IS VARRAY(10) OF INTEGER;
    TYPE t_eo IS VARRAY(5) OF INTEGER;
    TYPE t_jp IS VARRAY(11) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 9, 20, 22, 23, 26, 27, 28, 29); 
    edus := t_eo(7, 8, 9, 10, 11);
    jobs := t_jp(9, 35, 36, 37, 38, 39, 40, 73, 224, 233, 237);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 44, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 45, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 46, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 47, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 48, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 49, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 6;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        
   FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(9, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(38, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(39, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
    END LOOP;
END;
/

-- Firemní ekonomika, management, obchodník  
DECLARE
    TYPE t_tit IS VARRAY(11) OF INTEGER;
    TYPE t_eo IS VARRAY(8) OF INTEGER;
    TYPE t_jp IS VARRAY(28) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 9, 20, 22, 23, 26, 27, 28, 29); 
    edus := t_eo(7, 8, 9, 10, 11);
    jobs := t_jp(33, 34, 42, 43, 47, 48, 49, 90, 91, 92, 93, 94, 105, 106, 107, 108, 161, 163, 172, 174, 175, 176, 177, 224, 232, 233, 234, 247);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 58, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 59, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 60, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 61, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 4;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(8, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Management  
DECLARE
    TYPE t_tit IS VARRAY(7) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(33) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 9, 20, 22, 23, 26); 
    edus := t_eo(8, 9, 10, 11);
    jobs := t_jp(13, 16, 34, 42, 43, 48, 68, 90, 91, 92, 93, 94, 95, 106, 107, 112, 163, 172, 174, 176, 177, 225, 226, 227, 231, 232, 233, 234, 236, 237, 238, 242, 243);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 150, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(44, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Marketing  
DECLARE
    TYPE t_tit IS VARRAY(5) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(6) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 9, 20, 22); 
    edus := t_eo(8, 9, 10, 11);
    jobs := t_jp(94, 95, 96, 97, 98, 198);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    IF 
                        (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                        (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                        (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                        (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                        (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                        (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 177, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
        FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(23, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/


-- HR  
DECLARE
    TYPE t_tit IS VARRAY(5) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(4) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 9, 20, 22); 
    edus := t_eo(8, 9, 10, 11);
    jobs := t_jp(55, 56, 57, 58);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    --IF 
                     --   (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                     --   (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                     --   (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                     --   (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                     --   (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                     --   (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    --THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 267, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    --END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(14, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- HR  
DECLARE
    TYPE t_tit IS VARRAY(5) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(4) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(2, 4, 9, 20, 22); 
    edus := t_eo(8, 9, 10, 11);
    jobs := t_jp(55, 56, 57, 58);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    --IF 
                     --   (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                     --   (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                     --   (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                     --   (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                     --   (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                     --   (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    --THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 267, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 1;
                    --END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(14, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/


-- Stavebniny
DECLARE
    TYPE t_tit IS VARRAY(8) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(32) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(6, 7, 9, 20, 22, 23, 26, 29); 
    edus := t_eo(8, 9, 10, 11);
    jobs := t_jp(1, 3, 6, 7, 28, 33, 34, 35, 39, 40, 41, 44, 50, 63, 89, 101, 113, 133, 132, 160, 161, 178, 179, 187, 189, 212, 213, 214, 215, 216, 217, 251);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    --IF 
                     --   (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                     --   (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                     --   (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                     --   (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                     --   (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                     --   (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    --THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 381, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 382, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 383, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 384, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 402, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 407, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 479, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 7;
                    --END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(36, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

-- Zdravotnictví
DECLARE
    TYPE t_tit IS VARRAY(8) OF INTEGER;
    TYPE t_eo IS VARRAY(4) OF INTEGER;
    TYPE t_jp IS VARRAY(8) OF INTEGER;
    tit t_tit;
    edus t_eo;
	jobs t_jp;
	t NUMBER;
    e NUMBER;
    j NUMBER;
	c NUMBER;
	sqlstring VARCHAR(400);
BEGIN
    c := 0;
    tit := t_tit(6, 7, 9, 20, 22, 23, 26, 29); 
    edus := t_eo(8, 9, 10, 11);
    jobs := t_jp(51, 83, 128, 248, 249, 250, 252, 253);
    FOR t IN 1..tit.count
        LOOP
        FOR e IN 1..edus.count
            LOOP
            FOR j in 1..jobs.count
                LOOP
                    --IF 
                     --   (tit(t) = 1 AND edus(e) <= 6) OR   -- NO TITLE - SOU, SOS, SPS, SS, OA
                     --   (tit(t) IN (2, 3) AND edus(e) >= 8) OR -- Bc, BcA - VS - ALL
                     --   (tit(t) IN (4, 9, 17) AND edus(e) >= 9) OR -- Ing, Mgr, VS - ALL
                     --   (tit(t) IN (6, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19) AND edus(e) = 10) OR -- Dr - VS - III
                     --   (tit(t) IN (20, 21, 22, 23, 24, 25, 26) AND edus(e) = 11) OR  -- Phd, doc - VS - IV
                     --   (tit(t) IN (27, 28, 29) AND edus(e) = 7) -- as, DiS - VOS
                    --THEN
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 23, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 24, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 25, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 474, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 475, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 476, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_TOFI(:1, :2, 477, :3); END;';
                        EXECUTE IMMEDIATE sqlstring USING tit(t), edus(e), jobs(j);
                        c := c + 7;
                    --END IF;
                END LOOP;
            END LOOP;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('Inserted: '|| c || ' rows.');
    FOR j in 1..jobs.count
    LOOP
        sqlstring := 'BEGIN GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(46, :1); END;';
        EXECUTE IMMEDIATE sqlstring USING jobs(j);
        --DBMS_OUTPUT.PUT_LINE(sqlstring);
    END LOOP;
END;
/

COMMIT;