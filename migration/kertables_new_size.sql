SELECT	owner,
	table_name,
	old_size,
	new_size,
	ROUND( abs(new_size - old_size )  / old_size * 100, 0) AS diff,
	ts_name
FROM	(
	SELECT	*
	FROM	(
		SELECT	owner,
			table_name,
			ts_name,
			table_size/(1024*1024) as new_size,
			version_date,
			LAG( table_size/(1024*1024)) OVER (PARTITION BY owner, table_name ORDER BY version_date ) as old_size
		FROM	kernel_tables
		)
	WHERE	version_date =
		(
		SELECT	MAX( version_date )
		FROM	kernel_tables
		)
	)
WHERE	old_size IS NULL
OR	ROUND( abs(new_size - old_size )  / old_size * 100, 0) > 10
ORDER	BY diff,
	owner,
	table_name
/
