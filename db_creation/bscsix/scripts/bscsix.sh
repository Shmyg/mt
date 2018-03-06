mkdir -p /u01/oracle/bscsix/flash_recovery_area
mkdir -p /u02/oradata/bscsix/onlinelog
mkdir -p /u02/oradata/bscsix/controlfile
mkdir -p /u02/oracle/admin/bscsix/adump
mkdir -p /u02/oracle/admin/bscsix/bdump
mkdir -p /u02/oracle/admin/bscsix/cdump
mkdir -p /u02/oracle/admin/bscsix/udump
mkdir -p /u02/oradata/bscsix
mkdir -p /u03/oradata/bscsix/onlinelog
mkdir -p /u03/oradata/bscsix/controlfile
mkdir -p /u03/oradata/bscsix
mkdir -p /u04/oradata/bscsix/onlinelog
mkdir -p /u04/oradata/bscsix/controlfile
mkdir -p /u04/oradata/bscsix
mkdir -p /u05/oradata/bscsix
mkdir -p /u06/oradata/bscsix
mkdir -p /u07/oradata/bscsix
mkdir -p /u08/oradata/bscsix
mkdir -p /u09/oradata/bscsix

ORACLE_SID=bscsix; export ORACLE_SID
echo You should Add this entry in the /var/opt/oracle/oratab: bscsix:/opt/oracle/product/10.2.0/Db_1:Y
/opt/oracle/product/10.2.0/Db_1/bin/sqlplus /nolog @bscsix.sql
