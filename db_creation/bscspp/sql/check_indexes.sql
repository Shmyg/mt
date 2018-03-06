SELECT	old_index,
	new_index	
FROM	(
	SELECT	dt.index_name as new_index,
		kt.index_name as old_index
	FROM	(
		SELECT	index_name
		FROM	dba_indexes
		WHERE	owner = 'SYSADM'
		)	dt
		FULL OUTER JOIN 
		(
		SELECT	index_name
		FROM	kernel_indexes
		WHERE	deleted IS NULL
		)	kt
	ON	kt.index_name = dt.index_name
	)
WHERE	old_index IS NULL
OR	new_index IS NULL
/
