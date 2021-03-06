alter user outln identified by values 'nolog';
alter user tsmsys identified by values 'nolog';
alter user wmsys identified by values 'nolog';
alter user outln account expire;
alter user wmsys account expire;
grant execute on dbms_job to dbsnmp;
grant execute on dbms_job to interface;
grant execute on dbms_job to mgmt_user;
grant execute on dbms_job to sysman;
grant execute on dbms_job to xdb;
grant execute on dbms_lob to ctxsys;
grant execute on dbms_lob to dbsnmp;
grant execute on dbms_lob to exfsys;
grant execute on dbms_lob to mdsys;
grant execute on dbms_lob to mgmt_user;
grant execute on dbms_lob to olapsys;
grant execute on dbms_lob to ordplugins;
grant execute on dbms_lob to ordsys;
grant execute on dbms_lob to sysman;
grant execute on dbms_lob to xdb;
grant execute on dbms_lock to bscs_role;
grant execute on dbms_lock to interface;
grant execute on dbms_lock to javaserver;
grant execute on dbms_lock to sysadm;
grant execute on dbms_random to dbsnmp;
grant execute on dbms_random to mdsys;
grant execute on dbms_random to mgmt_user;
grant execute on dbms_random to mop;
grant execute on dbms_random to sy;
grant execute on dbms_random to sy1;
grant execute on dbms_random to sysman;
grant execute on dbms_scheduler to dbsnmp;
grant execute on dbms_scheduler to mgmt_user;
grant execute on dbms_scheduler to olapsys;
grant execute on dbms_scheduler to sysman;
grant execute on dbms_scheduler to xdb;
grant execute on dbms_sql to dbsnmp;
grant execute on dbms_sql to dmfadm;
grant execute on dbms_sql to exfsys;
grant execute on dbms_sql to mgmt_user;
grant execute on dbms_sql to olapsys;
grant execute on dbms_sql to sysadm;
grant execute on dbms_sql to sysman;
grant execute on dbms_sql to system;
grant execute on dbms_sql to wmsys;
grant execute on dbms_sql to xdb;
grant execute on utl_file to wmsys;
grant execute on utl_file to xdb;
grant execute on utl_http to dbsnmp;
grant execute on utl_http to mdsys;
grant execute on utl_http to mgmt_user;
grant execute on utl_http to ordplugins;
grant execute on utl_http to sysman;
grant execute on utl_smtp to dbsnmp;
grant execute on utl_smtp to mgmt_user;
grant execute on utl_smtp to sysman;
grant execute on utl_tcp to dbsnmp;
grant execute on utl_tcp to mgmt_user;
grant execute on utl_tcp to sysman;
revoke execute on dbms_job from public;
revoke execute on dbms_lob from public;
revoke execute on dbms_random from public;
revoke execute on dbms_scheduler from public;
revoke execute on dbms_sql from public;
revoke execute on owa_util from public;
revoke debug on owa_util from public;
revoke execute on utl_file from public;
revoke execute on utl_http from public;
revoke execute on utl_smtp from public;
revoke execute on utl_tcp from public;
grant execute on dbms_sql to shmyg;
grant execute on dbms_random to shmyg;
