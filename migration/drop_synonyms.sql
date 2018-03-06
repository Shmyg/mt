/*
|| Drops all dangling synonyms
||
|| $Log $
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

SPOOL run_drop_synonyms.sql

SELECT	'drop public synonym ' || synonym_name || ';'
FROM	dba_synonyms
WHERE	NOT EXISTS
	(
	SELECT	*
	FROM	dba_objects
	WHERE	object_name = dba_synonyms.table_name
	AND	owner = dba_synonyms.table_owner
	AND	object_type != 'SYNONYM'
	);

SPOOL OFF

START run_drop_synonyms.sql
!rm run_drop_synonyms.sql

SET PAGESIZE 50
SET TERMOUT ON
