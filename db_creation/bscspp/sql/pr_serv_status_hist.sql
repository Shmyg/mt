/*
|| Recreation of PR_SERV_STATUS_HIST as a partitioned table
||
|| $Log: pr_serv_status_hist.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-10-18 13:50:19  shmyg
|| Added PR* partitioning scripts
||
*/

ALTER TABLE SYSADM.PR_SERV_STATUS_HIST
 DROP PRIMARY KEY CASCADE;

DROP TABLE SYSADM.PR_SERV_STATUS_HIST CASCADE CONSTRAINTS;

CREATE TABLE SYSADM.PR_SERV_STATUS_HIST
(
  PROFILE_ID       INTEGER                      NOT NULL,
  CO_ID            INTEGER                      NOT NULL,
  SNCODE           INTEGER                      NOT NULL,
  HISTNO           INTEGER                      NOT NULL,
  STATUS           VARCHAR2(1 BYTE)             NOT NULL,
  REASON           INTEGER                      NOT NULL,
  TRANSACTIONNO    INTEGER                      NOT NULL,
  VALID_FROM_DATE  DATE,
  ENTRY_DATE       DATE                         DEFAULT SYSDATE               NOT NULL,
  REQUEST_ID       INTEGER,
  REC_VERSION      INTEGER                      DEFAULT 0                     NOT NULL,
  USER_REASON      INTEGER
)
TABLESPACE D_BSCS_BIG
LOGGING
PARTITION BY RANGE (CO_ID)
(  
  PARTITION P01_M_PSS VALUES LESS THAN (1000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P02_M_PSS VALUES LESS THAN (2000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P03_M_PSS VALUES LESS THAN (3000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P04_M_PSS VALUES LESS THAN (4000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P05_M_PSS VALUES LESS THAN (5000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P06_M_PSS VALUES LESS THAN (6000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P07_M_PSS VALUES LESS THAN (7000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P08_M_PSS VALUES LESS THAN (8000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P09_M_PSS VALUES LESS THAN (9000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P10_M_PSS VALUES LESS THAN (10000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P11_M_PSS VALUES LESS THAN (11000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P12_M_PSS VALUES LESS THAN (12000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P13_M_PSS VALUES LESS THAN (13000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P14_M_PSS VALUES LESS THAN (14000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P15_M_PSS VALUES LESS THAN (15000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P16_M_PSS VALUES LESS THAN (16000001)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P17_M_PSS VALUES LESS THAN (17000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P18_M_PSS VALUES LESS THAN (18000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P19_M_PSS VALUES LESS THAN (19000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P20_M_PSS VALUES LESS THAN (20000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P21_M_PSS VALUES LESS THAN (21000001)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P22_M_PSS VALUES LESS THAN (22000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P23_M_PSS VALUES LESS THAN (23000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P24_M_PSS VALUES LESS THAN (24000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P25_M_PSS VALUES LESS THAN (25000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P26_M_PSS VALUES LESS THAN (26000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P27_M_PSS VALUES LESS THAN (27000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P28_M_PSS VALUES LESS THAN (28000001)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P29_M_PSS VALUES LESS THAN (29000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P30_M_PSS VALUES LESS THAN (30000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P31_M_PSS VALUES LESS THAN (31000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P32_M_PSS VALUES LESS THAN (32000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P33_M_PSS VALUES LESS THAN (33000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P34_M_PSS VALUES LESS THAN (34000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P35_M_PSS VALUES LESS THAN (35000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P36_M_PSS VALUES LESS THAN (36000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P37_M_PSS VALUES LESS THAN (37000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P38_M_PSS VALUES LESS THAN (38000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P39_M_PSS VALUES LESS THAN (39000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P40_M_PSS VALUES LESS THAN (40000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P41_M_PSS VALUES LESS THAN (41000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P42_M_PSS VALUES LESS THAN (42000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P43_M_PSS VALUES LESS THAN (43000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P44_M_PSS VALUES LESS THAN (44000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P45_M_PSS VALUES LESS THAN (45000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P46_M_PSS VALUES LESS THAN (46000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P47_M_PSS VALUES LESS THAN (47000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P48_M_PSS VALUES LESS THAN (48000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P49_M_PSS VALUES LESS THAN (49000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P50_M_PSS VALUES LESS THAN (50000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P51_M_PSS VALUES LESS THAN (51000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P52_M_PSS VALUES LESS THAN (52000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P53_M_PSS VALUES LESS THAN (53000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P54_M_PSS VALUES LESS THAN (54000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P55_M_PSS VALUES LESS THAN (55000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P56_M_PSS VALUES LESS THAN (56000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P57_M_PSS VALUES LESS THAN (MAXVALUE)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
)
COMPRESS 
NOCACHE
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT )
MONITORING;

COMMENT ON TABLE SYSADM.PR_SERV_STATUS_HIST IS 'This table contains the history of service status changes within profiles. For further information see description of the parent table PROFILE_SERVICE.';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.PROFILE_ID IS 'Profile identifier, a part of FK pointing to the PROFILE_SERVICE table';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.CO_ID IS 'Contract identifier, a part of FK pointing to the PROFILE_SERVICE table';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.SNCODE IS 'Service identifier, a part of FK pointing to the PROFILE_SERVICE table';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.HISTNO IS 'History number beginning with 1.
Sequence for building of the HISTNO is used.';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.STATUS IS 'Status of the service within a profile. Domain:  A (active), D (deactivate), S (suspended in a contract), O (initial value, on-hold status).';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.REASON IS 'Reason of status change, possible values are:
0 initial activation
1 following state value of the service within a profile during its life cycle without any external reasons (reasons 2 till 5),
2 Service package change, external reason,
3 Tariff model change, external reason,
4 Profile change (s. PROFILE_CHANGE_HIST), external reason,
5 Contract suspension, external reason.
6 Free Unit Service deactivation in case of a business unit change if the related free unit package cannot be valid, external reason.
9 Service is invisible. Reason could not be determined during data migration. Valid only in combination with status D.
For further information see Main HLD for the 82630 feature.
Note for developers with process description: The database cannot guaranty that the value of this attribute corresponds to a reason caused in the reality the status change. For example, if the attribute value is 3, the database cannot guaranty that the RATEPLAN_HIST table obtains the corresponding entry with the new rate plan. For this purpose the attribute TRANSACTIONNO serves (s. example below).
This attribute is used only for performance goals. And the BSCS-program has to guarantee the consistency of data.
Example: a new entry of the PR_SERV_STATUS_HIST table with the following values has to be inserted (The status change within entries is not allowed, a new entry with the new status has to be inserted.): STATUS = `D`, TRANSACTIONNO=5 and the REASON=3. It means the RATEPLAN_HIST table has to obtain the new entry containing some new rate plan with the same TRANSACTIONNO value as the mentioned above entry has. The TRANSACTIONNO value shows which entries from different tables were simultaneously into the database inserted.';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.TRANSACTIONNO IS 'Transaction number. This attribute is used for reproducing which history entries were simultaneously stored (stored during one transaction with this transaction number). The sequence PR_SERV_TRANS_NO produces attribute values.';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.VALID_FROM_DATE IS 'From this date on the value of STATUS is valid. At this date the request has been processed. Or from this date the switch has set this status. Note: assume that the service is active. It means, that this table contains the corresponding entry with the STATUS=A. If a new status e.g. D is requested, then the new entry with D-status and VALID_FROM_DATE = NULL has to be inserted into this table. The old profile service status (old entry) has to be used during request pending phase. If the change request is processed the attribute VALID_FROM_DATE gets a not null value and then the old value is not more active. Since VALID_FROM_DATE the new entry is active.';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.ENTRY_DATE IS 'Date of insertion of an entry.';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.REQUEST_ID IS 'With this request the value of STATUS is ordered. FK pointing to the GMD_REQUEST_BASE table containing the requested date.';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.REC_VERSION IS 'Record Version
The PR_SERV_STATUS_HIST.REC_VERSION attribute specifies the counter for multi user access. It is used for the optimistic locking method.';

COMMENT ON COLUMN SYSADM.PR_SERV_STATUS_HIST.USER_REASON IS 'Reason for the service status change';


CREATE INDEX SYSADM.I_DBX_PRSERV_STATUS_HIST_COREQ ON SYSADM.PR_SERV_STATUS_HIST
(CO_ID, REQUEST_ID)
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P02_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P03_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P04_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P5_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P06_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P07_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P08_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P09_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P10_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P12_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P13_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P14_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P15_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P17_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P18_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P19_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P20_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P22_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P23_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P24_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P25_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P26_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P27_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P29_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P30_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P31_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P32_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P33_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P34_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P36_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P37_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P38_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P39_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P41_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P43_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P44_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P45_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P46_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P47_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P48_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P50_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P51_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P52_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P53_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P54_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P55_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


CREATE INDEX SYSADM.I_PR_SERV_STAT_HIST_VAL_ST ON SYSADM.PR_SERV_STATUS_HIST
(CO_ID, SNCODE, PROFILE_ID, VALID_FROM_DATE, STATUS)
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P02_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P03_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P04_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P5_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P06_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P07_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P08_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P09_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P10_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P12_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P13_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P14_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P15_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P17_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P18_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P19_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P20_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P22_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P23_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P24_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P25_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P26_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P27_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P29_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P30_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P31_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P32_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P33_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P34_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P36_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P37_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P38_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P39_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P41_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P43_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P44_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P45_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P46_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P47_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P48_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P50_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P51_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P52_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P53_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P54_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P55_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


CREATE UNIQUE INDEX SYSADM.PK_PR_SERV_STATUS_HIST ON SYSADM.PR_SERV_STATUS_HIST
(CO_ID, SNCODE, PROFILE_ID, HISTNO)
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P02_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P03_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P04_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P5_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P06_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P07_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P08_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P09_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P10_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P12_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P13_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P14_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P15_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P17_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P18_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P19_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P20_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P22_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P23_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P24_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P25_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P26_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P27_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P29_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P30_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P31_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P32_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P33_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P34_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P36_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P37_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P38_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P39_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P41_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P43_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P44_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P45_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P46_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P47_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P48_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P50_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P51_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P52_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P53_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P54_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION P55_M_PSS
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE I_BSCS_BIG
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


DROP PUBLIC SYNONYM PR_SERV_STATUS_HIST;

CREATE PUBLIC SYNONYM PR_SERV_STATUS_HIST FOR SYSADM.PR_SERV_STATUS_HIST;


ALTER TABLE SYSADM.PR_SERV_STATUS_HIST ADD (
  CONSTRAINT CHECK_SERV_STATUS_HIST_REASON
 CHECK (
      REASON BETWEEN 0 AND 6
      OR
      REASON = 9 AND STATUS = 'D'
    ),
  CONSTRAINT CHECK_SERV_STATUS_HIST_STATUS
 CHECK (
      STATUS in ('A', 'D', 'S', 'O', 'P')
    ),
  CONSTRAINT PK_PR_SERV_STATUS_HIST
 PRIMARY KEY
 (CO_ID, SNCODE, PROFILE_ID, HISTNO)
 USING INDEX LOCAL);

ALTER TABLE SYSADM.PR_SERV_STATUS_HIST ADD (
  CONSTRAINT FK_PRSERVSTHI_REASONSTAT 
 FOREIGN KEY (USER_REASON) 
 REFERENCES SYSADM.REASONSTATUS_ALL (RS_ID),
  CONSTRAINT FK_PR_SERV_STATUS_HIST_REQUEST 
 FOREIGN KEY (REQUEST_ID) 
 REFERENCES SYSADM.GMD_REQUEST_BASE (REQUEST_ID));

GRANT SELECT ON SYSADM.PR_SERV_STATUS_HIST TO BATCH145;

GRANT SELECT ON SYSADM.PR_SERV_STATUS_HIST TO BATCH214;

GRANT SELECT ON SYSADM.PR_SERV_STATUS_HIST TO BATCH327;

GRANT DELETE, INSERT, SELECT, UPDATE ON SYSADM.PR_SERV_STATUS_HIST TO BSCS_ROLE;

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON SYSADM.PR_SERV_STATUS_HIST TO CMS_INTERFACE;

GRANT SELECT ON SYSADM.PR_SERV_STATUS_HIST TO GEROLE;

GRANT SELECT ON SYSADM.PR_SERV_STATUS_HIST TO INTERFACE;

GRANT INSERT, SELECT, UPDATE ON SYSADM.PR_SERV_STATUS_HIST TO MUTROLE;

GRANT SELECT ON SYSADM.PR_SERV_STATUS_HIST TO SYSADM_RO;

GRANT SELECT ON SYSADM.PR_SERV_STATUS_HIST TO VEHIB;
