CONNECT "sys"/"&&SYSpASSWORD" AS sysdbA
set echo on
spool /export/home/admin/bscs9sx/scripts/CreateDB.log
startup nomount pfile="/export/home/admin/bscs9sx/scripts/init.ora";
CREATE DATABASE "bscs9sx"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
DATAFILE '/ora/bscsdata03/BSCS9MIG/bscs9sx/oradata/system01.dbf' SIZE 1G REUSE AUTOEXTEND ON
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '/ora/bscsdata03/BSCS9MIG/bscs9sx/oradata/sysaux01.dbf' SIZE 512M REUSE AUTOEXTEND ON
BIGFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE '/ora/bscsdata03/BSCS9MIG/bscs9sx/oradata/temp01.dbf' SIZE 1G REUSE AUTOEXTEND ON
BIGFILE UNDO TABLESPACE "UNDOTBS1" DATAFILE '/ora/bscsdata03/BSCS9MIG/bscs9sx/oradata/undotbs01.dbf' SIZE 1G REUSE AUTOEXTEND ON
CHARACTER SET WE8ISO8859P1
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('/ora/bscsdata03/BSCS9MIG/bscs9sx/onlinelog/redo01a.log','/ora/bscsdata03/BSCS9MIG/bscs9sx/onlinelog/redo01b.log') SIZE 3500M,
GROUP 2 ('/ora/bscsdata03/BSCS9MIG/bscs9sx/onlinelog/redo02a.log','/ora/bscsdata03/BSCS9MIG/bscs9sx/onlinelog/redo02b.log') SIZE 3500M,
GROUP 3 ('/ora/bscsdata03/BSCS9MIG/bscs9sx/onlinelog/redo03a.log','/ora/bscsdata03/BSCS9MIG/bscs9sx/onlinelog/redo03b.log') SIZE 3500M
USER SYS IDENTIFIED BY "&&sysPassword" USER SYSTEM IDENTIFIED BY "&&systemPassword";
spool off
