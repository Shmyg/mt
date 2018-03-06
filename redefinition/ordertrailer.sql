VAR num_errors NUMBER;

BEGIN
DBMS_REDEFINITION.CAN_REDEF_TABLE
	(
	'SYSADM',
	'ORDERTRAILER',
	DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	TABLE sysadm.int_ordertrailer
	(
	otxact		NUMBER(38) NOT NULL,
	otseq		NUMBER(38) NOT NULL,
	otmeas		FLOAT(126),
	otum		VARCHAR2(3),
	otup		VARCHAR2(10),
	otqord		FLOAT(126),
	otqbkord	FLOAT(126),
	otqtoshp	FLOAT(126),
	otdftprc	VARCHAR2(10),
	otprgroup	VARCHAR2(10),
	otfrtwgt	FLOAT(126),
	otjobcost	NUMBER(38),
	otname		VARCHAR2(100),
	otglsale	VARCHAR2(30),
	otglcogs	VARCHAR2(30),
	otglinv		VARCHAR2(30),
	otqship		FLOAT(126),
	otprmeas	FLOAT(126),
	otprum		VARCHAR2(3),
	otbillunits	FLOAT(126),
	otinvunits	FLOAT(126),
	otcostflg	VARCHAR2(1),
	otinvalloc	FLOAT(126),
	otshipdate	DATE,
	sncode		NUMBER(38),
	oteq_id		NUMBER(38),
	oteqrate	FLOAT(126),
	otleasing	VARCHAR2(1),
	otleas_finish	DATE,
	otflsqn		NUMBER(38),
	otvplmn		VARCHAR2(5),
	otflname	VARCHAR2(60),
	otfct		DATE,
	otlct		DATE,
	otsim_from	VARCHAR2(50),
	otsim_to	VARCHAR2(50),
	ottransaction_date	DATE NOT NULL,
	servcat_code		VARCHAR2(10),
	serv_code		VARCHAR2(10),
	serv_type		VARCHAR2(3),
	tax_inclusive_ind	VARCHAR2(1),
	otgl_disc		VARCHAR2(30),
	otjcid_disc		NUMBER(38),
	otgl_mincom		VARCHAR2(30),
	otjcid_mincom		NUMBER(38),
	gl_currency		NUMBER(38) NOT NULL,
	document_currency	NUMBER(38) NOT NULL,
	otamt_disc_gl		FLOAT(126),
	otamt_disc_gross_gl	FLOAT(126),
	otamt_mincom_gl		FLOAT(126),
	otamt_mincom_gross_gl	FLOAT(126),
	otamt_revenue_gl	FLOAT(126),
	otamt_revenue_gross_gl	FLOAT(126),
	otcuramt_disc_gl	FLOAT(126),
	otcuramt_disc_gross_gl	FLOAT(126),
	otcuramt_gl		FLOAT(126),
	otcuramt_gross_gl	FLOAT(126),
	otcuramt_mincom_gl	FLOAT(126),
	otcuramt_mincom_gross_gl	FLOAT(126),
	otcuramt_revenue_gl		FLOAT(126),
	otcuramt_revenue_gross_gl	FLOAT(126),
	otmerch_gl			FLOAT(126),
	otmerch_gross_gl	FLOAT(126),
	otamt_disc_doc		FLOAT(126),
	otamt_disc_gross_doc	FLOAT(126),
	otamt_mincom_doc	FLOAT(126),
	otamt_mincom_gross_doc	FLOAT(126),
	otamt_revenue_doc	FLOAT(126),
	otamt_revenue_gross_doc	FLOAT(126),
	otcuramt_disc_doc	FLOAT(126),
	otcuramt_disc_gross_doc	FLOAT(126),
	otcuramt_doc		FLOAT(126),
	otcuramt_gross_doc	FLOAT(126),
	otcuramt_mincom_doc	FLOAT(126),
	otcuramt_mincom_gross_doc	FLOAT(126),
	otcuramt_revenue_doc		FLOAT(126),
	otcuramt_revenue_gross_doc	FLOAT(126),
	otgprice_dis_doc	FLOAT(126),
	otgprice_doc		FLOAT(126),
	otmerch_doc		FLOAT(126),
	otmerch_gross_doc	FLOAT(126),
	ottax_exempted_doc	FLOAT(126),
	rec_version		NUMBER(38) NOT NULL,
	otamt_disc_secdoc	FLOAT(126),
	otamt_disc_gross_secdoc	FLOAT(126),
	otamt_mincom_secdoc	FLOAT(126),
	otamt_mincom_gross_secdoc	FLOAT(126),
	otamt_revenue_secdoc		FLOAT(126),
	otamt_revenue_gross_secdoc	FLOAT(126),
	otgprice_secdoc		FLOAT(126),
	otgprice_dis_secdoc	FLOAT(126),
	otmerch_secdoc		FLOAT(126),
	otmerch__gross_secdoc	FLOAT(126),
	otflrapflg		VARCHAR2(1),
	tap_ref_no		NUMBER(38),
	tax_calculation_type	CHAR(1) NOT NULL,
	profile_id		NUMBER(38),
	payment_option		CHAR(1) NOT NULL,
	bp_co_id		NUMBER(38)
	)
PARTITION BY HASH(otxact)
PARTITIONS 16
TABLESPACE d_bscs_billing;
INITRANS 16
NOLOGGING;

BEGIN
DBMS_REDEFINITION.START_REDEF_TABLE
	(
	'SYSADM',
	'ORDERTRAILER',
	'INT_ORDERTRAILER',
	col_mapping => NULL,
	options_flag => DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	UNIQUE INDEX sysadm.int_pkordertrailer
ON	sysadm.int_ordertrailer
	(
	otxact,
	otseq
	)
TABLESPACE i_bscs_billing
INITRANS 16
LOCAL;

BEGIN
DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS
	(
	'SYSADM',
	'ORDERTRAILER',
	'INT_ORDERTRAILER',
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
	'ORDERTRAILER',
	'INT_ORDERTRAILER'
	);
END;
/

BEGIN
DBMS_REDEFINITION.FINISH_REDEF_TABLE
	(
	'SYSADM',
	'ORDERTRAILER',
	'INT_ORDERTRAILER'
	);
END;
/

DROP	TABLE sysadm.int_ordertrailer
CASCADE	CONSTRAINTS;

ALTER	INDEX sysadm.int_pkordertrailer
RENAME	TO pkordertrailer;
