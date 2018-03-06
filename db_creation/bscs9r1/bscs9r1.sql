set verify off
PROMPT specify a password for sys as parameter 1;
DEFINE sysPassword = &1
PROMPT specify a password for system as parameter 2;
DEFINE systemPassword = &2
PROMPT specify a password for sysman as parameter 3;
DEFINE sysmanPassword = &3
PROMPT specify a password for dbsnmp as parameter 4;
DEFINE dbsnmpPassword = &4
host /export/home/product/10.2.0/bin/orapwd file=/export/home/product/10.2.0/dbs/orapwbscs9r1 password=&&sysPassword force=y
--@/export/home/admin/bscs9r1/scripts/CreateDB.sql
--@/export/home/admin/bscs9r1/scripts/CreateDBFiles.sql
@/export/home/admin/bscs9r1/scripts/CreateDBCatalog.sql
@/export/home/admin/bscs9r1/scripts/JServer.sql
@/export/home/admin/bscs9r1/scripts/cwmlite.sql
@/export/home/admin/bscs9r1/scripts/emRepository.sql
@/export/home/admin/bscs9r1/scripts/postDBCreation.sql
