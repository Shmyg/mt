/*
|| Partitioning for PR_SERV_STATUS_HIST
||
|| $Log: pr_serv_status_hist.sql,v $
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
	'PR_SERV_STATUS_HIST',
	DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE TABLE sysadm.int_pr_serv_status_hist
(
	profile_id	NUMBER(38) NOT NULL,
	co_id		NUMBER(38) NOT NULL,
	sncode		NUMBER(38) NOT NULL,
	histno		NUMBER(38) NOT NULL,
	status		VARCHAR2(1) NOT NULL,
	reason		NUMBER(38) NOT NULL,
	transactionno	NUMBER(38) NOT NULL,
	valid_from_date	DATE,
	entry_date	DATE NOT NULL,
	request_id	NUMBER(38),
	rec_version	NUMBER(38) NOT NULL,
	user_reason	NUMBER(38)
	)
PARTITION BY RANGE( co_id )
	(
	PARTITION pr_serv_status_hist_1 VALUES LESS THAN (140000),
	PARTITION pr_serv_status_hist_2 VALUES LESS THAN (280000),
	PARTITION pr_serv_status_hist_3 VALUES LESS THAN (450000),
	PARTITION pr_serv_status_hist_4 VALUES LESS THAN (6500000),
	PARTITION pr_serv_status_hist_5 VALUES LESS THAN (10500000),
	PARTITION pr_serv_status_hist_6 VALUES LESS THAN (16000000),
	PARTITION pr_serv_status_hist_7 VALUES LESS THAN (21000000),
	PARTITION pr_serv_status_hist_8 VALUES LESS THAN (28000000),
	PARTITION pr_serv_status_hist_9 VALUES LESS THAN (34200000),
	PARTITION pr_serv_status_hist_10 VALUES LESS THAN (39500000),
	PARTITION pr_serv_status_hist_11 VALUES LESS THAN (41540000),
	PARTITION pr_serv_status_hist_12 VALUES LESS THAN (48540000),
	PARTITION pr_serv_status_hist_13 VALUES LESS THAN (55540000),
	PARTITION pr_serv_status_hist_14 VALUES LESS THAN (58540000),
	PARTITION pr_serv_status_hist_15 VALUES LESS THAN (61540000),
	PARTITION pr_serv_status_hist_16 VALUES LESS THAN (MAXVALUE)
	)
TABLESPACE d_bscs_big
INITRANS 16
NOLOGGING
COMPRESS;

BEGIN
DBMS_REDEFINITION.START_REDEF_TABLE
	(
	'SYSADM',
	'PR_SERV_STATUS_HIST',
	'INT_PR_SERV_STATUS_HIST',
	col_mapping => NULL,
	options_flag => DBMS_REDEFINITION.CONS_USE_PK
	);
END;
/

CREATE	INDEX sysadm.int_1
ON sysadm.int_pr_serv_status_hist
	(
	co_id,
	request_id
	)
TABLESPACE i_bscs_big
INITRANS 16
NOLOGGING
COMPRESS
LOCAL; 

CREATE INDEX sysadm.int_2
ON sysadm.int_pr_serv_status_hist
	(
	co_id,
	sncode,
	profile_id,
	valid_from_date,
	status
	)
TABLESPACE i_bscs_big
INITRANS 16
NOLOGGING
COMPRESS
LOCAL;

CREATE UNIQUE INDEX sysadm.int_3
ON sysadm.int_pr_serv_status_hist
	(
	co_id,
	sncode,
	profile_id,
	histno
	)
TABLESPACE i_bscs_big
INITRANS 16
NOLOGGING
COMPRESS
LOCAL; 

BEGIN
DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS
	(
	'SYSADM',
	'PR_SERV_STATUS_HIST',
	'INT_PR_SERV_STATUS_HIST',
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
	'PR_SERV_STATUS_HIST',
	'INT_PR_SERV_STATUS_HIST'
	);
END;
/

BEGIN
DBMS_REDEFINITION.FINISH_REDEF_TABLE
	(
	'SYSADM',
	'PR_SERV_STATUS_HIST',
	'INT_PR_SERV_STATUS_HIST'
	);
END;
/

DROP	TABLE sysadm.int_pr_serv_status_hist
CASCADE	CONSTRAINTS;

ALTER	INDEX sysadm.int_1
RENAME	TO i_dbx_prserv_status_hist_coreq;

ALTER	INDEX sysadm.int_2
RENAME	TO i_pr_serv_stat_hist_val_st;

ALTER	INDEX sysadm.int_3
RENAME	TO pk_pr_serv_status_hist;

ALTER	INDEX sysadm.i_pr_serv_stat_hist_val_st UNUSABLE;
