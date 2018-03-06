/*
|| Marks all BSCS passwords (not Oracle!) as expired
||
|| $Log: expire_all_bscs_passwords.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
*/

UPDATE	password_history
SET	valid_to = SYSDATE
WHERE	valid_to IS NULL
/

COMMIT
/
