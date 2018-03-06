set echo on
spool /export/home/admin/RTX9R1/scripts/cwmlite.log
connect "SYS"/"&&sysPassword" as SYSDBA
@/export/home/product/10.2.0/olap/admin/olap.sql SYSAUX TEMP;
spool off
