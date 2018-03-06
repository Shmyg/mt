connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /export/home/admin/bscs9gld/scripts/CreateDBFiles.log
CREATE SMALLFILE TABLESPACE "USERS" LOGGING DATAFILE '/ora/bscsdata01/BSCS9MIG/bscs9gld/oradata/users01.dbf' SIZE 1G REUSE AUTOEXTEND ON MAXSIZE 8G;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
