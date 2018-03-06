INSERT	INTO kernel_tables
	(
	owner,
	table_name,
	ts_name,
	appearance_date,
	table_size,
	version_date
	)
	(
	SELECT	dt.owner,
		dt.table_name,
		ds.tablespace_name,
		TRUNC( SYSDATE ),
		SUM( ds.bytes ),
		TRUNC( SYSDATE )
	FROM	dba_tables	dt,
		dba_segments	ds,
		kernel_users	ku
	WHERE	dt.table_name = ds.segment_name
	AND	ku.username = dt.owner
	AND	ku.username = ds.owner
	AND	ds.segment_type IN ('TABLE', 'TABLE PARTITION')
	AND	table_name NOT LIKE 'SYS_IOT%'
	AND	table_name NOT LIKE 'TEMP%'
	AND	table_name NOT LIKE 'DBX%'
	AND	table_name NOT LIKE '%INCOS%'
	AND	table_name NOT LIKE 'OE%'
	AND	table_name NOT LIKE 'UDR%'
	AND	ds.tablespace_name != 'USERS'
	GROUP	BY dt.table_name,
		ds.tablespace_name,
		dt.owner
	)
/
