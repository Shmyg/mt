connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool CreateDBFiles.log
CREATE SMALLFILE TABLESPACE "USERS" LOGGING DATAFILE '/u02/oradata/bscsix/users01.dbf' SIZE 1G REUSE AUTOEXTEND OFF;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
