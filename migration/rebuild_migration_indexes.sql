/*
|| The script used to rebuild DMFADM indexes to appropriate tablespaces
||
|| $Log: rebuild_migration_indexes.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-07-16 16:10:47  shmyg
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

ALTER	USER dmfadm quota 300M ON i_bscs_tiny;

SPOOL rebuild_migration_indexes_&&start_date..txt

SELECT	'ALTER INDEX DMFADM.' || index_name || ' REBUILD TABLESPACE i_bscs_tiny PARALLEL NOLOGGING;'
FROM	dba_indexes
WHERE	owner = 'DMFADM'
/

SPOOL OFF

@rebuild_migration_indexes_&&start_date..txt

!rm rebuild_migration_indexes_&&start_date..txt

SET PAGESIZE 50
SET TERMOUT ON
