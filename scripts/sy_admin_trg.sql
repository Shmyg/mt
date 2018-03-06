/*
|| Trigger used to assign some specific role to the users when they're granted
|| SY admin rights and revoke them if the user is transferred to another group
||
|| $Log: sy_admin_trg.sql,v $
|| Revision 1.2  2011/03/09 09:54:30  shmyg
|| *** empty log message ***
||
|| Revision 1.1  2011-03-01 18:12:32  shmyg
|| Added trigger for SY
||
*/

CREATE	OR REPLACE
TRIGGER	sysadm.grant_admin
AFTER	INSERT OR UPDATE OR DELETE
ON	sysadm.users
FOR	EACH ROW
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
	role_not_granted	EXCEPTION;
	PRAGMA EXCEPTION_INIT (role_not_granted, -1951);
		
		
BEGIN
	IF	:new.group_user = 'ADMINS'
	THEN
		EXECUTE	IMMEDIATE 'grant sy_admin_role to ' ||  :new.username;
	ELSIF	:new.group_user IS NOT NULL
	THEN
		EXECUTE	IMMEDIATE 'revoke sy_admin_role from ' ||  :old.username;
	END	IF;
EXCEPTION
	WHEN	role_not_granted
	THEN	NULL;
END;
/
