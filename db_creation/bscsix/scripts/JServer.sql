connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool JServer.log
@/opt/oracle/product/10.2.0/Db_1/javavm/install/initjvm.sql;
@/opt/oracle/product/10.2.0/Db_1/xdk/admin/initxml.sql;
@/opt/oracle/product/10.2.0/Db_1/xdk/admin/xmlja.sql;
@/opt/oracle/product/10.2.0/Db_1/rdbms/admin/catjava.sql;
@/opt/oracle/product/10.2.0/Db_1/rdbms/admin/catexf.sql;
spool off
