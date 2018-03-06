SELECT	owner,
	table_name,
	old_size,
	new_size,
	ts_name
FROM	(
	SELECT	*
	FROM	(
		SELECT	owner,
			table_name,
			ts_name,
			table_size/(1024*1024) as new_size,
			version_date,
			LAG( table_size/(1024*1024)) OVER (PARTITION BY table_name ORDER BY version_date ) as old_size
		FROM	nk_tables
		)
	WHERE	version_date = TRUNC( SYSDATE )
	)
WHERE	new_size != old_size
OR	old_size IS NULL
ORDER	BY owner,
	table_name
/
