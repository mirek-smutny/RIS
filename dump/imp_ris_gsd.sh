#!/bin/bash

impdp userid=\"SYS/abcdefg@TMAN01 as sysdba\" \
directory=DMPDIR \
dumpfile=ris_gsd_2026_03_06_%U.dmp \
logfile=ris_gsd_$(date '+%Y_%m_%d_%H%M').log \
table_exists_action=replace \
exclude=statistics
