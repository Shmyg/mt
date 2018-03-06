/*
The script is to be used to drop all BSCS-related users
Should be executed under DBA privileges

$Log: drop_users.sql,v $
Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
All Maroc Telecom project files after reorganization

Revision 1.3  2010-05-27 17:23:21  shmyg
*** empty log message ***

Revision 1.2  2010-05-17 11:44:52  shmyg
*** empty log message ***

*/

SET PAGESIZE 0
SET TERMOUT OFF
SET ECHO OFF

SPOOL drop_users_run.sql

SELECT	'drop user ' || username || ' cascade;'
FROM	users_to_be_migrated;

SPOOL OFF

--START	drop_users_run.sql
