CONNECT "sys"/"&&SYSpASSWORD" AS sysdbA
set echo on
spool /export/home/admin/bscs9r1/scripts/CreateDB.log
startup nomount pfile="/export/home/admin/bscs9r1/scripts/init.ora";
CREATE DATABASE "bscs9r1"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
DATAFILE '/u02/oradata/bscs9r1/system01.dbf' SIZE 1G REUSE AUTOEXTEND ON
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '/u02/oradata/bscs9r1/sysaux01.dbf' SIZE 512M REUSE AUTOEXTEND ON
BIGFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE '/u04/oradata/bscs9r1/temp01.dbf' SIZE 1G REUSE AUTOEXTEND ON
BIGFILE UNDO TABLESPACE "UNDOTBS1" DATAFILE '/u03/oradata/bscs9r1/undotbs01.dbf' SIZE 1G REUSE AUTOEXTEND ON
CHARACTER SET WE8ISO8859P1
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('/u02/oradata/bscs9r1/onlinelog/redo01a.log','/u04/oradata/bscs9r1/onlinelog/redo01b.log') SIZE 3500M,
GROUP 2 ('/u03/oradata/bscs9r1/onlinelog/redo02a.log','/u04/oradata/bscs9r1/onlinelog/redo02b.log') SIZE 3500M,
GROUP 3 ('/u02/oradata/bscs9r1/onlinelog/redo03a.log','/u03/oradata/bscs9r1/onlinelog/redo03b.log') SIZE 3500M
USER SYS IDENTIFIED BY "&&sysPassword" USER SYSTEM IDENTIFIED BY "&&systemPassword";
spool off
