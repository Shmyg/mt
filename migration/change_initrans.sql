/*
|| Changes initrans parameter for some tables having ITL waits
|| TODO: Should be analyzed for the number of initrans to set
|| $Log: change_initrans.sql,v $
|| Revision 1.1  2011/02/21 09:13:06  shmyg
|| Fixed a lot of bugs before migration on bscsix
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

SPOOL run_change_initrans.sql

SELECT	DISTINCT 'alter ' || REPLACE( object_type, ' PARTITION', '') || ' sysadm.' || object_name || ' initrans 16;'
FROM	v$segment_statistics
WHERE	statistic_name = 'ITL waits'
AND	owner = 'SYSADM'
GROUP	BY object_type,
	owner,
	object_name
HAVING COUNT(*) > 2;

SELECT	'alter table sysadm.' || table_name || ' initrans 16;'
FROM	dba_tables
WHERE	table_name LIKE ('CASH%')
OR	table_name LIKE ('ORDER%');

SELECT	'alter index sysadm.' || index_name || ' initrans 16;'
FROM	dba_indexes
WHERE	table_name LIKE ('CASH%')
OR	table_name LIKE ('ORDER%');

SPOOL OFF

START run_change_initrans.sql

!rm run_change_initrans.sql

SET PAGESIZE 50
SET TERMOUT ON
