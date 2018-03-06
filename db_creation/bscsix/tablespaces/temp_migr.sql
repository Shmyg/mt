CREATE	TEMPORARY TABLESPACE temp_migr
TEMPFILE '/u04/oradata/bscsix/temp_migr01.dbf' SIZE 30G AUTOEXTEND OFF,
	'/u04/oradata/bscsix/temp_migr02.dbf' SIZE 30G AUTOEXTEND OFF,
	'/u04/oradata/bscsix/temp_migr03.dbf' SIZE 30G AUTOEXTEND OFF,
	'/u10/oradata/bscsix/temp_migr04.dbf' SIZE 30G AUTOEXTEND OFF,
	'/u10/oradata/bscsix/temp_migr05.dbf' SIZE 30G AUTOEXTEND OFF,
	'/u10/oradata/bscsix/temp_migr06.dbf' SIZE 30G AUTOEXTEND OFF
/

ALTER USER sysadm TEMPORARY TABLESPACE temp_migr
/
ALTER USER interface TEMPORARY TABLESPACE temp_migr
/
ALTER USER etl_stg TEMPORARY TABLESPACE temp_migr
/
ALTER DATABASE DEFAULT TEMPORARY TABLESPACE temp_migr
/
