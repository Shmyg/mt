SELECT	owner,
	index_name,
	table_name,
	NVL( old_size, 0 ),
	new_size,
	ts_name
FROM	(
	SELECT	*
	FROM	(
		SELECT	owner,
			index_name,
			table_name,
			ts_name,
			index_size/(1024*1024) as new_size,
			version_date,
			LAG( index_size/(1024*1024)) OVER (PARTITION BY owner, index_name ORDER BY version_date ) as old_size
		FROM	kernel_indexes
		WHERE	deleted IS NULL
		)
	WHERE	version_date = 
		(
		SELECT	MAX( version_date )
		FROM	kernel_indexes
		)
	)
WHERE	(old_size - new_size) / new_size > .1
OR	NVL(old_size, 0) = 0
ORDER	BY owner,
	index_name
/
