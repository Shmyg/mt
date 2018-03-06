/*
|| Recreation of pr_serv_spcode_hist as a partitioned table
||
|| $Log: pr_serv_spcode.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-10-18 13:50:19  shmyg
|| Added PR* partitioning scripts
||
*/

ALTER	TABLE sysadm.pr_serv_spcode_hist
DROP	PRIMARY KEY CASCADE;

DROP	TABLE sysadm.pr_serv_spcode_hist
CASCADE	CONSTRAINTS;

CREATE	TABLE sysadm.pr_serv_spcode_hist
	(
	PROFILE_ID	INTEGER	NOT NULL,
	CO_ID		INTEGER	NOT NULL,
	SNCODE		INTEGER	NOT NULL,
	HISTNO		INTEGER	NOT NULL,
	SPCODE		INTEGER	NOT NULL,
	TRANSACTIONNO	INTEGER	NOT NULL,
	VALID_FROM_DATE	DATE,
	ENTRY_DATE	DATE DEFAULT SYSDATE NOT NULL,
	REQUEST_ID	INTEGER,
	REC_VERSION	INTEGER DEFAULT 0 NOT NULL
	)
TABLESPACE d_bscs_big
LOGGING
PARTITION BY RANGE (CO_ID)
(  
  PARTITION P01_M_PSSP VALUES LESS THAN (1000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P02_M_PSSP VALUES LESS THAN (2000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P03_M_PSSP VALUES LESS THAN (3000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P04_M_PSSP VALUES LESS THAN (4000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P05_M_PSSP VALUES LESS THAN (5000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P06_M_PSSP VALUES LESS THAN (6000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P07_M_PSSP VALUES LESS THAN (7000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P08_M_PSSP VALUES LESS THAN (8000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P09_M_PSSP VALUES LESS THAN (9000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P10_M_PSSP VALUES LESS THAN (10000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P11_M_PSSP VALUES LESS THAN (11000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P12_M_PSSP VALUES LESS THAN (12000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P13_M_PSSP VALUES LESS THAN (13000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P14_M_PSSP VALUES LESS THAN (14000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P15_M_PSSP VALUES LESS THAN (15000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P16_M_PSSP VALUES LESS THAN (16000001)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P17_M_PSSP VALUES LESS THAN (17000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P18_M_PSSP VALUES LESS THAN (18000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P19_M_PSSP VALUES LESS THAN (19000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P20_M_PSSP VALUES LESS THAN (20000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P21_M_PSSP VALUES LESS THAN (21000001)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P22_M_PSSP VALUES LESS THAN (22000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P23_M_PSSP VALUES LESS THAN (23000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P24_M_PSSP VALUES LESS THAN (24000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P25_M_PSSP VALUES LESS THAN (25000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P26_M_PSSP VALUES LESS THAN (26000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P27_M_PSSP VALUES LESS THAN (27000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P28_M_PSSP VALUES LESS THAN (28000001)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P29_M_PSSP VALUES LESS THAN (29000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P30_M_PSSP VALUES LESS THAN (30000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P31_M_PSSP VALUES LESS THAN (31000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P32_M_PSSP VALUES LESS THAN (32000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P33_M_PSSP VALUES LESS THAN (33000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P34_M_PSSP VALUES LESS THAN (34000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P35_M_PSSP VALUES LESS THAN (35000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P36_M_PSSP VALUES LESS THAN (36000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P37_M_PSSP VALUES LESS THAN (37000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P38_M_PSSP VALUES LESS THAN (38000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P39_M_PSSP VALUES LESS THAN (39000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P40_M_PSSP VALUES LESS THAN (40000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P41_M_PSSP VALUES LESS THAN (41000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P42_M_PSSP VALUES LESS THAN (42000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P43_M_PSSP VALUES LESS THAN (43000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P44_M_PSSP VALUES LESS THAN (44000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P45_M_PSSP VALUES LESS THAN (45000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P46_M_PSSP VALUES LESS THAN (46000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P47_M_PSSP VALUES LESS THAN (47000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P48_M_PSSP VALUES LESS THAN (48000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P49_M_PSSP VALUES LESS THAN (49000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P50_M_PSSP VALUES LESS THAN (50000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P51_M_PSSP VALUES LESS THAN (51000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P52_M_PSSP VALUES LESS THAN (52000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P53_M_PSSP VALUES LESS THAN (53000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P54_M_PSSP VALUES LESS THAN (54000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P55_M_PSSP VALUES LESS THAN (55000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P56_M_PSSP VALUES LESS THAN (56000000)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
,
  PARTITION P57_M_PSSP VALUES LESS THAN (MAXVALUE)
    LOGGING
    COMPRESS
    TABLESPACE d_bscs_big
)
COMPRESS 
MONITORING;

COMMENT ON TABLE sysadm.pr_serv_spcode_hist IS 'This table contains the history of service package changes for services within profiles. For further information see description of the parent table PROFILE_SERVICE.';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.SPCODE IS 'Service package of the service.';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.TRANSACTIONNO IS 'Transaction number. This attribute is used for reproducing which history entries were simultaneously stored (stored during one transaction with this transaction number). The sequence PR_SERV_TRANS_NO produces attribute values.';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.VALID_FROM_DATE IS 'From this date on the value of SPCODE is valid. At this date the request has been processed. Or from this date the switch has allowed to use the package.';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.ENTRY_DATE IS 'Date of insertion of an entry.';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.REQUEST_ID IS 'With this request the value of SPCODE is ordered. FK pointing to the GMD_REQUEST_BASE table, this table contains the requested date.';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.REC_VERSION IS 'Record Version
The pr_serv_spcode_hist.REC_VERSION attribute specifies the counter for multi user access. It is used for the optimistic locking method.';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.PROFILE_ID IS 'Profile identifier, a part of FK pointing to the PROFILE_SERVICE table';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.CO_ID IS 'Contract identifier, a part of FK pointing to the PROFILE_SERVICE table';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.SNCODE IS 'Service identifier, a part of FK pointing to the PROFILE_SERVICE table';

COMMENT ON COLUMN sysadm.pr_serv_spcode_hist.HISTNO IS 'History number beginning with 1.
Sequence for building of the HISTNO is used.';


CREATE	UNIQUE INDEX sysadm.pk_pr_serv_spcode_hist
ON	sysadm.pr_serv_spcode_hist
	(
	CO_ID,
	SNCODE,
	PROFILE_ID,
	HISTNO
	)
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P_2M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P03_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P04_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P05M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P6_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P07_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P08_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P09_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P10_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P11_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P12_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P13_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P14_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P15_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P17_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P18_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P19_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P20_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P22_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P23_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P24_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P25_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P26_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P27_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P29_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P30_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P31_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P32_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P33_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P34_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P35_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P36_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P37_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P38_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P39_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P40_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P41_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P42_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P43_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P44_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P45_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P46_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P47_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P48_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P49_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P50_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P51_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P52_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P53_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P54_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P55_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P56_M1_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
)
PARALLEL;


DROP PUBLIC SYNONYM pr_serv_spcode_hist;

CREATE PUBLIC SYNONYM pr_serv_spcode_hist FOR sysadm.pr_serv_spcode_hist;

ALTER	TABLE sysadm.pr_serv_spcode_hist
ADD	CONSTRAINT pk_pr_serv_spcode_hist
PRIMARY	KEY
	(
	CO_ID,
	SNCODE,
	PROFILE_ID,
	HISTN
	)
USING	INDEX LOCAL;

ALTER	TABLE sysadm.pr_serv_spcode_histo
ADD	(
	CONSTRAINT fk_pr_serv_spcode_hist_request 
	FOREIGN	KEY (REQUEST_ID) 
	REFERENCES sysadm.GMD_REQUEST_BASE (REQUEST_ID),
	CONSTRAINT FK_PR_SERV_SPCODE_HST_MPUSPTAB 
	FOREIGN	KEY (SPCODE) 
	REFERENCES sysadm.MPUSPTAB (SPCODE)
);

GRANT DELETE, INSERT, SELECT, UPDATE ON sysadm.pr_serv_spcode_hist TO BSCS_ROLE;

GRANT INSERT, SELECT, UPDATE ON sysadm.pr_serv_spcode_hist TO MUTROLE;

GRANT SELECT ON sysadm.pr_serv_spcode_hist TO VEHIB;
