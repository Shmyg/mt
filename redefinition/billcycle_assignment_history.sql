VAR num_errors NUMBER;

BEGIN
DBMS_REDEFINITION.CAN_REDEF_TABLE
	(
	'SYSADM',
	'BILLCYCLE_ASSIGNMENT_HISTORY',
	DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	TABLE sysadm.int_bah
	(
	customer_id	NUMBER(38) NOT NULL,
	seqno		NUMBER(38) NOT NULL,
	billcycle	VARCHAR2(2) NOT NULL,
	valid_from	DATE NOT NULL,
	reason_id	NUMBER(38) NOT NULL,
	username	VARCHAR2(16) NOT NULL,
	comments	VARCHAR2(256)
	)
PARTITION BY RANGE( customer_id )
	(
	PARTITION billcycle_assignment_history_1 VALUES LESS THAN (8000001),
	PARTITION billcycle_assignment_history_2 VALUES LESS THAN (16000001),
	PARTITION billcycle_assignment_history_3 VALUES LESS THAN (24000001),
	PARTITION billcycle_assignment_history_4 VALUES LESS THAN (32000001),
	PARTITION billcycle_assignment_history_5 VALUES LESS THAN (40000001),
	PARTITION billcycle_assignment_history_6 VALUES LESS THAN (48000001),
	PARTITION billcycle_assignment_history_7 VALUES LESS THAN (56000001),
	PARTITION billcycle_assignment_history_8 VALUES LESS THAN (MAXVALUE)
	)
TABLESPACE d_bscs_billing;
INITRANS 16
NOLOGGING;

BEGIN
DBMS_REDEFINITION.START_REDEF_TABLE
	(
	'SYSADM',
	'BILLCYCLE_ASSIGNMENT_HISTORY',
	'INT_BAH',
	col_mapping => NULL,
	options_flag => DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	INDEX sysadm.int_ix_bah
ON	sysadm.int_bah
	(
	customer_id,
	valid_from
	)
TABLESPACE i_bscs_customer
INITRANS 16
NOLOGGING
LOCAL;

CREATE	UNIQUE INDEX sysadm.int_pk_billcasshist
oN	sysadm.int_bah
	(
	customer_id,
	seqno
	)
TABLESPACE i_bscs_customer
INITRANS 16
NOLOGGING
LOCAL;

BEGIN
DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS
	(
	'SYSADM',
	'BILLCYCLE_ASSIGNMENT_HISTORY',
	'INT_BAH',
	DBMS_REDEFINITION.CONS_ORIG_PARAMS,
	TRUE,
	TRUE,
	TRUE,
	TRUE,
	:num_errors
	);
END;
/

BEGIN
DBMS_REDEFINITION.SYNC_INTERIM_TABLE
	(
	'SYSADM',
	'BILLCYCLE_ASSIGNMENT_HISTORY',
	'INT_BAH'
	);
END;
/

BEGIN
DBMS_REDEFINITION.FINISH_REDEF_TABLE
	(
	'SYSADM',
	'BILLCYCLE_ASSIGNMENT_HISTORY',
	'INT_BAH'
	);
END;
/

DROP	TABLE sysadm.int_bah
CASCADE	CONSTRAINTS;

ALTER	INDEX sysadm.int_pk_billcasshist
RENAME	TO pk_billcasshis;

ALTER	INDEX sysadm.int_ix_bah
RENAME	TO ix_billcyclasshist_cuid_val;
