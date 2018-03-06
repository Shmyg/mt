/*
|| Script to drop all nk users from the DB
|| $Log: drop_nk_users.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-10-18 13:50:19  shmyg
|| Added PR* partitioning scripts
||
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


SPOOL drop_nk_users_&&start_date..sql

SELECT	'DROP USER ' || username || ' cascade;'
FROM	dba_users
WHERE	username IN
	(
	SELECT	username
	FROM	non_kernel_users
	)
/

SPOOL OFF

START drop_nk_users_&&start_date..sql

!rm drop_nk_users_&&start_date..sql

SET PAGESIZE 50
SET TERMOUT ON
