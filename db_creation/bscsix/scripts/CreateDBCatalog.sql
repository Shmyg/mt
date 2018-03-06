connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool CreateDBCatalog.log
@/opt/oracle/product/10.2.0/Db_1/rdbms/admin/catalog.sql;
@/opt/oracle/product/10.2.0/Db_1/rdbms/admin/catblock.sql;
@/opt/oracle/product/10.2.0/Db_1/rdbms/admin/catproc.sql;
@/opt/oracle/product/10.2.0/Db_1/rdbms/admin/catoctk.sql;
@/opt/oracle/product/10.2.0/Db_1/rdbms/admin/owminst.plb;
connect "SYSTEM"/"&&systemPassword"
@/opt/oracle/product/10.2.0/Db_1/sqlplus/admin/pupbld.sql;
connect "SYSTEM"/"&&systemPassword"
set echo on
@/opt/oracle/product/10.2.0/Db_1/sqlplus/admin/help/hlpbld.sql helpus.sql;
spool off
