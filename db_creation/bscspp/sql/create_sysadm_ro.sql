CREATE	USER sysadm_ro
IDENTIFIED BY grohar09
DEFAULT	TABLESPACE users;

GRANT	CREATE SESSION TO sysadm_ro;

SPOOL abc.sql
SELECT	'grant select on sysadm.' || table_name || ' to sysadm_ro;'
FROM	dba_tables
WHERE	owner = 'SYSADM'
/
SPOOL OFF

@abc.sql

!rm abc.sql
