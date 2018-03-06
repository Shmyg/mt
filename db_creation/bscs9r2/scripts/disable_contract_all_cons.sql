/*
|| Used to disable referential SYSADM constraints on CONTRACT_ALL
|| 
|| $Log: disable_contract_all_cons.sql,v $
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

SPOOL disable_sysadm_constraints_&&start_date..sql

SELECT	'alter table sysadm.contract_all disable constraint ' || constraint_name || ';'
FROM	dba_constraints
WHERE	owner = 'SYSADM'
AND	table_name = 'CONTRACT_ALL'
AND	constraint_type = 'R'
AND	status = 'ENABLED';

SPOOL OFF

START	disable_sysadm_constraints_&&start_date..sql

!rm disable_sysadm_constraints_&&start_date..sql

SET PAGESIZE 50
SET TERMOUT ON
