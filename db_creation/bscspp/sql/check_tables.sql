SELECT	old_table,
	new_table	
FROM	(
	SELECT	dt.table_name as new_table,
		kt.table_name as old_table
	FROM	(
		SELECT	table_name
		FROM	dba_tables
		WHERE	owner = 'SYSADM'
		AND	table_name NOT LIKE 'DBX%'
		AND	table_name NOT LIKE 'SYS_IOT%'
		)	dt
		FULL OUTER JOIN 
		(
		SELECT	table_name
		FROM	kernel_tables
		WHERE	version_date =
			(
			SELECT	MAX( version_date )
			FROM	kernel_tables
			)
		)	kt
	ON	kt.table_name = dt.table_name
	)
WHERE	old_table IS NULL
OR	new_table IS NULL
/
