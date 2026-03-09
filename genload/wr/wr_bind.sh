#!/bin/bash

ROOT=$(realpath $0)
ROOTDIR=$(echo ${ROOT} | sed 's/\(.*\)\/.*/\1/')
SQLDIR=${ROOTDIR}/sql
SQLTMPDIR=${SQLDIR}/tmp
LOGDIR=${ROOTDIR}/log

ORACLE_SID=RIS01
ORACLE_BASE=/u01/app/oracle
ORACLE_HOME=/u01/app/oracle/product/12.2.0
ORACLE_USER=RIS
ORACLE_PASS=abcdefg

if [ ! -z "$1" ]; then
	COUNT=$1
else
	COUNT=100
fi

if [ ! -z "$2" ]; then
	SQLFILE=$2
else
	echo "2 - No script specified!"
	exit 2;
fi

LOGFILE=${LOGDIR}/${SQLFILE}_$(date '+%Y_%m_%d_%H%M').log

#echo $ROOTDIR
#echo $SQLDIR
#echo $SQLTMPDIR
#echo $COUNT

if [ ! -z "${SQLFILE}" ]; then
	SQLTMPFILE=${SQLTMPDIR}/${SQLFILE}_tmp.sql
	if [ -f ${SQLTMPFILE} ]; then
		echo "${SQLTMPFILE} - exists, skipping"
	else
		echo "set lin 300;" >> ${SQLTMPFILE}
		echo "col pin format 999999;" >> ${SQLTMPFILE}
		echo "col name format a30;" >> ${SQLTMPFILE}
		echo "col surname format a40;" >> ${SQLTMPFILE}
		echo "col email format a40;" >> ${SQLTMPFILE}
		echo "col gender format a10;" >> ${SQLTMPFILE}
		echo "col title format a8;" >> ${SQLTMPFILE}
		echo "variable pin number;" >> ${SQLTMPFILE}
		for (( i=1; i<=${COUNT}; i++))
		do
		RND=$(( ( RANDOM % 100000 ) ))
		cat ${SQLDIR}/${SQLFILE}.sql | sed "s/(\$\$CNT)/${RND}/">> ${SQLTMPFILE}
		echo "EXEC DBMS_LOCK.SLEEP(10);" >> ${SQLTMPFILE}
		done
	fi
fi

sqlplus -s ${ORACLE_USER}/${ORACLE_PASS} << EOF
	spool ${LOGFILE} append;
        set timing on;
        set autotrace on explain stat;
        @${SQLTMPFILE}
        spool off;
        exit;
EOF

#echo ${SQLTMPFILE}
#cat ${SQLTMPFILE}
rm ${SQLTMPFILE}
