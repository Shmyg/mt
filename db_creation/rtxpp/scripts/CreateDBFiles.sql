connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool CreateDBFiles.log
CREATE SMALLFILE TABLESPACE "USERS" LOGGING DATAFILE '/u02/oradata/rtxix/users01.dbf' SIZE 1G AUTOEXTEND OFF;
ALTER DATABASE DEFAULT TABLESPACE users;
spool off
