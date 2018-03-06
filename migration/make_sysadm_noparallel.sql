/*
|| Script to make all SYSADM objects noparallel except those listed
|| in the table SHMYG.PARALLEL_TABLES
|| 
|| $Log: make_sysadm_noparallel.sql,v $
|| Revision 1.2  2011/02/21 09:13:06  shmyg
|| Fixed a lot of bugs before migration on bscsix
||
|| Revision 1.1.1.1  2011-02-15 15:30:28  shmyg
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

SPOOL run_make_sysadm_noparallel.sql

SELECT  'alter table sysadm.' || table_name || ' noparallel;'
FROM    dba_tables
WHERE   owner = 'SYSADM';

SELECT	'alter table sysadm.' || table_name || ' parallel 4;'
FROM	shmyg.parallel_tables;

SELECT  'alter index sysadm.' || index_name || ' noparallel;'
FROM    dba_indexes
WHERE   owner = 'SYSADM';

SPOOL OFF

START   run_make_sysadm_noparallel.sql

!rm run_make_sysadm_noparallel.sql
