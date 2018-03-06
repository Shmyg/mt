/*
|| Changes default temporary tablespace to the specified one for 
|| all ussers in the DB
||
|| $Log: assign_temp_ts.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
*/

WHENEVER SQLERROR EXIT SQL.SQLCODE
VARIABLE v_count NUMBER

BEGIN
	SELECT	rownum
	INTO	:v_count
	FROM	dba_tablespaces
	WHERE	tablespace_name = UPPER('&1');
EXCEPTION
	WHEN	NO_DATA_FOUND
	THEN
		DBMS_OUTPUT.PUT_LINE( 'No tablespace found! Exiting...' );
		RAISE;
END;
/

SET PAGESIZE 0
SET TRIMSPOOL ON
SET LINESIZE 32767
SET TAB OFF
SET FEEDBACK OFF
SET ECHO OFF
SET VERIFY OFF
SET TERMOUT OFF
SET RECSEP OFF


SPOOL run_assign_temp_ts.sql

SELECT	'alter user ' || username || ' temporary tablespace &1;'
FROM	dba_users;

SPOOL OFF

START run_assign_temp_ts.sql
!rm run_assign_temp_ts.sql

SET PAGESIZE 50
SET TERMOUT ON
