/*
|| The script is used to import standard SYSADM stats instead of collecting
|| statistics for the entire schema. The standard stats is stored in the 
|| table SHMYG.SYSADM_STATS
|| $Log: create_sysadm_stat.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2011-02-01 16:02:22  shmyg
|| Modified some scripts
||
*/

BEGIN

DBMS_STATS.CREATE_STAT_TABLE('SYSADM', 'MY_STAT');

INSERT	INTO sysadm.my_stat
	(
	SELECT	*
	FROM	shmyg.sysadm_stat
	);
COMMIT;

DBMS_STATS.IMPORT_SCHEMA_STATS('SYSADM', 'MY_STAT');

DBMS_STATS.DROP_STAT_TABLE('SYSADM', 'MY_STAT');

END;
/
