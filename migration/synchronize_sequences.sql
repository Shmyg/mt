alter TABLE sysadm.customer_all parallel 4;
alter TABLE sysadm.customer_role parallel 4;
alter TABLE sysadm.port parallel;
ALTER TABLE sysadm.tickler_records PARALLEL;
ALTER TABLE sysadm.party_role PARALLEL 4;

SPOOL reset_seq.txt

UPDATE	app_sequence
SET	select_statement = 'SELECT SUBSTR(MAX(co_code), 8) + 1 FROM contract_all'
WHERE	app_sequence_key = 'MAX_CO_CODE';

UPDATE	app_sequence
SET	select_statement = 'SELECT SUBSTR(MAX(custnum), 7) + 1 FROM customer_all WHERE customer_id > 1'
WHERE	app_sequence_key = 'MAX_CUST_NUM';

UPDATE	app_sequence
SET	select_statement = 'SELECT SUBSTR(MAX(custnum), 7) + 1 FROM customer_all WHERE customer_id > 1'
WHERE	app_sequence_key = 'MAX_DEALER_NUM';

UPDATE	app_sequence
SET	select_statement = 'SELECT SUBSTR(MAX(ff_pcode), 6) + 1 FROM mpufftab'
WHERE	app_sequence_key = 'MAX_FF_PCODE';

UPDATE	app_sequence
SET	select_statement = 'SELECT SUBSTR(MAX(billing_account_code), 5) + 1 FROM billing_account'
WHERE	app_sequence_key = 'MAX_BILLING_ACCNT_CODE';

UPDATE	app_sequence
SET	select_statement = 'SELECT TO_NUMBER(NVL(MAX(REPLACE(gvzn_shdes, ''GVZN'')), 0)) + 1 FROM mpuzntab WHERE gvzn_shdes LIKE ''GV%'''
WHERE	app_sequence_key = 'MAX_GVZN_SHDES';

UPDATE	app_sequence
SET	select_statement = 'SELECT TO_NUMBER(NVL(MAX(REPLACE(twtt_shdes, ''TWTT'')), 0)) + 1 FROM mputttab WHERE twtt_shdes LIKE ''TW%'''
WHERE	app_sequence_key = 'MAX_TWTT_SHDES';

BEGIN
	FOR	rec IN (select distinct app_sequence_schema from app_sequence)
	LOOP
		EXECUTE IMMEDIATE 'alter session set current_schema=' || rec.app_sequence_schema;
		seqpack.seq_create_all_app( i_resetsequence => TRUE );
	END	LOOP;
END;
/

SPOOL OFF;

alter session set current_schema=shmyg;

alter TABLE sysadm.customer_all noparallel;
alter TABLE sysadm.customer_role noparallel;
alter TABLE sysadm.port noparallel;
ALTER TABLE sysadm.tickler_records NOPARALLEL;
ALTER TABLE sysadm.party_role NOPARALLEL;
