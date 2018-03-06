mkdir -p /u01/oracle/flash_recovery_area/bscs9r1
mkdir -p /u02/oradata/bscs9r1/onlinelog
mkdir -p /u02/oradata/bscs9r1/controlfile
mkdir -p /u02/oracle/admin/bscs9r1/adump
mkdir -p /u02/oracle/admin/bscs9r1/bdump
mkdir -p /u02/oracle/admin/bscs9r1/cdump
mkdir -p /u02/oracle/admin/bscs9r1/udump
mkdir -p /u02/oradata/bscs9r1
mkdir -p /u03/oradata/bscs9r1/onlinelog
mkdir -p /u03/oradata/bscs9r1/controlfile
mkdir -p /u03/oradata/bscs9r1
mkdir -p /u04/oradata/bscs9r1/onlinelog
mkdir -p /u04/oradata/bscs9r1/controlfile
mkdir -p /u04/oradata/bscs9r1
mkdir -p /u05/oradata/bscs9r1
mkdir -p /u06/oradata/bscs9r1
mkdir -p /u07/oradata/bscs9r1
mkdir -p /u08/oradata/bscs9r1
mkdir -p /u09/oradata/bscs9r1

ORACLE_SID=bscs9r1; export ORACLE_SID
echo You should Add this entry in the /var/opt/oracle/oratab: bscs9r1:/export/home/product/10.2.0:Y
/export/home/product/10.2.0/bin/sqlplus /nolog @/export/home/admin/bscs9r1/scripts/bscs9r1.sql
