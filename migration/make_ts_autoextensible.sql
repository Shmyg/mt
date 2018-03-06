/*
|| Makes each tablespace autoextensible/non-autoextensible
|| depending on &1
||
|| $Log: make_ts_autoextensible.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
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

SPOOL run_make_ts_autoextensible.sql

SELECT	'alter database datafile ' || '''' || file_name || '''' || ' autoextend &1;'
FROM	(
	SELECT	file_name,
	ROW_NUMBER() OVER(PARTITION BY tablespace_name ORDER BY file_name DESC) AS rn
	FROM	dba_data_files
	WHERE	tablespace_name IN
		(
		SELECT	ts_name
		FROM	tablespaces
		)
	)
WHERE	rn = 1;

SPOOL OFF

START run_make_ts_autoextensible.sql
!rm run_make_ts_autoextensible.sql

SET PAGESIZE 50
SET TERMOUT ON
