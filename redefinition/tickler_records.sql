VAR num_errors NUMBER;

BEGIN
DBMS_REDEFINITION.CAN_REDEF_TABLE
	(
	'SYSADM',
	'TICKLER_RECORDS',
	DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	TABLE sysadm.int_tickler_records
	(
	customer_id		NUMBER(*,0) NOT NULL DEFAULT 0,
	tickler_number		NUMBER(*,0) NOT NULL DEFAULT 0,
	tickler_code		VARCHAR2(8) NOT NULL DEFAULT ' ',
	tickler_status		VARCHAR2(8) NOT NULL DEFAULT ' ',
	priority		NUMBER(*,0) NOT NULL DEFAULT 0,
	follow_up_code		VARCHAR2(8),
	follow_up_date		DATE,
	follow_up_user		VARCHAR2(16),
	x_coordinate		VARCHAR2(15),
	y_coordinate		VARCHAR2(15),
	distribution_user1	VARCHAR2(16),
	distribution_user2	VARCHAR2(16),
	distribution_user3	VARCHAR2(16),
	created_by		VARCHAR2(16),
	created_date		DATE DEFAULT (SYSDATE),
	modified_by		VARCHAR2(16),
	modified_date		DATE,
	closed_by		VARCHAR2(16),
	closed_date		DATE,
	short_description	VARCHAR2(20),
	long_description	VARCHAR2(2000),
	co_id			NUMBER(*,0),
	msg_user		VARCHAR2(16),
	msg_date		DATE,
	mkt_id			NUMBER(*,0),
	msg_id			NUMBER(*,0),
	equ_id			NUMBER(*,0),
	usg_id			NUMBER(*,0),
	src_id			NUMBER(*,0),
	typ_id			NUMBER(*,0),
	act_id			NUMBER(*,0),
	tr_code			VARCHAR2(18),
	rec_version		NUMBER(*,0) NOT NULL DEFAULT 0,
	follow_up_status	VARCHAR2(1) DEFAULT 'N'
	)
PARTITION BY RANGE( customer_id)
	(
	PARTITION tickler_records_1 VALUES LESS THAN (8000001),
	PARTITION tickler_records_2 VALUES LESS THAN (16000001),
	PARTITION tickler_records_3 VALUES LESS THAN (24000001),
	PARTITION tickler_records_4 VALUES LESS THAN (32000001),
	PARTITION tickler_records_5 VALUES LESS THAN (40000001),
	PARTITION tickler_records_6 VALUES LESS THAN (48000001),
	PARTITION tickler_records_7 VALUES LESS THAN (56000001),
	PARTITION tickler_records_8 VALUES LESS THAN (MAXVALUE)
	)
TABLESPACE d_bscs_big
INITRANS 16
NOLOGGING
COMPRESS;

BEGIN
DBMS_REDEFINITION.START_REDEF_TABLE
	(
	'SYSADM',
	'TICKLER_RECORDS',
	'INT_TICKLER_RECORDS',
	col_mapping => NULL,
	options_flag => DBMS_REDEFINITION.CONS_USE_PK
	;
END;
/

CREATE	UNIQUE INDEX sysadm.int_pktickler_records
ON	sysadm.int_tickler_records
	(
	customer_id,
	tickler_number
	)
TABLESPACE	i_bscs_customer
INITRANS 16
NOLOGGING
LOCAL;

BEGIN
DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS
	(
	'SYSADM',
	'TICKLER_RECORDS',
	'INT_TICKLER_RECORDS',
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
	'TICKLER_RECORDS',
	'INT_TICKLER_RECORDS'
	);
END;
/

BEGIN
DBMS_REDEFINITION.FINISH_REDEF_TABLE
	(
	'SYSADM',
	'TICKLER_RECORDS',
	'INT_TICKLER_RECORDS'
	);
END;
/

DROP	TABLE sysadm.int_tickler_records
CASCADE	CONSTRAINTS;

ALTER	INDEX sysadm.int_pktickler_records
RENAME	TO pk_tickler_records;
