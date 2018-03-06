CONNECT "sys"/"&&SYSpASSWORD" AS sysdbA
set echo on
spool /export/home/admin/bscs9gld/scripts/CreateDB.log
startup nomount pfile="/export/home/admin/bscs9gld/scripts/init.ora";
CREATE DATABASE "bscs9gld"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
DATAFILE '/ora/bscsdata01/BSCS9MIG/bscs9gld/oradata/system01.dbf' SIZE 1G REUSE AUTOEXTEND ON
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '/ora/bscsdata01/BSCS9MIG/bscs9gld/oradata/sysaux01.dbf' SIZE 512M REUSE AUTOEXTEND ON
BIGFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE '/ora/bscsdata01/BSCS9MIG/bscs9gld/oradata/temp01.dbf' SIZE 1G REUSE AUTOEXTEND ON
BIGFILE UNDO TABLESPACE "UNDOTBS1" DATAFILE '/ora/bscsdata01/BSCS9MIG/bscs9gld/oradata/undotbs01.dbf' SIZE 1G REUSE AUTOEXTEND ON
CHARACTER SET WE8ISO8859P1
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('/ora/bscsdata01/BSCS9MIG/bscs9gld/onlinelog/redo01a.log','/ora/bscsdata01/BSCS9MIG/bscs9gld/onlinelog/redo01b.log') SIZE 500M,
GROUP 2 ('/ora/bscsdata01/BSCS9MIG/bscs9gld/onlinelog/redo02a.log','/ora/bscsdata01/BSCS9MIG/bscs9gld/onlinelog/redo02b.log') SIZE 500M,
GROUP 3 ('/ora/bscsdata01/BSCS9MIG/bscs9gld/onlinelog/redo03a.log','/ora/bscsdata01/BSCS9MIG/bscs9gld/onlinelog/redo03b.log') SIZE 500M
USER SYS IDENTIFIED BY "&&sysPassword" USER SYSTEM IDENTIFIED BY "&&systemPassword";
spool off
