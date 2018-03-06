/*
|| Script to drop all non-oracle users from the DB
|| $Log: drop_non_oracle_users.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-07-22 12:10:26  shmyg
|| *** empty log message ***
||
||
|| Revision 1.1.1.1  2005-06-07 11:16:08  serge
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


SPOOL drop_non_oracle_users_&&start_date..sql

SELECT	'DROP USER ' || username || ' cascade;'
FROM	dba_users
WHERE	username NOT IN
	(
	SELECT	username
	FROM	oracle_users
	)
AND	username != 'ETL_STG'
/

SPOOL OFF

START drop_non_oracle_users_&&start_date..sql

!rm drop_non_oracle_users_&&start_date..sql

SET PAGESIZE 50
SET TERMOUT ON
