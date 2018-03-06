set echo on
spool cwmlite.log
connect "SYS"/"&&sysPassword" as SYSDBA
@/export/home/product/10.2.0/olap/admin/olap.sql SYSAUX TEMP;
spool off
