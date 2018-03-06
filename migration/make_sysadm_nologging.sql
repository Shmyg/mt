/*
|| Script to make all SYSADM objects nologging
|| 
|| $Log: make_sysadm_nologging.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.2  2011-02-01 16:02:22  shmyg
|| Modified some scripts
||
|| Revision 1.1  2010-11-29 16:00:26  shmyg
|| Refresh 29.11.2010
||
|| Revision 1.1  2010-11-29 11:38:51  shmyg
|| Removed scripts for PR_SERV* tables
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

SPOOL run_make_sysadm_nologging.sql

SELECT  'alter table sysadm.' || table_name || ' nologging;'
FROM    dba_tables
WHERE   owner = 'SYSADM';

SELECT  'alter index sysadm.' || index_name || ' nologging;'
FROM    dba_indexes
WHERE   owner = 'SYSADM';

SPOOL OFF

START   run_make_sysadm_nologging.sql

!rm run_make_sysadm_nologging.sql
