connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /export/home/admin/bscs9mig/scripts/CreateDBFiles.log
CREATE SMALLFILE TABLESPACE "USERS" LOGGING DATAFILE '/u02/oradata/bscs9mig/users01.dbf' SIZE 1G REUSE AUTOEXTEND ON MAXSIZE 8G;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
