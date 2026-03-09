PROMPT ############### - INSERTS INTO GSD.G_COMPANY_TYPE - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_COMPANY_TYPE ('s.r.o', 'společnost s ručeným omezeným'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_COMPANY_TYPE ('a.s.', 'akciová společnost');             
EXECUTE GSD.G_INS_GSD_PCK.SP_COMPANY_TYPE ('o.s.', 'osobní společnost');             
EXECUTE GSD.G_INS_GSD_PCK.SP_COMPANY_TYPE ('v.o.s.', 'veřejná obchodní společnost');  
EXECUTE GSD.G_INS_GSD_PCK.SP_COMPANY_TYPE ('k.s.', 'komanditní společnost');          
--5
EXECUTE GSD.G_INS_GSD_PCK.SP_COMPANY_TYPE ('s.p.', 'sdružení podnikatelů');            


PROMPT ############### - INSERTS INTO GSD.G_JOB_TYPE - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_TYPE ('HPP', 'Hlavní pracovní poměr');              
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_TYPE ('DPČ', 'Dohoda o provedení činnosti');        
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_TYPE ('DPP', 'Dohoda o provedení práce');

PROMPT ############### - INSERTS INTO GSD.G_LANGUAGE - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('CZ', 'Čeština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('SK', 'Slovenština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('EN', 'Angličtina');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('DE', 'Němčina');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('FR', 'Francouzština');
--5
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('ES', 'Španělština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('PT', 'Portugalština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('IT', 'Italština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('RU', 'Ruština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('PL', 'Polština');
--10
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('LT', 'Litevština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('LV', 'Lotyština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('HU', 'Maďarština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('UK', 'Ukrajinština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('JP', 'Japonština');
--15
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('KO', 'Korejština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('TH', 'Thajština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('VI', 'Vietnamština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('ZH', 'Čínština');
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('TR', 'Turečtina');
--20
EXECUTE GSD.G_INS_GSD_PCK.SP_LANGUAGE('SV', 'Švédština');
--21
         

PROMPT ############### - INSERTS INTO GSD.G_JOB_INDUSTRY - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Administrativa', 'Administativa');             
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Automotive', 'Automobilový průmysl');                
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Bankovnictví', 'Bankovní a finanční služby');  
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Cestovní ruch', 'Cestovní ruch'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Desing', 'Vývoj a design');             
-- 5
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Doprava', 'Doprava, logistika, zásobování'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Ekologie', 'Ekologie'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Ekonomika', 'Ekonomika a podnikové finance');  
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Elektro', 'Elektrotechnika a energetika');     
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Farmacie', 'Farmaceutický průmysl');
-- 10
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Fotografie', 'Fotografie');           
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Gastronomie', 'Restaurační a gastronomické služby');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Hotelnictví', 'Hotelové služby');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('HR', 'Personalistika, HR služby');        
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Chemie', 'Chemický průmysl');         
-- 15
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('IT - Analýza', 'Analýza, konzultace, projektové řízení v IT'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('IT - Správa', 'Administrace, správa software a hardware v IT');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('IT - DevOps', 'Vývoj aplikací a systémů v IT');                
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Jakost', 'Kvalita a kontrola jakosti');  
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Kultura', 'Kultura, umění a tvůrčí práce');         
-- 20
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Kovářství', 'Kultura, umění a tvůrčí práce');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Lesnictví', 'Lesnický a dřevařský průmysl');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Marketing', 'Marketing, reklama');                  
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Média', 'Žurnalistika a média');                                          
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Public Relations', 'Vztah s veřejností');
-- 25
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Ostraha a bezpečnost', 'Security, bezpečnostní služby');                        
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Pojišťovnictví', 'Pojištovací služby');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Potraviny', 'Potravinářský průmysl, prodej');            
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Právní služby', 'Právo, advokátní kanceláře');           
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Prodej a obchod', 'Prodej a nákup produktů společnosti');                                   
-- 30
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Reality', 'Realitní kanceláře');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Řemesla', 'Jiné řemesla');                                   
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Služby', 'Jiné');          
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Sociální služby', 'Pracovníci sociálních služeb');                               
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Státní správa', 'Státní a veřejná správa');              
-- 35
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Stavebnictví', 'Stavební průmysl'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Školství', 'Vzdělávání, pedagogika a školství');                                          
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Strojírenství', 'Výroba ve strojním průmyslu');            
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Telekomunikace', 'Telekomunikace, telefonní operátoři');                                        
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Tisk', 'Vydavatelé, tisk, polygrafie');
-- 40
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Truhlářství', 'Truhlářské a dřevařské práce');                    
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Výroba a průmysl', 'Výrobní a technický průmysl');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Věda a výzkum', 'Technický a výzkumový rozvoj');                                     
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Vrcholový management', 'Jiné');                                                  
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Zákaznický servis', 'Call centra, operátoři');           
-- 45
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Zdravotnictví', 'Lékaři, zdravotní sestry');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_INDUSTRY ('Zemědělství', 'Zěmědělský průmysl'); 
-- 47

PROMPT ############### - INSERT INTO GSD.G_JOB_POSITION - #################
-- SP_JOB_POSITION      (name VARCHAR, long_name VARCHAR)

EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Account executive', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Account manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Administrativní pracovník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Administrátor internetového obchodu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Aranžér, dekorátor', '-');
-- 5
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Architekt', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Asistent', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Asistent daňového poradce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Autoelektrikář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Autoklempíř', '-');
-- 10
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Automechanik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Barman', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Brand manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Business Inteligence specialista', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Compliance specialista', '-');
-- 15
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Contract Manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Controller', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('CRM specialista', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Cukrář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Chemický inženýr', '-');
-- 20
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Chemický laborant', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Chemik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Chovatel, ošetřovatel zvířat', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Číšník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Daňový poradce', '-');
-- 25
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Databázový administrátor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Databázový analytik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Dělník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Designér', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Disponent', '-');
-- 30
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Dopravní inženýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Dřevařský technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Ekonom', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Ekonomický/finanční ředitel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Elektrikář', '-');
-- 35
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Elektromechanik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Elektronik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Elektromontér', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Elektrotechnický inženýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Elektrotechnik', '-');
-- 40
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Energetik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Event manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Facility manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Fakturant', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Farmaceut', '-');
-- 45
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Farmaceutický laborant', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Finanční analytik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Finanční manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Finanční poradce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Frézař', '-');
--50
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Fyzioterapeut', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Grafik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Hasič', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Helpdesk operátor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('HR asistent', '-');
--55
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('HR Business Partner', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('HR generalist', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('HR Koordinátor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Hypoteční specialista', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('ICT specialista', '-');
--60
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Inspektor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Instalatér', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Interní auditor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Inženýr kvality', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('IT analytik', '-');
--65
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('IT architekt', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('IT konzultant', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('IT manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('IT tester', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Kadeřník', '-');
--70
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Klempíř', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Klientský pracovník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Konstruktér', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Kontrolor kvality', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Konzultant', '-');
--75
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Koordinátor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Kosmetik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Kuchař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Kurýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Laborant', '-');
--80
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Lakýrník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Leasingový poradce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Lékař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Lektor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Letuška', '-');
--85
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Likvidátor škod', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Logistik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Makléř', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Malíř', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Manažer bezpečnostní služby', '-');
--90
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Manažer call centra', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Manažer kvality', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Manažer logistiky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Manažer reklamačního oddělení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Marketinový manažer', '-');
--95
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Marketingový pracovník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Marketingový ředitel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Marketingový specialista', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Mikrobiolog', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Montážník', '-');
--100
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Mzdový účetní', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Nábytkář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Nákupčí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Nástrojař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Obchodní analytik', '-');
--105
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Obchodní manažer', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Obchodní ředitel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Obchodní zástupce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Oční optik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Odborný prodejce', '-');
--110
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Oděvní návrhář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Office manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Operátor stavebních strojů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Operátor ve výrobě', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Opravář', '-');
--115
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Osobní bankéř', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Palubní průvodčí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Pečovatel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Personalista', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Personální konzultant', '-');
--120
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Personální manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Pilot', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Plánovač kvality', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Plánovač výroby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Pojištovací poradce', '-');
--125
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Pokladník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Pomocný kuchař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Porodní asistent', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Poštovní doručovatel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Potravinářský inženýr', '-');
--130
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Potravinářský technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Potrubář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Požární technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('PR manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Pracovník bezpečnostní služby', '-');
--135
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Pracovník platebního styku', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Pracovník reklamačního oddělení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Právník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Přijímací technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Privátní bankéř', '-');
--140
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Procesní inženýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Prodavač', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Prodejce letenek', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Prodejce zájezdů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Produktový manažer', '-');
--145
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Produktový manažer v IT', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor .NET', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor C', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor C#', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor C++', '-');
--150
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor CNC', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor Java', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor Javascript', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor Oracle', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor Perl', '-');
--155
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor PHP', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor PLC', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor průmyslových robotů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Programátor Python', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Projektant', '-');
--160
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Projektový manažer', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Provozář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Provozní manažer', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Průvodce v cestovním ruchu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Radiologický asistent', '-');
--165
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Realitní makléř', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Recepční', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Recruiter', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Referent', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Referent správy pohledávek', '-');
--170
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Referent zúčtování', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Regionální manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Revizní technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Risk manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Ředitel kvality a ISO', '-');
--175
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Ředitel logistiky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Ředitel pobočky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Řidič', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Řidič kamionu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Řidič vysokozdvižného vozíku', '-');
--180
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Sádrokartonář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Sanitář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Sekretářka', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('SEO analytik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Seřizovač strojů', '-');
--185
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Servisní inženýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Servisní technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Simulační inženýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Skladník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Sociální pracovník', '-');
--190
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Softwarový inženýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista back office', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista fakturace a plateb', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista finančních trhů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista interní komunikace', '-');
--195
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista ISO', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista IT bezpečnosti', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista marketingových analýz', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista odměňování a benefitů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista podpory zákazníků', '-');
--200
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista pohledávek', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista pro veřejné zakázky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista provozu sítí a služeb', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista reportingu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista strategie sítě', '-');
--205
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista technické podpory', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista vývoje produktu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Specialista vývoje telekomunikačních produktů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Správce budov', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Správce informačního systému', '-');
--210
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Správce počítačové sítě', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Statistik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Stavbyvedoucí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Stavební dozor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Stavební inženýr', '-');
--215
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Stavební mistr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Stavební technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Strojní inženýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Strojní zámečník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Strojník', '-');
--220
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Supervizor call centra', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Systémový administrátor', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Systémový inženýr', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Team leader', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Technický manager', '-');
--225
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Technický pracovník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Technický ředitel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Tiskař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Účetní', '-');
--230
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vedoucí dopravy', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vedoucí nákupu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vedoucí oddělení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vedoucí prodejny/provozu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vedoucí servisu', '-');
--235
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vedoucí skladu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vedoucí technického oddělení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vedoucí výroby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Veterinární lékař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vizualista', '-');
--240
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Vychovatel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Výkonný ředitel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Výrobní ředitel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Výzkumný a vědecký pracovník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Web designér', '-');
--245
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Zahradník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Zástupce vedoucího prodejny', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Zdravotnický asistent', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Zdravotnický laborant', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Zdravotnický záchranář', '-');
--250
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Zedník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Zubní asistent', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_JOB_POSITION('Zubní lékař', '-');
--253
PROMPT ############### - INSERT INTO GSD.G_INDUSTRY_POSITION - #################

-- SP_INDUSTRY_POSITION      (id_ji NUMBER, id_jp NUMBER)
-- Administrativa
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(1, 3);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(1, 7);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(1, 8);

-- Automotive
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(2, 9);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(2, 10);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(2, 11);

-- Bankovnictví
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, 1);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, 2);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, 3);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, 7);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, 8);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, 13);
EXECUTE GSD.G_INS_GSD_PCK.SP_INDUSTRY_POSITION(3, 14);


PROMPT ############### - INSERTS INTO GSD.G_WORKER_STATUS - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_WORKER_STATUS ('Aktivní', 'Aktivně hledá novou práci, příchozí nabídky vítá.'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_WORKER_STATUS ('Pasivní', 'Nehledá aktivně práci, příchozí nabídky vítá.');     
EXECUTE GSD.G_INS_GSD_PCK.SP_WORKER_STATUS ('Neaktivní', 'Nehledá aktivně práci, příchozí nabídky zváží.');  
EXECUTE GSD.G_INS_GSD_PCK.SP_WORKER_STATUS ('Uzavřený', 'Nehledá práci, příchozí nabídky nezvažuje.');       

PROMPT ############### - INSERTS INTO GSD.G_EVALUATION - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_EVALUATION ('Začátečník', 'Slabší znalosti a zkušenosti');    
EXECUTE GSD.G_INS_GSD_PCK.SP_EVALUATION ('Průměrný - znalý', 'Průměrné znalosti');         
EXECUTE GSD.G_INS_GSD_PCK.SP_EVALUATION ('Průměrný - zkušený', 'Průměrné zkušenosti');     
EXECUTE GSD.G_INS_GSD_PCK.SP_EVALUATION ('Znalý', 'Částečné znalosti a zkušenosti');       
EXECUTE GSD.G_INS_GSD_PCK.SP_EVALUATION ('Pokročilý', 'Slušné znalosti a zkušenosti');
--5     
EXECUTE GSD.G_INS_GSD_PCK.SP_EVALUATION ('Zkušený', 'Velmi dobré znalosti a zkušenosti');  
EXECUTE GSD.G_INS_GSD_PCK.SP_EVALUATION ('Excelentní', 'Vynikající znalosti a zkušenosti');
--7
PROMPT ############### - INSERTS INTO GSD.G_TITLE - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('-', '-----', 'F', 1);                           
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('Bc.', 'Bakalář', 'F', 2);                       
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('BcA.', 'Bakalář umění', 'F', 2);                                                                                                      
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('Ing.', 'Inženýr', 'F', 3);                      
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('Ing. arch.', 'Inženýr architekt', 'F', 3);      
--5
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('MUDr.', 'Doktor medicíny', 'F', 3);             
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('MDDr.', 'Doktor zubního lékařství', 'F', 3);    
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('MVDr.', 'Doktor veterinární medicíny', 'F', 3); 
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('Mgr.', 'Magistr', 'F', 3);                      
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('MgA.', 'Magistr umění', 'F', 3);                
--10
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('JUDr.', 'Doktor práv', 'F', 3);                 
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('PhDr.', 'Doktor filozofie', 'F', 3);            
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('RNDr.', 'Doktor přírodních věd', 'F', 3);        
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('PharmDr.', 'Doktor farmacie', 'F', 3);          
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('MSDr.','Doktor zubní medicíny', 'F', 3);       
--15
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('PaedDr.', 'Doktor pedagogiky', 'F', 3);         
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('PhMr.', 'Magistr farmacie', 'F', 3);            
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('RCDr.', 'Doktor obchodních věd', 'F', 3);       
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('RTDr.', 'Doktor technických věd', 'F', 3);              
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('Ph.D.', 'Doktor', 'A', 4);                      
--20
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('CSc.', 'Kandidát věd', 'A', 4);
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('prof.', 'Profesor', 'F', 5);                 
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('Dr.', 'Doktor', 'F', 4);
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('dr. h. c', 'Čestný doktor', 'F', 6);            
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('prof. h. c.', 'Čestný profesor', 'F', 6);                        
--25         
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('doc.', 'Docent', 'F', 5);                       
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('as.', 'Asistent', 'A', 0);                      
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('odb. as.', 'Odborný asistent', 'A', 0);                    
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('DiS.', 'Diplomovaný specialista', 'A', 0);   
EXECUTE GSD.G_INS_GSD_PCK.SP_TITLE ('---', 'Nevyplněno', 'A', 0); 
--30      

PROMPT ############### - INSERTS INTO GSD.G_EDU_ORG_TYPE - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('ZŠ', 'Základní škola', 1);                  
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('SOU', 'Střední odborné učiliště', 1);       
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('SŠ', 'Střední škola', 1);                   
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('SPŠ', 'Střední průmyslová škola', 1);       
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('SOŠ', 'Střední odborná škola', 1);          
--5
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('OA', 'Obchodní akademie', 1);               
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('VOŠ', 'Vyšší odborné školy', 0);            
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('VŠ - I', 'Vysoká škola - bakalářský stupeň', 2);    
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('VŠ - II', 'Vysoká škola - magisterský stupeň', 3);  
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('VŠ - III', 'Vysoká škola - doktorský stupeň', 4);   
--10
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_ORG_TYPE ('VŠ - IV', 'Vysoká škola - postgraduální stupeň', 5);
--11

PROMPT ############### - INSERTS INTO GSD.G_EDU_FIELD_TYPE - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Administrativa a ekonomika pro podnikání', 'Administrativa a ekonomika pro podnikání');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Autoelektrikář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Autolakýrník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Automechanik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Automatizace a informatika', '-');
--5
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Automatizace chemický procesů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Bankovnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Bankovnictví - manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Bankovnictví finance', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Bezpečnostní služby', '-');
--10
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Bezpečnostně právní činnost', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Brusič skla', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Brýlová optika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Celnictví a spedice', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Cukrář', '-');
--15
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Čalounictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Číšník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Daně a účetnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Daňová a finanční správa', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dělník technických služeb', '-');
--20
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Desing interiéru', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Diagnostika silničních vozidel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Diplomovaná denttální hygienistka', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Diplomovaná všeobecná sestra', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Diplomovaný oční optik', '-');
--25
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Diplomovaný zdravotní laborant', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dlaždič', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Doprava', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dopravně bezpečnostní činnost', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dopravní logistika a obchod', '-');
--30
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dopravní provoz', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dopravní stavitelství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Drůbežář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dřevařská výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dřevařské práce', '-');
--35
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Dřevěné konstrukce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ekologie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ekonomika a management', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ekonomika a podnikání', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ekonomika a zahraniční obchod', '-');
--40
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ekonomika obchodu a služeb', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ekonomika a řízení strojírenské výroby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ekonomika zemědělství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Elektrikář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Elektromechanik', '-');
--45
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Elektronická a sdělovací zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Elektronika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Elektrotechnická výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Elektronika a strojírenství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Energetika', '-');
--50
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Facility management', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Farmaceutická výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Farmářské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Finance a bankovnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Finance a daně', '-');
--55
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Finance a účetnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Finance a poradenství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Firemní ekonom', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Firemní management', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Firemní obchodník', '-');
--60
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Firemní ekonomika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Fyzioterapie zvířat', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Gastronomie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Gastronomie a hotelnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Gastronomie a služby cestovního ruchu', '-');
--65
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Geodézie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Geotechnika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Grafický desing', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Grafika v reklamní praxi', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Hodinář', '-');
--70
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Hornictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Horník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Hostinský', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Hotelnictví a turismus', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Hotelová škola - management cestovního ruchu', '-');
--75
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Charitativní služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Chemická technologie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Chemická výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Chemik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Chemik operátor - průmyslová chemie', '-');
--80
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Chovatelství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Chovatel cizokrajných zvířat', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Chovatel laboratorních zvířat', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Informační a komunikační systémy', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Informační management', '-');
--85
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Informační technologie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Informační technologie v podnikové praxi', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Informační technologie ve strojírenství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Informatika v ekonomice', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Informatika ve státní správě', '-');
--90
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Instalatér', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Instalatér - zdravotní instalace', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Interaktivní grafika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Interiérový desing', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Inženýrské stavitelství', '-');
--95
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Inženýrské stavitelství - dopravní stavitelství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Inženýrské stavitelství - vodní stavby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Jakost a metrologie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kadeřník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kamenosochařství', '-');
--100
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Karosář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kartáčník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Keramická výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Keramický průmysl', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Keramik', '-');
--105
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Klempíř', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Knihař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Knikupectví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Knižní grafika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Komerční práva', '-');
--110
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Konstrukce a tvorba nábytku', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Konzervace a restaurování kamene', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Konzervace a restaurování nástěnné malby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Konzervář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kosmetické služby', '-');
--115
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kovář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kovářské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kožedělná výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kožedělná výroba - obuvnická montáž', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kožedělná výroba - výroba usní a kožešin', '-');
--120
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Koželužský chemik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kožešnická výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kožešník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Krejčí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Krejčí pro modelovou výrobu', '-');
--125
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kresba a ilustrace v médiích', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Krizové řízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kuchař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kuchař - čísník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Kuchařské práce', '-');
--130
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Květinářské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Laborant pro farmaceutickou výrobu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Laboratorní asistent', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Lakýrník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Lékařská elektronika', '-');
--135
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Lektorská pedagogika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Lesní hospodářství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Lesní výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Lesnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Letecká výzbroj', '-');
--140
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Letecký mechanik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Letištní technické zabezpečení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Lodní doprava', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Lodník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Logistické a finanční služby', '-');
--145
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Malíř', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Malíř a lakýrník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Malíř skla a keramiky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Malířské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management', '-');
--150
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management a logistika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management a turismus', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management administrativy a správy', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management cestovního ruchu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management dopravy, pošt a telekomunikací', '-');
--155
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management drobného podnikání a obchodu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management elektrotechniky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management hotelového provozu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management chemických výrob a spotřební chemie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management jakosti ve strojírenské výrobě a službách', '-');
--160
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management lidských zdrojů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management obchodních firem', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management obchodu a služeb', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management potravinářství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management sklářství', '-');
--165
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management strojírenství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management textilu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management turismu a služeb', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management v dopravě', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management v elektrotechnice', '-');
--170
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management v oblasti životního prostředí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management v zemědělství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management ve stavebnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management výpočetní techniky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management zpracování kůže, plastů, pryže a výroba obuvi', '-');
--175
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Management provozu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Marketing', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Marketing výpočetní techniky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mediální komunikace', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik', '-');
--180
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik - elektrotechnika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik - chladící zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik - stroje a zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik elektronických systémů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik elektronik - časoměrná zařízení', '-');
--185
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik elektronik - optoelektrická zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik elektronik - přenosová zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik elektronik - spotřební elektronika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik elektronik - telekomunikační zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik elektronik - zdravotnická elektronika', '-');
--190
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik instalatérských a elektronických zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik letadlových přístrojů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik měřící, regulační a automatizační techniky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik opravář - důlní stroje a zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik opravář - kolejová vozidla', '-');
--195
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik opravář - letadla', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik opravář - požární technika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik opravář - stroje a zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik opravář - zemědělská technika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik plynových zařízení', '-');
--200
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik seřizovač - mechatronik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik seřizovač - stavební stroje', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik silničních strojů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanik telekomunikační techniky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanizace a služby', '-');
--205
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanizace a služby - provoz a služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mechanizátor lesní výroby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Měřící a výpočetní technika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Metody a technika informační práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mezinárodní obchod', '-');
--210
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mezinárodní obchod, logistické a finanční služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mezinárodní obchodní styk', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Mlékařské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Modelář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Modelování pletenin', '-');
--215
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Montér vodopotrubář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Multimediální internetové služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Multimediální tvorba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Multimediální tvorba v reklamě', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Nábytkářská a dřevařská výroba', '-');
--220
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Nábytkářství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Nástrojař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Nožířské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obalová technika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchod a marketing', '-');
--225
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchod a právo v obchodu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchodní manager', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchodní podnikání', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchodní pracovník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchodní pracovník - chemické zboží', '-');
--230
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchodní pracovník - technické zboží', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchodní provoz', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obchodník v dopravě', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obnova a rozvoj venkova', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obráběcí práce', '-');
--235
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obráběč', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obrábění kovů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obrazová a zvuková technika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Obuvnická technologie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Oční optik', '-');
--245
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Oční technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ochrana a obnova životního prostředí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ochrana osob a majetku', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ochrana přírody a prostředí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ochrana vojsk a obyvatelstva při krizových situacích', '-');
--250
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Operátor farmaceutické výroby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Operátor oděvní výroby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Operátor provozu a ekonomika dopravy', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Operátor skladování', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Operátor textilní výroby', '-');
--255
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Operátor zemědělské techniky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Opravář lesnických strojů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Opravář zemědělských strojů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Optik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Optik - přístrojová technika', '-');
--260
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Optimalizace strojírenských technologií', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Organizace a řízení ve stavebnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Organizace a správa péče o životní prostředí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ortopedická proteika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ortopedická výroba', '-');
--265
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Ošetřovatel', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pečovatelské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pedagogika - vychovatelství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pedagogické lyceum', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pedagogika volného času', '-');
--270
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pekař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Personalistika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pěstitel - ovocnářství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pěstitel - vinohradnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pěstitelství', '-');
--275
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Plynárenství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Počítačové grafika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Počítačová grafika v řízení podniku', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Počítačové systémy', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Počítačové zpracování informací', '-');
--280
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání a management', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání a obchod', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání a služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání v oborech strojírenství', '-');
--285
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání v oborech stavebnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání v oborech zemědělství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání v oborech technické chemie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikání, obchod a služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikatelství pro hotely a cestovní ruch', '-');
--290
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Podnikové finance', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pojišťovnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pokrývač', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Policejní činnost', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Politickosprávní administrativa', '-');
--295
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Polygrafická výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Polygraf', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Polygrafie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Poštovní a peněžní služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Potravinářská technologie', '-');
--300
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Potravinářská výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Potravinářské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Povrchová úprava', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pozemní stavby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pozemní stavitelství', '-');
--305
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Požární ochrana', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Požární technika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pracovník cestovní kanceláře', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Pracovník cestovního ruchu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Praktická sestra', '-');
--310
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Právní administrativa', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Právní asistence', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Právní činnost', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Právo a mezinárodní obchod', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Právo komerční', '-');
--315
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Prevence kriminality', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Prevence rizik a záchranářství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Programování', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Projektové řízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Propagace', '-');
--320
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Propagační a reklamní tvorba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Propagační výtvarnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provoz a ekonomika dopravy', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provoz a ekonomika letecké dopravy', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provoz a opravy výzbrojního materiálu', '-');
--325
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provoz domácnosti', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provoz letecké techniky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provoz obchodu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provoz služeb', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provoz strojů a zařízení', '-');
--330
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provozní chemie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provozní chemik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Provozní služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Průmyslová ekologie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Průmyslová chemie', '-');
--335
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Průvodce pro cestovní kanceláře', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Průmyslový desing', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Přenos a zpracování informací', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Příprava a realizace staveb', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Public Relations', '-');
--340
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Puškař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Radiotechnické zabezpečení letectva', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Radiové komunnikační systémy, rádiové spojení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Regionální cestovní ruch', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Regionální správa a Evropská unie', '-');
--345
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Reklamní a agenturní služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Reklamní tvorba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Reprodukční grafik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Restaurování kovů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Restarování nábytku', '-');
--350
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řezbářství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řeznické a uzenářské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řezník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řídící technika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řízení a kontrola výroby', '-');
--355
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řízení a zabezpečení jakosti', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řízení hotelového provozu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řízení chemických výrob', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řízení jakosti ve strojírenské výrobě', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Řízení výroby', '-');
--360                                                       
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sestra pro intenzivní péči', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Silničář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Silniční doprava', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Silniční stavitelství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sklář', '-');
--365   
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sklářská výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sklenář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sklenářské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Slévač', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Slévárenství', '-');                                                                           
--370
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Služby cestovního ruchu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sociálně právní činnost', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sociální činnost', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sociální pedagogika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sociální pojištovnictví', '-');
--375
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sociální služb', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Sochařská tvorba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Speciální pedagogika ve vězenšké službě', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Spojový mechanik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Spojový provoz', '-');
--380
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Správa nemovitostí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Správa informačních systémů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Správce počítačových sítí', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Stavba obráběcích strojů', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Správní činnost', '-');
--385
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Stavební materiály', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Stavební práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Stavebnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Stavitel komunikací', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Strojírenská výroba', '-');
--390
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Strojírenská zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Strojírenské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Strojírenský management', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Strojírenství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Strojní kovář', '-');
--395
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Strojní mechanik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Strojník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Systémový administrátor IT', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technická administrativa', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technická chemie', '-');
--400
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technická zařízení budov', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technické a informační služby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technickoadministrativní práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technik puškař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technik dřevařské a nábytkářské výroby', '-');
--405
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technik modelářských zařízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technik stavebního provozu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technik radiotechnického průzkumu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Techologie a hygiena potravin', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technologie elektroniky', '-');
--410
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technologie skla', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technologie stavebních pojiv', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Technologie výroby keramiky a porcelánu', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Telekomunikace', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Telekomunikační mechanik', '-');
--415
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Teorie a praxe multimediální tvorby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Textilní průmysl', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Textilní výtvarník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Textilnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Tkladlec', '-');
--420
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Tkalcovské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Truhlář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Truhlářské práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Turismus', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Tvarování dřeva a řezbářství', '-');
--425
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Tvarování průmyslových výrobků', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Účetnictví a daně', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Účetnictví a finance', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Účetnictví a finanční řízení', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Učitelství pro mateřské školy', '-');
--430
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Včelař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vědecké informace a knihovnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Veřejná správa', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Veřejná správa a regionální rozvoj', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Veřejně správní činnost', '-');
--435
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Veřejnoprávní ochrana', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Veřejnosprávní činnost', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Veřejnosprávní činnost s podporou ICT', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Veterinární prevence', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Veterinářství', '-');
--440
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vinohradnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Virtuální grafika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vlasová kosmetika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vodař', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vodní hospodářství', '-');
--445
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vodohospodářské stavby', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vojenské lyceum', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Všeobecná sestra', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vychovatelství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Vychovatelství pro vězeňskou službu', '-');
--450
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výpočetní systémy', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výpočetní technika', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výpočetní technika a programování', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výpočetní technika a zpracování informací', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výroba a zpracování papíru', '-');
--455
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výroba kancelářských potřeba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výroba obuvi', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výroba stavebních hmot', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výroba usní', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výrobce a dekoratér keramiky', '-');
--460
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výrobce potravin', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výrobní a řídící systémy podniku', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výrobní technologie ve strojírenství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Výzbroj PLRV (protiletadlového, raketového vojska)', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Wellness specialista', '-');
--465
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zabezpečovací a sdělovací technika v dopravě', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zabezpečovací technika a bezpečnostní technologie', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zahradnické práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zahradnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zahraniční obchod', '-');
--470
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Základní škola', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Základy podnikání', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zámečnické práce a údržba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zámečník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zařízení sdělovací techniky', '-');
--475
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zařízení silnoproudé elektroniky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zbraně a munice', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zdravotní laborant', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zdravnotnický asistent', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zdravotnický záchranář', '-');
--480
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zdravotnictví', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zdravotník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zednické práce', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zedník', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zemědělec', '-');
--485
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zemědělská výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zemědělská výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zemědělské podnikání', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zemědělství', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zpracování dřeva', '-');
--490
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zpracování ekonomických dat', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zpracování masa', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zpracování mouky', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zpracování technické dokumentace', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zpracovatel dřeva', '-');
--495
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Zubní technik', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Železničář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Železobetonář', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Živočisná výroba', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_EDU_FIELD_TYPE ('Žurnalistika', '-');
--500


PROMPT ############### - INSERTS INTO GSD.G_RULE_TYPES - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('LVL_0'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('LVL_1');  
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('LVL_2');  
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('LVL_3');     
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('LVL_4');  
--5  
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('LVL_5');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('LVL_6');  
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('WH_1');   
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('WH_2');   
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('WH_3');   
--10
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('WH_4');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('WH_5');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('WH_6');   
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('WH_7');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('WH_8');
--15 
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('RETIRE_M');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('RETIRE_W'); 
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('EMAIL');    
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('TITLE_REQUESTED');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('CV_NAME');
--20
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('SKILLS_1');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('SKILLS_2');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('SKILLS_3');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('SKILLS_4');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('SKILLS_5');
--25
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('SKILLS_6');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('SKILLS_7');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('DUR_LVL_0');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('DUR_LVL_1');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('DUR_LVL_2');
--30
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('DUR_LVL_3');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('DUR_LVL_4');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('DUR_LVL_5');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('DUR_LVL_6');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_M_1');
--35
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_M_2');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_M_3');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_M_4');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_M_5');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_M_6');
--40
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_M_7');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_F_1');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_F_2');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_F_3');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_F_4');
--45
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_F_5');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_F_6');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULE_TYPES('REFERENCE_F_7');
--48

PROMPT ############### - INSERTS INTO GSD.G_RULES - ###############
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(1, 18, 19);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(2, 19, 22);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(3, 22, 25);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(4, 25, 27);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(5, 28, 29);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(6, 30, 39);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(7, 40, 50);

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(8, 18, 24);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(9, 24, 30);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(10, 30, 36);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(11, 36, 42);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(12, 42, 46);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(13, 46, 52);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(14, 52, 58);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(15, 58, 64);


EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(16, 65, 70);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(17, 62, 68);


-- Gmail
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd@gmail.com', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd$year_rnd@gmail.com', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd.$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd.$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd.$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd.$year_rnd@gmail.com', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd-$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd-$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd-$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd-$year_rnd@gmail.com', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd_$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd_$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd_$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd_$year_rnd@gmail.com', '');


EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd@gmail.com', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd$year_rnd@gmail.com', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd.$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd.$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd.$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd.$year_rnd@gmail.com', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd-$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd-$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd-$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd-$year_rnd@gmail.com', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd_$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd_$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd_$year_rnd@gmail.com', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd_$year_rnd@gmail.com', '');


-- Seznam
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd@seznam.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd$year_rnd@seznam.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd.$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd.$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd.$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd.$year_rnd@seznam.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd-$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd-$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd-$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd-$year_rnd@seznam.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd_$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd_$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd_$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd_$year_rnd@seznam.cz', '');


EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd@seznam.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd$year_rnd@seznam.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd.$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd.$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd.$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd.$year_rnd@seznam.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd-$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd-$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd-$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd-$year_rnd@seznam.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd_$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd_$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd_$year_rnd@seznam.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd_$year_rnd@seznam.cz', '');

-- Email
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd@email.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd$year_rnd@email.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd.$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd.$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd.$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd.$year_rnd@email.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd-$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd-$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd-$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd-$year_rnd@email.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd_$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd_$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd_$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd_$year_rnd@email.cz', '');


EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd@email.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd$year_rnd@email.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd.$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd.$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd.$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd.$year_rnd@email.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd-$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd-$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd-$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd-$year_rnd@email.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd_$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd_$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd_$year_rnd@email.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd_$year_rnd@email.cz', '');


-- Hotmail
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd@hotmail.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd$year_rnd@hotmail.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd.$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd.$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd.$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd.$year_rnd@hotmail.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd-$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd-$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd-$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd-$year_rnd@hotmail.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd_$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd_$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd_$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd_$year_rnd@hotmail.cz', '');


EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd@hotmail.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd$year_rnd@hotmail.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd.$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd.$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd.$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd.$year_rnd@hotmail.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd-$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd-$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd-$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd-$year_rnd@hotmail.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd_$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd_$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd_$year_rnd@hotmail.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd_$year_rnd@hotmail.cz', '');

-- Centrum                                     
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd@centrum.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd$year_rnd@centrum.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd.$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd.$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd.$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd.$year_rnd@centrum.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd-$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd-$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd-$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd-$year_rnd@centrum.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd$surname_rnd_$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd.$surname_rnd_$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd-$surname_rnd_$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$name_rnd_$surname_rnd_$year_rnd@centrum.cz', '');


EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd@centrum.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd$year_rnd@centrum.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd.$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd.$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd.$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd.$year_rnd@centrum.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd-$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd-$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd-$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd-$year_rnd@centrum.cz', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd$name_rnd_$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd.$name_rnd_$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd-$name_rnd_$year_rnd@centrum.cz', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(18, '$surname_rnd_$name_rnd_$year_rnd@centrum.cz', '');

-- END of Email

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'Bc.', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'Ing.', 'Bc.');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'Mgr.', 'Bc.');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'Ph.D.', 'Ing.');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'Ph.D.', 'Mgr.');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'prof.', 'Ph.D.');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'doc.', 'prof.');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'DiS.', '-');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(19, 'odb. as.', '-');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(20, '$surname $name - životopis - $cnt', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(20, '$surname $name - životopis $cnt', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(20, '$name $surname - životopis - $cnt', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(20, '$name $surname - životopis $cnt', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(20, '$name $surname - CV $cnt', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(20, '$name $surname - CV - $cnt', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(20, '$surname $name - CV $cnt', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(20, '$surname $name - CV - $cnt', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(21, 19, 21);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(22, 22, 25);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(23, 26, 29);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(24, 30, 33);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(25, 34, 37);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(26, 38, 42);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(27, 43, 46);

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(28, 2, 2);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(29, 4, 4);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(30, 3, 3);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(31, 2, 2);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(32, 5, 5);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(33, 5, 5);
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(34, 5, 5);

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(35, '$name $surname prokázal ochotu se vzdělávat a pod dohledem je schopen dokončit své úkoly na velmi slušné úrovni.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(36, 'Kolega $name $surname pracuje se svými znalostmi efektivně a dokáže je využít při řešení problémů.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(37, '$name $surname využívá svých zkušeností a je velmi ochotný v jejich předávání.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(38, '$name $surname je výborný kolega s velmi slušnými znalostmi a zkušenostmi.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(39, '$name $surname má velmi detailní znalosti, které neváhá diskutovat s kolegy.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(40, '$name $surname dokáže samostatně vyřešit téměř jakýkoliv problém.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(41, '$name $surname je skvělý kolega s velmi detailními znalostmi. Dokáže vyřešit jakýkoliv problém.', '');

EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(42, '$name $surname prokázala ochotu se vzdělávat a pod dohledem je schopna dokončit své úkoly na velmi slušné úrovni.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(43, 'Kolegyně $name $surname pracuje se svými znalostmi efektivně a dokáže je využít při řešení problémů', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(44, '$name $surname využívá svých zkušeností a je velmi ochotná v jejich předávání', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(45, '$name $surname je výborná kolegyně s velmi slušnými znalostmi a zkušenostmi.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(46, '$name $surname má velmi detailní znalosti, které neváhá diskutovat s kolegy.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(47, '$name $surname dokáže samostatně vyřešit téměř jakýkoliv problém.', '');
EXECUTE GSD.G_INS_GSD_PCK.SP_RULES(48, '$name $surname je skvělá kolegyně s velmi detailními znalostmi. Dokáže vyřešit jakýkoliv problém.', '');

COMMIT;
---@ins.gsd_edu_field.sh

