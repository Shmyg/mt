mkdir -p /u01/oracle/bscspp/flash_recovery_area
mkdir -p /u02/oradata/bscspp/onlinelog
mkdir -p /u02/oradata/bscspp/controlfile
mkdir -p /u02/oracle/admin/bscspp/adump
mkdir -p /u02/oracle/admin/bscspp/bdump
mkdir -p /u02/oracle/admin/bscspp/cdump
mkdir -p /u02/oracle/admin/bscspp/udump
mkdir -p /u02/oradata/bscspp
mkdir -p /u03/oradata/bscspp/onlinelog
mkdir -p /u03/oradata/bscspp/controlfile
mkdir -p /u03/oradata/bscspp
mkdir -p /u04/oradata/bscspp/onlinelog
mkdir -p /u04/oradata/bscspp/controlfile
mkdir -p /u04/oradata/bscspp
mkdir -p /u05/oradata/bscspp
mkdir -p /u06/oradata/bscspp
mkdir -p /u07/oradata/bscspp
mkdir -p /u08/oradata/bscspp
mkdir -p /u09/oradata/bscspp

ORACLE_SID=bscspp; export ORACLE_SID
echo You should Add this entry in the /var/opt/oracle/oratab: bscspp:/export/home/product/10.2.0:Y
/export/home/product/10.2.0/bin/sqlplus /nolog @/export/home/admin/bscspp/scripts/bscspp.sql
