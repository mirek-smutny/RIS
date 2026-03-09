#!/bin/bash

expdp userid=\"SYS/abcdefg@DMAN01 as sysdba\" \
directory=DMPDIR \
dumpfile=ris_gsd_2026_03_06_part_%U.dmp \
filesize=50M \
parallel=2 \
logfile=ris_gsd_$(date '+%Y_%m_%d_%H%M').log \
schemas=GSD,RIS
exclude=statistics
