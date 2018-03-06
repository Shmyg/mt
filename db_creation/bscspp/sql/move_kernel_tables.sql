/*
|| The script used to move SYSADM tables to appropriate tablespaces
||
|| $Log: move_kernel_tables.sql,v $
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

SPOOL move_tables_&&start_date..txt

SELECT	'ALTER TABLE SYSADM.' || table_name || ' MOVE TABLESPACE ' || new_ts_name || ';'
FROM	kernel_tables
WHERE	version_date =
	(
	SELECT	MAX( version_date )
	FROM	kernel_tables
	)
AND	new_ts_name !=
	(
	SELECT	tablespace_name
	FROM	dba_segments
	WHERE	owner = 'SYSADM'
	AND	segment_type = 'TABLE'
	AND	segment_name = kernel_tables.table_name
	)
/

SPOOL OFF

@move_tables_&&start_date..txt

!rm move_tables_&&start_date..txt

SET PAGESIZE 50
SET TERMOUT ON
