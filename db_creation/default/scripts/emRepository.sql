connect "SYS"/"&&sysPassword" as SYSDBA
set echo off
spool /export/home/admin/bscs9r1/scripts/emRepository.log
@/export/home/product/10.2.0/sysman/admin/emdrep/sql/emreposcre /export/home/product/10.2.0 SYSMAN &&sysmanPassword TEMP ON;
WHENEVER SQLERROR CONTINUE;
spool off
