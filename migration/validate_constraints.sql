/*
|| Validates all non-validated constraints for SYSADM
|| Creates a job for each constraint to be validated
|| All constraints should be enabled novalidated before the launch
|| and the biggest tables should be configured to PARALLEL 8
||
|| $Log
*/

DECLARE
	-- Number of the job
	v_job_num	PLS_INTEGER := 1;

BEGIN

	FOR	rec IN
		(
		SELECT	table_name,
			constraint_name
		FROM	dba_constraints
		WHERE	owner = 'SYSADM'
		AND	validated = 'NOT VALIDATED'
		AND	constraint_type NOT IN ('O', 'V')
		ORDER	BY DBMS_RANDOM.RANDOM
		)
	LOOP
		DBMS_SCHEDULER.CREATE_JOB			
		(
		job_name => 'VALCONS_' || v_job_num,
		job_type => 'PLSQL_BLOCK',
		job_action => 'begin execute immediate ''alter session force parallel ddl''; ' || 
				'execute immediate ''alter table sysadm.' || rec.table_name ||
				' enable constraint ' || rec.constraint_name || '''; end;',
		enabled => TRUE,
		auto_drop => TRUE
		);
	
		v_job_num := v_job_num + 1;
	END	LOOP;
END;
/
