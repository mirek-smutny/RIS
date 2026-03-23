----- These MViews are splitting G_ORGANIZATION Names of self-employed people into Name and Surname of R_WORKERS

CREATE MATERIALIZED VIEW RIS.R_FIND_COMPANY_BY_TOFI_MV 
TABLESPACE RIS_DATA 
AS 
SELECT
        --ID_TOFI
        ID_JP
        ,ID_JI
        ,CIN
        ,DOE
    FROM
        (
            SELECT
                    --tf.ID_TOFI
                    ip.ID_JP
                    ,ji.ID_JI
                    ,comp.CIN
                    ,comp.DOE
                FROM 
                    --GSD.G_TOFI tf
                    --JOIN GSD.G_JOB_POSITION jp ON tf.ID_JP=jp.ID_JP
                    GSD.G_JOB_POSITION jp
                    JOIN GSD.G_INDUSTRY_POSITION ip ON ip.ID_JP=jp.ID_JP
                    JOIN GSD.G_JOB_INDUSTRY ji ON ip.ID_JI=ji.ID_JI
                    JOIN GSD.G_COMPANY_INDUSTRY ci ON ji.ID_JI=ci.ID_JI
                    JOIN RIS.R_COMPANY comp ON ci.CIN=comp.CIN
        )
;
;

EXEC DBMS_STATS.GATHER_TABLE_STATS(ownname=>'RIS', tabname=>'R_FIND_COMPANY_BY_TOFI_MV');
    
CREATE INDEX RIS.R_FIND_COMPANY_BY_TOFI_MV_DOE_IDX ON RIS.R_FIND_COMPANY_BY_TOFI_MV (DOE) TABLESPACE RIS_INDEX;
CREATE INDEX RIS.R_FIND_COMPANY_BY_TOFI_MV_TOFI_IDX ON RIS.R_FIND_COMPANY_BY_TOFI_MV (ID_TOFI) TABLESPACE RIS_INDEX;
