/*
|| Drops all roles non-existing in the source DB
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

SPOOL run_drop_roles.sql

SELECT	'drop role ' || role || ';'
FROM	dba_roles	dr
WHERE	NOT EXISTS
	(
	SELECT	*
	FROM	dba_roles@bscs9sx
	WHERE	role = dr.role
	);

SPOOL OFF

START run_drop_roles.sql
!rm run_drop_roles.sql

SET PAGESIZE 50
SET TERMOUT ON
