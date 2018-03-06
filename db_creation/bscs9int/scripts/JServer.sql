connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /export/home/admin/bscs9int/scripts/JServer.log
@/export/home/product/10.2.0/javavm/install/initjvm.sql;
@/export/home/product/10.2.0/xdk/admin/initxml.sql;
@/export/home/product/10.2.0/xdk/admin/xmlja.sql;
@/export/home/product/10.2.0/rdbms/admin/catjava.sql;
@/export/home/product/10.2.0/rdbms/admin/catexf.sql;
spool off
