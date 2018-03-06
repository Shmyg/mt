connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /export/home/admin/bscspp/scripts/postDBCreation.log
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='/export/home/product/10.2.0/dbs/spfilebscspp.ora' FROM pfile='/export/home/admin/bscspp/scripts/init.ora';
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
alter user SYSMAN identified by "&&sysmanPassword" account unlock;
alter user DBSNMP identified by "&&dbsnmpPassword" account unlock;
select 'utl_recomp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute utl_recomp.recomp_serial();
select 'utl_recomp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
host /export/home/product/10.2.0/bin/emca -config dbcontrol db -silent -DB_UNIQUE_NAME bscspp -PORT 1521 -EM_HOME /export/home/product/10.2.0 -LISTENER LISTENER -SERVICE_NAME bscspp -SYS_PWD &&sysPassword -SID bscspp -ORACLE_HOME /export/home/product/10.2.0 -DBSNMP_PWD &&dbsnmpPassword -HOST bscs-rec -LISTENER_OH /export/home/product/10.2.0 -LOG_FILE /export/home/admin/bscspp/scripts/emConfig.log -SYSMAN_PWD &&sysmanPassword;
spool /export/home/admin/bscspp/scripts/postDBCreation.log
