/*
|| The script used to move DMFADM tables to appropriate tablespaces
||
|| $Log: move_migration_tables.sql,v $
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

ALTER USER dmfadm QUOTA 500M on d_bscs_tiny;

SPOOL move_migration_tables_&&start_date..txt

SELECT	'ALTER TABLE dmfadm.' || table_name || ' MOVE TABLESPACE d_bscs_tiny;'
FROM	migration_tables
/

SPOOL OFF

@move_migration_tables_&&start_date..txt

!rm move_migration_tables_&&start_date..txt

SET PAGESIZE 50
SET TERMOUT ON
