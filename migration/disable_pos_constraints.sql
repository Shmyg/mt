/*
|| Used to disable all POS constraints
|| 
|| $Log: disable_pos_constraints.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-10-27 12:52:52  shmyg
|| *** empty log message ***
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

SPOOL disable_pos_constraints_&&start_date..sql

SELECT	'alter table pos.' || table_name ||
	' disable constraint ' || constraint_name || ';'
FROM	dba_constraints
WHERE	owner = 'POS';

SPOOL OFF

START	disable_pos_constraints_&&start_date..sql

!rm disable_pos_constraints_&&start_date..sql

SET PAGESIZE 50
SET TERMOUT ON
