COL	old_owner FOR a30
COL	new_owner FOR a30
COL	old_index FOR a30
COL	new_index FOR a30

SELECT	old_owner,
	old_index,
	new_owner,
	new_index	
FROM	(
	SELECT	dt.owner as new_owner,
		dt.index_name as new_index,
		kt.owner as old_owner,
		kt.index_name as old_index
	FROM	(
		SELECT	owner,
			index_name
		FROM	dba_indexes
		WHERE	owner IN
			(
			SELECT	username
			FROM	kernel_users
			)
		AND	index_name NOT LIKE 'SYS_IL%'
		AND	table_name IN
			(
			SELECT	table_name
			FROM	kernel_tables
			WHERE	version_date =
				(
				SELECT	MAX(version_date)
				FROM	kernel_tables
				)
			)
		)	dt
		FULL OUTER JOIN 
		(
		SELECT	owner,
			index_name
		FROM	kernel_indexes
		WHERE	deleted IS NULL
		AND	version_date =
			(
			SELECT	MAX(version_date)
			FROM	kernel_indexes
			)
		)	kt
	ON	kt.index_name = dt.index_name
	)
WHERE	old_index IS NULL
OR	new_index IS NULL
/
