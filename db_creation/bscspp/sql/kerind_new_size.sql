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
	WHERE	version_date = TRUNC( SYSDATE )
	)
--WHERE	old_size != new_size
--OR	old_size IS NULL
ORDER	BY owner,
	index_name
/
