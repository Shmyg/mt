SELECT	*
FROM	(
SELECT	ts.ts_name,
	ts.number_of_datafiles * ts.datafile_size as requested_size,
	(
	SELECT	SUM(bytes) / (1024*1024*1024)
	FROM	dba_data_files
	WHERE	tablespace_name = ts.ts_name
	) as current_size
FROM	tablespaces	ts
)
WHERE	requested_size != current_size
/
