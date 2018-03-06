/*
|| The script used to rebuild SYSADM indexes to appropriate tablespaces
||
|| $Log: rebuild_kernel_indexes.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-07-16 16:10:47  shmyg
|| *** empty log message ***
||
*/

SET PAGESIZE 0
SET TRIMSPOOL ON
SET LINESIZE 32767
SET TAB OFF
SET FEEDBACK OFF
SET ECHO OFF
SET VERIFY OFF
SET TERMOUT OFF
SET RECSEP OFF

COLUMN begin_date new_val start_date
SELECT  TO_CHAR( SYSDATE, 'YYYYMMDDHH24MI' ) begin_date
FROM    DUAL; 

SPOOL rebuild_indexes_&&start_date..txt

SELECT	'ALTER INDEX SYSADM.' || index_name || ' REBUILD TABLESPACE ' || new_ts_name || ' PARALLEL NOLOGGING;'
FROM	kernel_indexes
WHERE	version_date =
	(
	SELECT	MAX( version_date )
	FROM	kernel_indexes
	)
AND	deleted IS NULL
AND	new_ts_name !=
	(
	SELECT	tablespace_name
	FROM	dba_segments
	WHERE	owner = 'SYSADM'
	AND	segment_type = 'INDEX'
	AND	segment_name = kernel_indexes.index_name
	)
/

SPOOL OFF

@rebuild_indexes_&&start_date..txt

!rm rebuild_indexes_&&start_date..txt

SET PAGESIZE 50
SET TERMOUT ON
