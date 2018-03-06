/*
|| Extracts privileges for SYS objects for kernel and non-kernel_users
||
|| $Log: move_system_grants.sql,v $
|| Revision 1.3  2011/03/09 09:54:28  shmyg
|| *** empty log message ***
||
|| Revision 1.2  2011-02-21 09:13:06  shmyg
|| Fixed a lot of bugs before migration on bscsix
||
|| Revision 1.1.1.1  2011-02-15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
*/


PROMPT Connecting to the source DB (bscs9sx)

connect shmyg@bscs9sx

exec DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', TRUE);

SET PAGESIZE 0
SET TRIMSPOOL ON
SET LINESIZE 32767
SET TAB OFF
SET FEEDBACK OFF
SET ECHO OFF
SET VERIFY OFF
SET TERMOUT OFF
SET RECSEP OFF
SET LONG 1000000000
COLUMN my_col FORMAT a300 WORD_WRAPPED

SPOOL run_move_system_grants.sql

WITH	objects AS
	(
	SELECT	DISTINCT table_name
	FROM	dba_tab_privs	dt,
		(
		SELECT	username
		FROM	non_kernel_users
		UNION
		SELECT	username
		FROM	kernel_users
		UNION
		SELECT	'SHMYG'
		FROM	DUAL
		)	ku
	WHERE	dt.grantee = ku.username
	AND	dt.owner = 'SYS'
	)
SELECT	DBMS_METADATA.GET_DEPENDENT_DDL
	(
	'OBJECT_GRANT',
	do.object_name,
	'SYS'
	) AS my_col
FROM	dba_objects	do,
	objects ob
WHERE	ob.table_name = do.object_name
AND	do.object_type = 'PACKAGE'
/

SPOOL OFF

PROMPT Connecting to the target DB
connect shmyg as sysdba

START run_move_system_grants.sql
!rm run_move_system_grants.sql

SET PAGESIZE 50
SET TERMOUT ON
