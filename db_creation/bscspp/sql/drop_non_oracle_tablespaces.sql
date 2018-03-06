/*
||
|| $Log: drop_non_oracle_tablespaces.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-07-16 16:10:47  shmyg
|| *** empty log message ***
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


SPOOL drop_non_oracle_tablespaces_&&start_date..sql

SELECT	'DROP TABLESPACE ' || tablespace_name || ' INCLUDING CONTENTS AND DATAFILES;'
FROM	dba_tablespaces
WHERE	contents = 'PERMANENT'
AND	tablespace_name NOT IN
	(
	'SYSTEM',
	'SYSAUX'
	'USERS'
	)
/

SPOOL OFF

START drop_non_oracle_tablespaces_&&start_date..sql

!rm drop_non_oracle_tablespaces_&&start_date..sql

SET PAGESIZE 50
SET TERMOUT ON
