/*
|| Script to enable end validate all sysadm constraints
|| Contsraints are enabled in 2 steps:
|| 1. Enable novalidate
|| 2. Validate
|| Should be executed on the Oracle server under oracle account
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

SPOOL enable_novalidate_sysadm_constraints_&&start_date..sql

SELECT  'alter table sysadm.' || table_name ||
        ' modify constraint ' || constraint_name || ' enable novalidate;'
FROM    dba_constraints
WHERE   owner = 'SYSADM'
AND     (
	status = 'DISABLED'
	OR
	validated = 'NOT VALIDATED'
	)
AND	constraint_type NOT IN ('O', 'V');

SPOOL OFF

START   enable_novalidate_sysadm_constraints_&&start_date..sql

!rm enable_novalidate_sysadm_constraints_&&start_date..sql

SPOOL enable_validate_sysadm_constraints.sql

SELECT  'alter table sysadm.' || table_name ||
        ' enable constraint ' || constraint_name ||
	' exceptions into exceptions;'
FROM    dba_constraints
WHERE   owner = 'SYSADM'
AND     validated = 'NOT VALIDATED'
AND	constraint_type NOT IN ('O', 'V');

SPOOL OFF

!split -l 1000 enable_validate_sysadm_constraints.sql
!rm enable_novalidate_sysadm_constraints.sql
!for i in xa*; do nohup sqlplus / as sysdba @$i &; done
!rm xa*

EXIT;
