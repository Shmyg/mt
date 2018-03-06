CONNECT "sys"/"&&SYSpASSWORD" AS sysdba
set echo on
spool CreateDB.log
startup nomount pfile="/export/home/admin/rtx9r2/scripts/init.ora";
CREATE DATABASE "rtx9r2"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 400
DATAFILE '/ora/rtxadmin00/rtx9r2/system01.dbf' SIZE 1G REUSE AUTOEXTEND ON
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE '/ora/rtxadmin00/rtx9r2/sysaux01.dbf' SIZE 350M REUSE AUTOEXTEND ON
BIGFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE '/ora/rtxdata00/rtx9r2/temp01.dbf' SIZE 4G REUSE AUTOEXTEND ON
BIGFILE UNDO TABLESPACE "UNDOTBS1" DATAFILE '/ora/rtxdata00/rtx9r2/undotbs01.dbf' SIZE 4G REUSE AUTOEXTEND ON
CHARACTER SET WE8ISO8859P1
NATIONAL CHARACTER SET AL16UTF16
LOGFILE GROUP 1 ('/ora/rtxadmin01/rtx9r2/redo01a.log','/ora/rtxadmin02/rtx9r2/redo01b.log') SIZE 3500M,
GROUP 2 ('/ora/rtxadmin02/rtx9r2/redo02a.log','/ora/rtxadmin03/rtx9r2/redo02b.log') SIZE 3500M,
GROUP 3 ('/ora/rtxadmin03/rtx9r2/redo03a.log','/ora/rtxadmin01/rtx9r2/redo03b.log') SIZE 3500M
USER SYS IDENTIFIED BY "&&sysPassword" USER SYSTEM IDENTIFIED BY "&&systemPassword";
spool off
