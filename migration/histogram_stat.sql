/*
|| Collects hitogram statistics on some of SYSADM's tables to 
|| improve performance
|| For each task a job is created to run in the background
|| $Log: histogram_stat.sql,v $
|| Revision 1.2  2011/02/21 09:13:06  shmyg
|| Fixed a lot of bugs before migration on bscsix
||
|| Revision 1.1.1.1  2011-02-15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
*/

ALTER TABLE sysadm.customer_all PARALLEL 8;
ALTER TABLE sysadm.ccontact_all PARALLEL 8;
ALTER TABLE sysadm.billcycle_assignment_history PARALLEL 8;

BEGIN

	DBMS_SCHEDULER.CREATE_JOB
	(
	job_name => 'STAT_1',
	job_type => 'PLSQL_BLOCK',
	job_action => 'begin execute immediate ''alter session force parallel ddl''; ' || 
			'DBMS_STATS.GATHER_TABLE_STATS( ''sysadm'', ''customer_all'', '  ||
			'method_opt => ''FOR COLUMNS custcode SIZE 254'', degree => NULL); end;',
	enabled => TRUE,
	auto_drop => TRUE
	);

	DBMS_SCHEDULER.CREATE_JOB
	(
	job_name => 'STAT_2',
	job_type => 'PLSQL_BLOCK',
	job_action => 'begin execute immediate ''alter session force parallel ddl''; ' || 
			'DBMS_STATS.GATHER_TABLE_STATS( ''sysadm'', ''customer_all'', '  ||
			'method_opt => ''FOR COLUMNS customer_id SIZE AUTO'', degree => NULL); end;',
	enabled => TRUE,
	auto_drop => TRUE
	);

	DBMS_SCHEDULER.CREATE_JOB
	(
	job_name => 'STAT_3',
	job_type => 'PLSQL_BLOCK',
	job_action => 'begin execute immediate ''alter session force parallel ddl''; ' || 
			'DBMS_STATS.GATHER_TABLE_STATS( ''sysadm'', ''customer_all'', '  ||
			'method_opt => ''FOR COLUMNS prgcode SIZE 254'', degree => NULL); end;',
	enabled => TRUE,
	auto_drop => TRUE
	);

	DBMS_SCHEDULER.CREATE_JOB
	(
	job_name => 'STAT_4',
	job_type => 'PLSQL_BLOCK',
	job_action => 'begin execute immediate ''alter session force parallel ddl''; ' || 
			'DBMS_STATS.GATHER_TABLE_STATS( ''sysadm'', ''ccontact_all'', '  ||
			'method_opt => ''FOR COLUMNS passportno SIZE AUTO'', degree => NULL); end;',
	enabled => TRUE,
	auto_drop => TRUE
	);

	DBMS_SCHEDULER.CREATE_JOB
	(
	job_name => 'STAT_5',
	job_type => 'PLSQL_BLOCK',
	job_action => 'begin execute immediate ''alter session force parallel ddl''; ' || 
			'DBMS_STATS.GATHER_TABLE_STATS( ''sysadm'', ''customer_role'', '  ||
			'method_opt => ''FOR COLUMNS customer_id SIZE AUTO'', degree => NULL, ' ||
			'estimate_percent => 100); end;',
	enabled => TRUE,
	auto_drop => TRUE
	);

	DBMS_SCHEDULER.CREATE_JOB
	(
	job_name => 'STAT_6',
	job_type => 'PLSQL_BLOCK',
	job_action => 'begin execute immediate ''alter session force parallel ddl''; ' || 
			'DBMS_STATS.GATHER_TABLE_STATS( ''sysadm'', ''customer_role'', '  ||
			'method_opt => ''FOR COLUMNS party_role_id SIZE 254'', degree => NULL, ' ||
			'estimate_percent => 100); end;',
	enabled => TRUE,
	auto_drop => TRUE
	);

	DBMS_SCHEDULER.CREATE_JOB
	(
	job_name => 'STAT_7',
	job_type => 'PLSQL_BLOCK',
	job_action => 'begin execute immediate ''alter session force parallel ddl''; ' || 
			'DBMS_STATS.GATHER_TABLE_STATS( ''sysadm'', ''billcycle_assignment_history'', '  ||
			'method_opt => ''FOR COLUMNS billcycle SIZE 254'', degree => NULL); end;',
	enabled => TRUE,
	auto_drop => TRUE
	);

END;
/

ALTER TABLE sysadm.customer_all NOPARALLEL;
ALTER TABLE sysadm.ccontact_all NOPARALLEL;
ALTER TABLE sysadm.billcycle_assignment_history NOPARALLEL;
