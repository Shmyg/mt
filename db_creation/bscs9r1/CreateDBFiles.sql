connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /export/home/admin/bscs9r1/scripts/CreateDBFiles.log
CREATE SMALLFILE TABLESPACE "USERS" LOGGING DATAFILE '/u02/oradata/bscs9r1/users01.dbf' SIZE 1G REUSE AUTOEXTEND ON MAXSIZE 8G;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
