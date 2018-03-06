/*
|| Used to disable referential and unique SYSADM constraints
|| 
|| $Log: disable_sysadm_constraints.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-05-27 17:23:21  shmyg
|| *** empty log message ***
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

SPOOL disable_sysadm_constraints_&&start_date..sql

SELECT	'alter table sysadm.' || table_name ||
	' disable constraint ' || constraint_name || ';'
FROM	dba_constraints
WHERE	owner = 'SYSADM'
AND	constraint_type IN ( 'R', 'U', 'C' )
AND	status = 'ENABLED';

SPOOL OFF

START	disable_sysadm_constraints_&&start_date..sql

!rm disable_sysadm_constraints_&&start_date..sql

SET PAGESIZE 50
SET TERMOUT ON
