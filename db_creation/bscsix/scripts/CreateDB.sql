CONNECT "sys"/"&&SYSpASSWORD" AS sysdbA
set echo on
spool CreateDB.log
startup nomount pfile="init.ora";
CREATE DATABASE "bscsix"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
DATAFILE '/u02/oradata/bscsix/system01.dbf' SIZE 1G  AUTOEXTEND OFF
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '/u02/oradata/bscsix/sysaux01.dbf' SIZE 512M  AUTOEXTEND OFF
SMALLFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE '/u04/oradata/bscsix/temp_01.dbf' SIZE 8G  AUTOEXTEND OFF
SMALLFILE UNDO TABLESPACE "UNDOTBS" DATAFILE '/u03/oradata/bscsix/undotbs_01.dbf' SIZE 8G  AUTOEXTEND OFF
CHARACTER SET WE8ISO8859P1
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('/u02/oradata/bscsix/onlinelog/redo01a.log','/u04/oradata/bscsix/onlinelog/redo01b.log') SIZE 3500M,
GROUP 2 ('/u03/oradata/bscsix/onlinelog/redo02a.log','/u04/oradata/bscsix/onlinelog/redo02b.log') SIZE 3500M,
GROUP 3 ('/u02/oradata/bscsix/onlinelog/redo03a.log','/u03/oradata/bscsix/onlinelog/redo03b.log') SIZE 3500M
USER SYS IDENTIFIED BY "&&sysPassword" USER SYSTEM IDENTIFIED BY "&&systemPassword";
spool off
