connect "SYS"/"&&sysPassword" as SYSDBA
set echo off
spool emRepository.log
@/opt/oracle/product/10.2.0/Db_1/sysman/admin/emdrep/sql/emreposcre /opt/oracle/product/10.2.0/Db_1 SYSMAN &&sysmanPassword TEMP ON;
WHENEVER SQLERROR CONTINUE;
spool off
