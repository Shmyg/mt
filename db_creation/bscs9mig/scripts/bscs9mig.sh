mkdir -p /u01/oracle/flash_recovery_area/bscs9mig
mkdir -p /u02/oradata/bscs9mig/onlinelog
mkdir -p /u02/oradata/bscs9mig/controlfile
mkdir -p /u02/oracle/admin/bscs9mig/adump
mkdir -p /u02/oracle/admin/bscs9mig/bdump
mkdir -p /u02/oracle/admin/bscs9mig/cdump
mkdir -p /u02/oracle/admin/bscs9mig/udump
mkdir -p /u02/oradata/bscs9mig
mkdir -p /u03/oradata/bscs9mig/onlinelog
mkdir -p /u03/oradata/bscs9mig/controlfile
mkdir -p /u03/oradata/bscs9mig
mkdir -p /u04/oradata/bscs9mig/onlinelog
mkdir -p /u04/oradata/bscs9mig/controlfile
mkdir -p /u04/oradata/bscs9mig
mkdir -p /u05/oradata/bscs9mig
mkdir -p /u06/oradata/bscs9mig
mkdir -p /u07/oradata/bscs9mig
mkdir -p /u08/oradata/bscs9mig
mkdir -p /u09/oradata/bscs9mig

ORACLE_SID=bscs9mig; export ORACLE_SID
echo You should Add this entry in the /var/opt/oracle/oratab: bscs9mig:/export/home/product/10.2.0:Y
/export/home/product/10.2.0/bin/sqlplus /nolog @/export/home/admin/bscs9mig/scripts/bscs9mig.sql
