VAR num_errors NUMBER;

BEGIN
DBMS_REDEFINITION.CAN_REDEF_TABLE
	(
	'SYSADM',
	'ORDERHDR_ALL',
	DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	TABLE sysadm.int_orderhdr_all
	(
	ohxact		NUMBER(38) NOT NULL,
	ohstatus	VARCHAR2(2) NOT NULL,
	ohstatusflg	FLOAT(126),
	ohentdate	DATE NOT NULL,
	ohrefnum	VARCHAR2(30),
	ohtshdate	DATE,
	ohsls		VARCHAR2(4),
	customer_id	NUMBER(38),
	ohcseq		NUMBER(38),
	ohsname		VARCHAR2(40),
	ohsaddr1	VARCHAR2(40),
	ohsaddr2	VARCHAR2(40),
	ohsaddr3	VARCHAR2(40),
	ohscity		VARCHAR2(40),
	ohsst		VARCHAR2(2),
	ohszip		VARCHAR2(15),
	ohscountry	VARCHAR2(40),
	ohscrc		VARCHAR2(4),
	ohattn		VARCHAR2(30),
	ohterms		NUMBER(4),
	ohtrucker	VARCHAR2(20),
	ohponum		VARCHAR2(20),
	ohrelease	DATE,
	ohpsno		VARCHAR2(20),
	ohfrtterms	VARCHAR2(20),
	ohordtyp	VARCHAR2(1),
	ohcandate	DATE,
	ohassocxact	NUMBER(38),
	ohprt1		NUMBER(38),
	ohprt2		NUMBER(38),
	ohprt3		NUMBER(38),
	ohuserid	VARCHAR2(10),
	ohrefdate	DATE,
	ohshpdate	DATE,
	ohduedate	DATE,
	ohipp		VARCHAR2(6),
	ohilpp		VARCHAR2(6),
	ohpostgl	DATE,
	ohpostar	DATE,
	oharcustomer_id	NUMBER(38),
	ohglar		VARCHAR2(30),
	ohdisdate	DATE,
	ddebit_flag	VARCHAR2(1),
	oharflg		VARCHAR2(1),
	ohinvtype	NUMBER(38),
	ohfulfildate	DATE,
	ohpayment_id	NUMBER(38),
	ohpostfibu	DATE,
	ohreason	NUMBER(38),
	ohrs_id		NUMBER(38),
	ohddhflag	VARCHAR2(1),
	ohddhdate	DATE,
	ohfct		DATE,
	ohlct		DATE,
	ohmod		VARCHAR2(1),
	ohxrate		FLOAT(126),
	oheccode	NUMBER(38),
	ohecname	VARCHAR2(30),
	ohglexact	NUMBER(38),
	ohdunstep	NUMBER(2),
	ohflfct		DATE,
	ohfllct		DATE,
	co_id		NUMBER(38),
	complaint	VARCHAR2(1),
	complaint_date	DATE,
	rtx_status	VARCHAR2(1),
	ohbillseqno	NUMBER(38),
	ohcancelflag	VARCHAR2(1),
	convdate_exchange	DATE,
	ohglexact_tax		NUMBER(38),
	glacode_diff		VARCHAR2(30),
	jobcost_id_diff		NUMBER(38),
	tax_rounding_flag	VARCHAR2(1),
	gl_currency		NUMBER(38) NOT NULL,
	document_currency	NUMBER(38) NOT NULL,
	document_convratetype_id	NUMBER(38) NOT NULL,
	secondary_currency		NUMBER(38),
	secondary_convratetype_id	NUMBER(38),
	ohinvamt_gl		FLOAT(126),
	ohopnamt_gl		FLOAT(126),
	ohdisamt_gl		FLOAT(126),
	ohdistakamt_gl		FLOAT(126),
	ohtaxamt_gl		FLOAT(126),
	taxamt_diff_gl		FLOAT(126),
	ohinvamt_doc		FLOAT(126),
	ohopnamt_doc		FLOAT(126),
	ohdisamt_doc		FLOAT(126),
	ohdistakamt_doc		FLOAT(126),
	ohtaxamt_doc		FLOAT(126),
	gl_convratetype_id	NUMBER(38),
	fee_balance		FLOAT(126),
	fee_balance_gross	FLOAT(126),
	currency		NUMBER(38),
	ohcostcent		NUMBER(38),
	rec_version		NUMBER(38) DEFAULT 0 NOT NULL,
	ohinvamt_secdoc		FLOAT(126),
	taxamt_diff_secdoc	FLOAT(126),
	paymentfailed		VARCHAR2(1),
	billing_account_id	NUMBER(38),
	balance_page_event_date		DATE,
	prepaid_balance_change_doc	FLOAT(126),
	prepaid_balance_change_gl	FLOAT(126),
	prepaid_glacode			VARCHAR2(30),
	prepaid_taxamt_diff_gl		FLOAT(126),
	prepaid_tax_diff_glacode	VARCHAR2(30)
	)
PARTITION BY RANGE( customer_id)
	(
	PARTITION orderhdr_all_1 VALUES LESS THAN (8000001),
	PARTITION orderhdr_all_2 VALUES LESS THAN (16000001),
	PARTITION orderhdr_all_3 VALUES LESS THAN (24000001),
	PARTITION orderhdr_all_4 VALUES LESS THAN (32000001),
	PARTITION orderhdr_all_5 VALUES LESS THAN (40000001),
	PARTITION orderhdr_all_6 VALUES LESS THAN (48000001),
	PARTITION orderhdr_all_7 VALUES LESS THAN (56000001),
	PARTITION orderhdr_all_8 VALUES LESS THAN (MAXVALUE)
	)
TABLESPACE d_bscs_billing
INITRANS 16
NOLOGGING;

BEGIN
DBMS_REDEFINITION.START_REDEF_TABLE
	(
	'SYSADM',
	'ORDERHDR_ALL',
	'INT_ORDERHDR_ALL',
	col_mapping => NULL,
	options_flag => DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	UNIQUE INDEX sysadm.int_pkorderhdr_all
ON	sysadm.int_orderhdr_all
	(
	ohxact
	)
PARTITION BY HASH (ohxact)
PARTITIONS 8
TABLESPACE i_bscs_billing
INITRANS 16
GLOBAL;

CREATE	INDEX sysadm.int_oh_cust_id_1
ON	sysadm.int_orderhdr_all
	(
	customer_id,
	ohstatus,
	ohentdate
	)
TABLESPACE i_bscs_billing
INITRANS 16
NOLOGGING
LOCAL;

BEGIN
DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS
	(
	'SYSADM',
	'ORDERHDR_ALL',
	'INT_ORDERHDR_ALL',
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
	'ORDERHDR_ALL',
	'INT_ORDERHDR_ALL'
	);
END;
/

BEGIN
DBMS_REDEFINITION.FINISH_REDEF_TABLE
	(
	'SYSADM',
	'ORDERHDR_ALL',
	'INT_ORDERHDR_ALL'
	);
END;
/

DROP	TABLE sysadm.int_orderhdr_all
CASCADE	CONSTRAINTS;

ALTER	INDEX sysadm.int_pkorderhdr_all
RENAME	TO pk_orderhdr_all;

ALTER	INDEX sysadm.int_oh_cust_id_1
RENAME	TO oh_cust_id_1;
