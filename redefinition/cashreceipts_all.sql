VAR num_errors NUMBER;

BEGIN
DBMS_REDEFINITION.CAN_REDEF_TABLE
	(
	'SYSADM',
	'CASHRECEIPTS_ALL',
	DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	TABLE sysadm.int_cashreceipts_all
	(
	caxact		FLOAT(126) NOT NULL,
	customer_id	NUMBER(38),
	caentdate	DATE NOT NULL,
	carecdate	DATE,
	cachknum	VARCHAR2(30),
	cachkdate	DATE,
	caglcash	VARCHAR2(30),
	cagldis		VARCHAR2(30),
	catype		VARCHAR2(2),
	cabatch		FLOAT(126),
	carem		VARCHAR2(60),
	capostgl	DATE,
	capp		VARCHAR2(6),
	cabankname	VARCHAR2(58),
	cabankacc	VARCHAR2(25),
	cabanksubacc	VARCHAR2(20),
	causername	VARCHAR2(16),
	caapplication	VARCHAR2(1),
	catransfer	VARCHAR2(1),
	cajobcost	NUMBER(38),
	cadebit_info1	VARCHAR2(60),
	cadebit_date	VARCHAR2(60),
	cadebit_info2	VARCHAR2(60),
	camod		VARCHAR2(1) NOT NULL,
	camicrofiche	NUMBER(38),
	capaym_place	VARCHAR2(10),
	caglexact	NUMBER(38),
	cacostcent	NUMBER(38),
	careasoncode	NUMBER(38),
	cadocrefnum	VARCHAR2(50),
	caprinted	DATE,
	caprintedby	VARCHAR2(16),
	caglexact_tax	NUMBER(38),
	caxact_related_transfer	NUMBER(38),
	payment_currency	NUMBER(38) NOT NULL, 
	gl_currency		NUMBER(38),
	convratetype_gl		NUMBER(38),
	convratetype_doc	NUMBER(38),
	cachkamt_gl		FLOAT(126),
	cadisamt_gl		FLOAT(126),
	cacuramt_gl		FLOAT(126),
	cachkamt_pay		FLOAT(126),
	cadisamt_pay		FLOAT(126),
	cacuramt_pay		FLOAT(126),
	balance_exch_diff_gl	FLOAT(126),
	balance_exch_diff_glacode	VARCHAR2(30),
	balance_exch_diff_jcid	NUMBER(38),
	cabalance_home		FLOAT(126),
	currency		NUMBER(38) NOT NULL,
	rec_version		NUMBER(38) NOT NULL,
	balance_page_event_date	DATE,
	capayment_mode		NUMBER(38)
	)
PARTITION BY RANGE( customer_id )
	(
	PARTITION cashreceipts_all_1 VALUES LESS THAN (8000001),
	PARTITION cashreceipts_all_2 VALUES LESS THAN (16000001),
	PARTITION cashreceipts_all_3 VALUES LESS THAN (24000001),
	PARTITION cashreceipts_all_4 VALUES LESS THAN (32000001),
	PARTITION cashreceipts_all_5 VALUES LESS THAN (40000001),
	PARTITION cashreceipts_all_6 VALUES LESS THAN (48000001),
	PARTITION cashreceipts_all_7 VALUES LESS THAN (56000001),
	PARTITION cashreceipts_all_8 VALUES LESS THAN (MAXVALUE)
	)
TABLESPACE d_bscs_billing;
INITRANS 16
NOLOGGING;

BEGIN
DBMS_REDEFINITION.START_REDEF_TABLE
	(
	'SYSADM',
	'CASHRECEIPTS_ALL',
	'INT_CASHRECEIPTS_ALL',
	col_mapping => NULL,
	options_flag => DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	UNIQUE INDEX sysadm.int_pkcashreceipts_all
ON	sysadm.int_cashreceipts_all
	(
	caxact
	)
PARTITION BY HASH (caxact)
PARTITIONS 8
TABLESPACE i_bscs_billing;
INITRANS 8
GLOBAL;

CREATE	INDEX sysadm.int_cashcsindex
ON	sysadm.int_cashreceipts_all
	(
	customer_id,
	cachkdate
	)
TABLESPACE i_bscs_billing
INITRANS 16
NOLOGGING
LOCAL;

BEGIN
DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS
	(
	'SYSADM',
	'CASHRECEIPTS_ALL',
	'INT_CASHRECEIPTS_ALL',
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
	'CASHRECEIPTS_ALL',
	'INT_CASHRECEIPTS_ALL'
	);
END;
/

BEGIN
DBMS_REDEFINITION.FINISH_REDEF_TABLE
	(
	'SYSADM',
	'CASHRECEIPTS_ALL',
	'INT_CASHRECEIPTS_ALL'
	);
END;
/

DROP	TABLE sysadm.int_cashreceipts_all
CASCADE	CONSTRAINTS;

ALTER	INDEX sysadm.int_pkcashreceipts_all
RENAME	TO pkcashreceipts_all;

ALTER	INDEX sysadm.int_cashcsindex
RENAME	TO cashcsindex;
