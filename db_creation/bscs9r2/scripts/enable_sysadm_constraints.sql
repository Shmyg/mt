/*
|| Used to enable all SYSADM constraints
|| 
|| $Log: enable_sysadm_constraints.sql,v $
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

COLUMN begin_date new_val start_date
SELECT  TO_CHAR( SYSDATE, 'YYYYMMDDHH24MI' ) begin_date
FROM    DUAL; 

SPOOL enable_sysadm_constraints_&&start_date..sql

SELECT	'alter table sysadm.' || table_name ||
	' enable constraint ' || constraint_name ||
	' exceptions into exceptions;'
FROM	dba_constraints
WHERE	owner = 'SYSADM'
AND	status = 'DISABLED';

SPOOL OFF

START	enable_sysadm_constraints_&&start_date..sql

!rm enable_sysadm_constraints_&&start_date..sql

SET PAGESIZE 50
SET TERMOUT ON
