/*
|| Partitioning of PROFILE_SERVICE
||
|| $Log: profile_service.sql,v $
|| Revision 1.3  2011/04/01 17:34:24  shmyg
|| Fixed NOT NULL place for all scripts
||
|| Revision 1.2  2011-03-01 18:12:32  shmyg
|| Added trigger for SY
||
|| Revision 1.1  2011-02-22 17:06:57  shmyg
|| Reimplemented all partitioning scripts
||
*/

VAR num_errors NUMBER;

BEGIN
DBMS_REDEFINITION.CAN_REDEF_TABLE
	(
	'SYSADM',
	'PROFILE_SERVICE',
	DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE TABLE sysadm.int_profile_service
	(
	profile_id	NUMBER(38) NOT NULL,
	co_id		NUMBER(38) NOT NULL,
	sncode		NUMBER(38) NOT NULL,
	spcode_histno	NUMBER(38) NOT NULL,
	status_histno	NUMBER(38) NOT NULL,
	entry_date	DATE NOT NULL,
	channel_num	NUMBER(38),
	ovw_acc_first	VARCHAR2(1),
	date_billed	DATE,
	sn_class	NUMBER(38),
	ovw_subscr	VARCHAR2(1),
	subscript	FLOAT(126),
	ovw_access	VARCHAR2(1),
	ovw_acc_prd	NUMBER(38) NOT NULL,
	accessfee	FLOAT(126),
	channel_excl	VARCHAR2(1),
	dis_subscr	FLOAT(126),
	install_date	DATE,
	trial_end_date	DATE,
	prm_value_id	NUMBER(38),
	currency	NUMBER(38),
	srv_type	VARCHAR2(1),
	srv_subtype	VARCHAR2(1),
	ovw_adv_charge	VARCHAR2(1) NOT NULL,
	adv_charge	FLOAT(126),
	adv_charge_prd	NUMBER(38) NOT NULL,
	delete_flag	VARCHAR2(1),
	rec_version	NUMBER(38) NOT NULL,
	attrib_histno	NUMBER(38)
	)
PARTITION BY RANGE (co_id)
	(  
	PARTITION profile_service_1 VALUES LESS THAN (140000),
	PARTITION profile_service_2 VALUES LESS THAN (280000),
	PARTITION profile_service_3 VALUES LESS THAN (450000),
	PARTITION profile_service_4 VALUES LESS THAN (6500000),
	PARTITION profile_service_5 VALUES LESS THAN (10500000),
	PARTITION profile_service_6 VALUES LESS THAN (16000000),
	PARTITION profile_service_7 VALUES LESS THAN (21000000),
	PARTITION profile_service_8 VALUES LESS THAN (28000000),
	PARTITION profile_service_9 VALUES LESS THAN (34200000),
	PARTITION profile_service_10 VALUES LESS THAN (39500000),
	PARTITION profile_service_11 VALUES LESS THAN (41540000),
	PARTITION profile_service_12 VALUES LESS THAN (48540000),
	PARTITION profile_service_13 VALUES LESS THAN (55540000),
	PARTITION profile_service_14 VALUES LESS THAN (58540000),
	PARTITION profile_service_15 VALUES LESS THAN (61540000),
	PARTITION profile_service_16 VALUES LESS THAN (MAXVALUE)
	)
TABLESPACE d_bscs_big
INITRANS 32
PCTFREE 30
NOLOGGING;

BEGIN
DBMS_REDEFINITION.START_REDEF_TABLE
	(
	'SYSADM',
	'PROFILE_SERVICE',
	'INT_PROFILE_SERVICE',
	col_mapping => NULL,
	options_flag => DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

/*
CREATE INDEX sysadm.int_profile_service_1
ON	sysadm.int_profile_service
	(
	co_id,
	sncode,
	prm_value_id,
	profile_id
	)
TABLESPACE i_bscs_contract
INITRANS 32
NOLOGGING
LOCAL;

CREATE	INDEX sysadm.int_i_pr_serv_srv_subtype
ON	 sysadm.int_profile_service
	(
	co_id,
	sncode,
	profile_id,
	srv_subtype
	)
TABLESPACE i_bscs_contract
INITRANS 32
NOLOGGING
LOCAL;
*/

CREATE	UNIQUE INDEX sysadm.int_pk_profile_service
ON	sysadm.int_profile_service
	(
	co_id,
	sncode,
	profile_id
	)
TABLESPACE i_bscs_contract
INITRANS 32
NOLOGGING
LOCAL;

BEGIN
DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS
	(
	'SYSADM',
	'PROFILE_SERVICE',
	'INT_PROFILE_SERVICE',
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
	'PROFILE_SERVICE',
	'INT_PROFILE_SERVICE'
	);
END;
/

BEGIN
DBMS_REDEFINITION.FINISH_REDEF_TABLE
	(
	'SYSADM',
	'PROFILE_SERVICE',
	'INT_PROFILE_SERVICE'
	);
END;
/

DROP	TABLE sysadm.int_profile_service
CASCADE	CONSTRAINTS;
/*
ALTER	INDEX sysadm.int_profile_service_1
RENAME	TO i_proserv_coid_sn_prmvid_pid;

ALTER	INDEX sysadm.int_i_pr_serv_srv_subtype
RENAME	TO i_pr_serv_srv_subtype;
*/

ALTER	INDEX sysadm.int_pk_profile_service
RENAME	TO pk_profile_service;
