# RIS
Reference Information System

For my diploma thesis (2020) themed "Options of relation database optimization" I have prepared several supportive packages which generated data by defined logic including person, CV, history of employment and education and employers refences.
Including in the files are dumps with already generated records to minimalize viewers actions, installation from scratch requires several steps.

These supportive packages were not part of the theme of the DT so it was omitted from the actual DT.

Install:

	- run install.sql
	- import data from input_tables directory
	- run install2.sql
	- run changes/issue_1/install.sql - add logging and simplifies main worker records generation (removed gender based procedures)

Import (prefered option):

	- prepare directory
	- prepare tablespaces from the prereq.sql
	- run import - imp_ris_gsd.sh
	
Details:

	- file 019_RIS_views.sql is filled with prepared views for the diploma thesis practical section, named from chapter 4.4.1. Due to page size restrictions, DT only optimized A1 query.
	- when running import option, jobs are not required to be enabled, base data are present
	- G_TOFI is table with different logical combinations of degrees, education organization, field type and industry positions. It is used to generate different employees profiles
		Example:
			- person studies medicine, could have doctor degree and was only employed at hospitals
			- person studies as car mechanic, will be employed only at positions at repair shop at company with relevant industry assignment.
			
	- G_RULE_TYPES and G_RULES are tables used for defining rules like levels for degrees, email formats, age for different number of employers
		- Example: 
			- person ages 24 won't have 10 year long employments
			- person binded to masters degree has to have bachelor degree and had to finish high-school graduation so in R_CV_EDU_HIST will have at least 3 records.
		
	- Rules, TOFI, employment and education history is handled with generating random numbers on multiple levels, first TOFI, then randomization of schools and employments.
