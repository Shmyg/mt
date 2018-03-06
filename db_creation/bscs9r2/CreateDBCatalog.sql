connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool CreateDBCatalog.log
@/export/home/product/10.2.0/rdbms/admin/catalog.sql;
@/export/home/product/10.2.0/rdbms/admin/catblock.sql;
@/export/home/product/10.2.0/rdbms/admin/catproc.sql;
@/export/home/product/10.2.0/rdbms/admin/catoctk.sql;
@/export/home/product/10.2.0/rdbms/admin/owminst.plb;
connect "SYSTEM"/"&&systemPassword"
@/export/home/product/10.2.0/sqlplus/admin/pupbld.sql;
connect "SYSTEM"/"&&systemPassword"
set echo on
spool sqlPlusHelp.log
@/export/home/product/10.2.0/sqlplus/admin/help/hlpbld.sql helpus.sql;
spool off
spool off
