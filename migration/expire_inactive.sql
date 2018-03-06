/*
|| Used to expire useraccounts not used more than 30 days
|| Based on standard Oracle auditing, the DB must have 'audit session' enabled
|| Should be executed daily from DBMS_SCHEDULER (or UNIX cron or whatever)
|| Owner of the procedure should be granted 'ALTER USER'
|| and 'SELECT ON DBA_AUDIT_SESSION'
||
|| $Log: expire_inactive.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-12-01 12:48:49  shmyg
|| Added locking procedure
||
*/

CREATE	OR REPLACE
PROCEDURE	sysadm.lock_inactive_users
AS
BEGIN
	FOR i IN
		(
		SELECT	username
		FROM	(
			SELECT	username,
				MAX( timestamp ) AS last_logon
			FROM	dba_audit_session
			WHERE	action_name = 'LOGON'
			)
		WHERE	last_logon < TRUNC( SYSDATE ) - 30
		)
	LOOP
		BEGIN
		EXECUTE IMMEDIATE 'ALTER USER ' || i.username || ' ACCOUNT LOCK;';
		EXCEPTION
			WHEN	OTHERS
			THEN
				DBMS_OUTPUT.PUT_LINE( i.username || ' ' || SQLERRM );
		END;
	END	LOOP;
END;
/
