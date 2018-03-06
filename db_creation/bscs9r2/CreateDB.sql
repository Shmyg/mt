connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool CreateDB.log
startup nomount pfile="/export/home/admin/bscs9r2/init.ora";
CREATE DATABASE "bscs9r2"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 200
DATAFILE '/ora/bscsdata20/BSCS9R1/oradata/system01.dbf' SIZE 500M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '/ora/bscsdata20/BSCS9R1/oradata/sysaux01.dbf' SIZE 350M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
SMALLFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE '/ora/bscsdata20/BSCS9R1/oradata/temp01.dbf' SIZE 512M REUSE AUTOEXTEND ON NEXT  640K MAXSIZE UNLIMITED
SMALLFILE UNDO TABLESPACE "UNDOTBS1" DATAFILE '/ora/bscsdata20/BSCS9R1/oradata/undotbs01.dbf' SIZE 512M REUSE AUTOEXTEND ON  MAXSIZE UNLIMITED
CHARACTER SET WE8ISO8859P1
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('/ora/bscsdata20/BSCS9R1/redo01a.log','/ora/bscsdata20/BSCS9R1/redo01b.log','/ora/bscsdata20/BSCS9R1/redo01c.log') SIZE 100M,
GROUP 2 ('/ora/bscsdata20/BSCS9R1/redo02a.log','/ora/bscsdata20/BSCS9R1/redo02b.log','/ora/bscsdata20/BSCS9R1/redo02c.log') SIZE 100M
USER SYS IDENTIFIED BY "&&sysPassword" USER SYSTEM IDENTIFIED BY "&&systemPassword";
spool off