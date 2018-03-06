--connect "SYS"/"&&sysPassword" as SYSDBA
--set echo on
--spool postDBCreation.log
--connect "SYS"/"&&sysPassword" as SYSDBA
--set echo on
--create spfile FROM pfile='/opt/oracle/rtxix/scripts/init.ora';
--shutdown immediate;
--connect "SYS"/"&&sysPassword" as SYSDBA
--startup ;
--alter user SYSMAN identified by "&&sysmanPassword" account unlock;
--alter user DBSNMP identified by "&&dbsnmpPassword" account unlock;
--select 'utl_recomp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute utl_recomp.recomp_serial();
select 'utl_recomp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
host /opt/oracle/product/10.2.0/Db_1/bin/emca -config dbcontrol db -silent -DB_UNIQUE_NAME rtxix -PORT 1521 -EM_HOME /opt/oracle/product/10.2.0/Db_1 -LISTENER LISTENER -SERVICE_NAME rtxix -SYS_PWD &&sysPassword -SID rtxix -ORACLE_HOME /opt/oracle/product/10.2.0/Db_1 -DBSNMP_PWD &&dbsnmpPassword -HOST bscs-rec -LISTENER_OH /opt/oracle/product/10.2.0/Db_1 -LOG_FILE emConfig.log -SYSMAN_PWD &&sysmanPassword;
 spool off
