VAR num_errors NUMBER;

BEGIN
DBMS_REDEFINITION.CAN_REDEF_TABLE
	(
	'SYSADM',
	'CUSTOMER_ALL',
	DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	TABLE sysadm.int_customer_all
	(
	customer_id		NUMBER(38) NOT NULL,
	customer_id_high	NUMBER(38),
	custcode		VARCHAR2(24) NOT NULL,
	csst			VARCHAR2(2),
	cstype			VARCHAR2(1),
	csactivated		DATE,
	csdeactivated		DATE,
	cstype_date		DATE,
	cslevel			VARCHAR2(2),
	cscusttype		VARCHAR2(1),
	cslvlname		VARCHAR2(10),
	tmcode			NUMBER(38),
	prgcode			VARCHAR2(10),
	csclimit		FLOAT(126),
	cscurbalance		FLOAT(126),
	csdepdate		DATE,
	cstestbillrun		VARCHAR2(1),
	bill_layout		NUMBER(38),
	paymntresp		VARCHAR2(1),
	target_reached		NUMBER(38),
	pcsmethpaymnt		VARCHAR2(1),
	passportno		VARCHAR2(30),
	birthdate		DATE,
	dunning_flag		VARCHAR2(1),
	comm_no			VARCHAR2(20),
	pos_comm_type		NUMBER(38),
	btx_password		VARCHAR2(8),
	btx_user		VARCHAR2(14),
	settles_p_month		VARCHAR2(12),
	cashretour		NUMBER(38),
	cstradecode		VARCHAR2(10),
	cspassword		VARCHAR2(20),
	cspromotion		VARCHAR2(1),
	cscompregno		VARCHAR2(20),
	cscomptaxno		VARCHAR2(20),
	csreason		NUMBER(38),
	cscollector		VARCHAR2(16),
	cscontresp		VARCHAR2(1),
	csdeposit		FLOAT(126),
	cscredit_date		DATE,
	cscredit_remark		VARCHAR2(2000),
	suspended		DATE,
	reactivated		DATE,
	prev_balance		FLOAT(126),
	lbc_date		DATE,
	employee		VARCHAR2(1),
	company_type		VARCHAR2(1),
	crlimit_exc		VARCHAR2(1),
	area_id			NUMBER(38),
	costcenter_id		NUMBER(38),
	csfedtaxid		VARCHAR2(5),
	credit_rating		NUMBER(38),
	cscredit_status		VARCHAR2(2),
	deact_create_date	DATE,
	deact_receip_date	DATE,
	edifact_addr		VARCHAR2(32),
	edifact_user_flag	VARCHAR2(1),
	edifact_flag		VARCHAR2(1),
	csdeposit_due_date	DATE,
	calculate_deposit	VARCHAR2(1),
	tmcode_date		DATE,
	csrentalbc		VARCHAR2(2),
	id_type			NUMBER(38),
	user_lastmod		VARCHAR2(16),
	csentdate		DATE NOT NULL,
	csmoddate		DATE,
	csmod			VARCHAR2(1),
	csnationality		NUMBER(38),
	customer_id_ext		VARCHAR2(10),
	csclimit_o_tr1		NUMBER(38),
	csclimit_o_tr2		NUMBER(38),
	csclimit_o_tr3		NUMBER(38),
	cscredit_score		VARCHAR2(40),
	cstraderef		VARCHAR2(2000),
	cssocialsecno		VARCHAR2(20),
	csdrivelicence		VARCHAR2(20),
	cssex			VARCHAR2(1),
	csemployer		VARCHAR2(40),
	wpid			NUMBER(38),
	csprepayment		VARCHAR2(1),
	csremark_1		VARCHAR2(40),
	csremark_2		VARCHAR2(40),
	bill_information	VARCHAR2(1),
	dealer_id		NUMBER(38),
	dunning_mode		VARCHAR2(4),
	not_valid		VARCHAR2(1),
	cscrdcheck_agreed	VARCHAR2(1),
	marital_status		NUMBER(38),
	expect_pay_curr_id	NUMBER(38),
	convratetype_payment	NUMBER(38),
	refund_curr_id		NUMBER(38),
	convratetype_refund	NUMBER(38),
	srcode			NUMBER(38),
	currency		NUMBER(38) NOT NULL,
	rec_version		NUMBER(38) NOT NULL,
	anonymous_customer	VARCHAR2(1),
	external_customer_id	VARCHAR2(15),
	external_customer_set_id	VARCHAR2(5),
	custnum				VARCHAR2(30) NOT NULL,
	business_unit_id		NUMBER(38) NOT NULL,
	party_type_id			NUMBER(38) NOT NULL,
	individual_overdisc_flag	CHAR(1),
	billing_threshold		FLOAT(126),
	billing_threshold_currency	NUMBER(38),
	threshold_billing_mode		CHAR(2),
	threshold_billing_purpose	CHAR(3),
	created_by_user			VARCHAR2(16)
	)
PARTITION BY RANGE( customer_id )
	(
	PARTITION customer_all_1 VALUES LESS THAN (8000001),
	PARTITION customer_all_2 VALUES LESS THAN (16000001),
	PARTITION customer_all_3 VALUES LESS THAN (24000001),
	PARTITION customer_all_4 VALUES LESS THAN (32000001),
	PARTITION customer_all_5 VALUES LESS THAN (40000001),
	PARTITION customer_all_6 VALUES LESS THAN (48000001),
	PARTITION customer_all_7 VALUES LESS THAN (56000001),
	PARTITION customer_all_8 VALUES LESS THAN (MAXVALUE)
	)
TABLESPACE d_bscs_customer
INITRANS 16
NOLOGGING;

BEGIN
DBMS_REDEFINITION.START_REDEF_TABLE
	(
	'SYSADM',
	'CUSTOMER_ALL',
	'INT_CUSTOMER_ALL',
	col_mapping => NULL,
	options_flag => DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	UNIQUE INDEX sysadm.int_pkcustomer_all
ON	sysadm.int_customer_all
	(
	customer_id
	)
TABLESPACE i_bscs_customer
NOLOGGING
LOCAL;

BEGIN
DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS
	(
	'SYSADM',
	'CUSTOMER_ALL',
	'INT_CUSTOMER_ALL',
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
	'CUSTOMER_ALL',
	'INT_CUSTOMER_ALL'
	);
END;
/

BEGIN
DBMS_REDEFINITION.FINISH_REDEF_TABLE
	(
	'SYSADM',
	'CUSTOMER_ALL',
	'INT_CUSTOMER_ALL'
	);
END;
/

DROP	TABLE sysadm.int_customer_all
CASCADE	CONSTRAINTS;

ALTER	INDEX sysadm.int_pkcustomer_all
RENAME	TO pk_customer_all;

BEGIN
DBMS_STATS.GATHER_TABLE_STATS('SYSADM', 'CUSTOMER_ALL', degree => NULL, granularity => 'ALL', estimate_percent => 5);
END;
/

