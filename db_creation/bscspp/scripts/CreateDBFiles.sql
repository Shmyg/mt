connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /export/home/admin/bscspp/scripts/CreateDBFiles.log
CREATE SMALLFILE TABLESPACE "USERS" LOGGING DATAFILE '/u02/oradata/bscspp/users01.dbf' SIZE 1G REUSE AUTOEXTEND OFF;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
