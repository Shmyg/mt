INSERT	INTO kernel_indexes
	(
	INDEX_NAME,
	TABLE_NAME,
	TS_NAME,
	APPEARANCE_DATE,
	DELETED,
	VERSION_DATE,
	NEW_TS_NAME,
	INDEX_SIZE,
	OWNER
	)
	(
	SELECT	di.index_name,
		di.table_name,
		ds.tablespace_name,
		'01.01.2010',
		NULL,
		TRUNC( SYSDATE ),
		NULL,
		SUM( ds.bytes ),
		di.owner
	FROM	dba_indexes	di,
		dba_segments	ds,
		kernel_users	ku
	WHERE	ds.segment_name = di.index_name
	AND	di.owner = ku.username
	AND	ds.owner = ku.username
	AND	ds.segment_type IN ('INDEX', 'INDEX PARTITION')
	AND	di.table_name NOT LIKE 'DBX%'
	AND	di.table_name NOT LIKE 'TEMP%'
	AND	di.table_name NOT LIKE 'OE%'
	AND	di.index_name NOT LIKE '%DBX%'
	AND	di.index_name NOT LIKE 'SYS%'
	GROUP	BY di.index_name,
		di.table_name,
		ds.tablespace_name,
		di.owner
	)
/
