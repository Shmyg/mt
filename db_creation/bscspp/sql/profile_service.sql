/*
|| Recreation of PROFILE_SERVICE as a partitioned table
||
|| $Log: profile_service.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.1  2010-10-18 13:50:19  shmyg
|| Added PR* partitioning scripts
||
*/

ALTER TABLE SYSADM.PROFILE_SERVICE
 DROP PRIMARY KEY CASCADE;

DROP TABLE SYSADM.PROFILE_SERVICE CASCADE CONSTRAINTS;

CREATE TABLE SYSADM.PROFILE_SERVICE
(
  PROFILE_ID      INTEGER                       NOT NULL,
  CO_ID           INTEGER                       NOT NULL,
  SNCODE          INTEGER                       NOT NULL,
  SPCODE_HISTNO   INTEGER                       NOT NULL,
  STATUS_HISTNO   INTEGER                       NOT NULL,
  ENTRY_DATE      DATE                          DEFAULT SYSDATE               NOT NULL,
  CHANNEL_NUM     INTEGER,
  OVW_ACC_FIRST   VARCHAR2(1 BYTE),
  DATE_BILLED     DATE,
  SN_CLASS        INTEGER,
  OVW_SUBSCR      VARCHAR2(1 BYTE),
  SUBSCRIPT       FLOAT(126),
  OVW_ACCESS      VARCHAR2(1 BYTE),
  OVW_ACC_PRD     INTEGER                       NOT NULL,
  ACCESSFEE       FLOAT(126),
  CHANNEL_EXCL    VARCHAR2(1 BYTE),
  DIS_SUBSCR      FLOAT(126),
  INSTALL_DATE    DATE,
  TRIAL_END_DATE  DATE,
  PRM_VALUE_ID    INTEGER,
  CURRENCY        INTEGER,
  SRV_TYPE        VARCHAR2(1 BYTE),
  SRV_SUBTYPE     VARCHAR2(1 BYTE),
  OVW_ADV_CHARGE  VARCHAR2(1 BYTE)              NOT NULL,
  ADV_CHARGE      FLOAT(126)                    DEFAULT NULL,
  ADV_CHARGE_PRD  INTEGER                       NOT NULL,
  DELETE_FLAG     VARCHAR2(1 BYTE),
  REC_VERSION     INTEGER                       DEFAULT 0                     NOT NULL,
  ATTRIB_HISTNO   INTEGER
)
TABLESPACE D_BSCS_BIG
LOGGING
PARTITION BY RANGE (CO_ID)
(  
  PARTITION P01_M_PS VALUES LESS THAN (1000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P02_M_PS VALUES LESS THAN (2000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P03_M_PS VALUES LESS THAN (3000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P04_M_PS VALUES LESS THAN (4000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P05_M_PS VALUES LESS THAN (5000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P06_M_PS VALUES LESS THAN (6000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P07_M_PS VALUES LESS THAN (7000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P08_M_PS VALUES LESS THAN (8000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P09_M_PS VALUES LESS THAN (9000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P10_M_PS VALUES LESS THAN (10000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P11_M_PS VALUES LESS THAN (11000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P12_M_PS VALUES LESS THAN (12000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P13_M_PS VALUES LESS THAN (13000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P14_M_PS VALUES LESS THAN (14000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P15_M_PS VALUES LESS THAN (15000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P16_M_PS VALUES LESS THAN (16000001)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P17_M_PS VALUES LESS THAN (17000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P18_M_PS VALUES LESS THAN (18000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P19_M_PS VALUES LESS THAN (19000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P20_M_PS VALUES LESS THAN (20000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P21_M_PS VALUES LESS THAN (21000001)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P22_M_PS VALUES LESS THAN (22000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P23_M_PS VALUES LESS THAN (23000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P24_M_PS VALUES LESS THAN (24000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P25_M_PS VALUES LESS THAN (25000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P26_M_PS VALUES LESS THAN (26000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P27_M_PS VALUES LESS THAN (27000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P28_M_PS VALUES LESS THAN (28000001)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P29_M_PS VALUES LESS THAN (29000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P30_M_PS VALUES LESS THAN (30000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P31_M_PS VALUES LESS THAN (31000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P32_M_PS VALUES LESS THAN (32000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P33_M_PS VALUES LESS THAN (33000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P34_M_PS VALUES LESS THAN (34000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P35_M_PS VALUES LESS THAN (35000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P36_M_PS VALUES LESS THAN (36000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P37_M_PS VALUES LESS THAN (37000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P38_M_PS VALUES LESS THAN (38000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P39_M_PS VALUES LESS THAN (39000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P40_M_PS VALUES LESS THAN (40000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P41_M_PS VALUES LESS THAN (41000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P42_M_PS VALUES LESS THAN (42000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P43_M_PS VALUES LESS THAN (43000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P44_M_PS VALUES LESS THAN (44000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P45_M_PS VALUES LESS THAN (45000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P46_M_PS VALUES LESS THAN (46000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P47_M_PS VALUES LESS THAN (47000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P48_M_PS VALUES LESS THAN (48000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P49_M_PS VALUES LESS THAN (49000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P50_M_PS VALUES LESS THAN (50000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P51_M_PS VALUES LESS THAN (51000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P52_M_PS VALUES LESS THAN (52000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P53_M_PS VALUES LESS THAN (53000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P54_M_PS VALUES LESS THAN (54000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P55_M_PS VALUES LESS THAN (55000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P56_M_PS VALUES LESS THAN (56000000)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
,
  PARTITION P57_M_PS VALUES LESS THAN (MAXVALUE)
    LOGGING
    COMPRESS
    TABLESPACE D_BSCS_BIG
)
COMPRESS 
NOCACHE
PARALLEL
MONITORING;

COMMENT ON TABLE SYSADM.PROFILE_SERVICE IS 'ERMES market is not supported anymore.
This table contains actual values of all attributes within a profile (s. PROFILE table for further information).
For some service attributes the history is stored and for some not. The values of attributes having a history are saved in the history tables and the numbers of actual histories are saved in this table.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.PROFILE_ID IS 'Profile identifier, FK pointing to the PROFILE table';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.CO_ID IS 'Contract identifier pointing with service identifier to the CONTRACT_SERVICE table';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.SNCODE IS 'Service identifier pointing with contract identifier to the CONTRACT_SERVICE table';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.SPCODE_HISTNO IS 'Valid history number entry in the PR_SERV_SPCODE_HIST saving actual service package.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.STATUS_HISTNO IS 'Valid history number entry in the PR_SERV_STATUS_HIST saving actual status of a profile service.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.ENTRY_DATE IS 'Date of the insertion of this record into this table (sysdate). The information is used for the tax calculation.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.CHANNEL_NUM IS 'Associated channel (subaddress) for services.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.OVW_ACC_FIRST IS 'X = indicates that overwriting of recurring charge (formerly: access charge/fee) for this service within the profile has never been processed by BCH.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.DATE_BILLED IS 'Date when the service has been billed the last time.
NULL if the service has not been billed yet. Date of last bill cycle run. A bill cycle runs per contract or per group of contracts (Several customers can be involved in the billing process.). We save this information per service, because for new services that are assigned to the contract after several bill runs it is not possible to control when the last bill cycle has been run.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.SN_CLASS IS 'Service code of the service, which is the representative for the equivalence class.
No history is needed, because this entry is never updated.
';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.OVW_SUBSCR IS 'One-time charge amount (formerly: subscription charge/fee amount) can be overwritten.
A = the one-time charge is an amount,
R = the one-time charge is a percentage of the rate plan price, see MPULKTMB table: attribute SUBSCRIPT
NULL means that the rate plan price has to be used. This value can be changed.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.SUBSCRIPT IS 'One-time charge (formerly: subscription charge/fee).';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.OVW_ACCESS IS 'Recurring charge amount (formerly: access charge/fee amount) can be overwritten.
A = the recurring charge is an amount, R = the recurring charge is a percentage of the rate plan price, see MPULKTMB table, attribute ACCESSFEE. NULL means that the recurring charge value has to be taken from MPULKTMB.ACCESSFEE.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.OVW_ACC_PRD IS 'The number of times of the overwritten amount (value of the ACCESSFEE attribute) has to be applied by BCH.
Domain:
>1 : the overwritten charge has to be used and the value is reduced by 1
-1 : the overwritten charge has to be used and the value is not changed
1  : the overwritten charge has to be used and the value is set to -2
-2 : the charge from the tariff model is used and the value is set to 0
0  : the overwritten charge has not to be considered by BCH any more but
the value from the tariff model has to be used by BCH';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.ACCESSFEE IS 'Recurring charge amount (formerly: access charge/fee amount) if overwrite flag is set. For more information see descriptions of the OVW_ACCESS and OVW_ACC_PRD attributes.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.CHANNEL_EXCL IS 'Indicates whether the channel used for this service has to be used exclusive or not.
Allowed values: "X" = exclusive, otherwise null (none exclusive). The channel assigned to this service can be assigned to other services. The attribute cannot be manually updated. See also description of the CHANNEL_NUM attribute.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.DIS_SUBSCR IS 'Amount discounted on the one-time charge (formerly: subscription fee ) (depending on the number of contracts).
Null means no discount is given.
It is a discount that is used per service, if the number of contracts is greater than a defined threshold value. The service discount grows with each new contract. It is a function of the number of contracts. This function delivers with each new contract a new value for its service discount.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.INSTALL_DATE IS 'Date of service installation by subscriber at home, e.g. ISDN installation. Some markets use this information. The saving of history is not required, because an information will be delivered from an external system. It is typical provisioning situation.
The same service in different profiles can be considered as different services. The subscriber could use two profiles simultaneously with the same services.  Therefore some installations can be profile dependent.
Remark: GSM services do not need any installation.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.TRIAL_END_DATE IS 'The last day the profile service will be `on trail`. It deals with time limited contract services. For example a customer wants to test some provider services. In this case he makes a trial contract with provider. NULL means the saved profile service is not on trial. The saved information depends on a service. It can be a non-trial contract with trial services.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.PRM_VALUE_ID IS 'Service parameter value identifier. Points to a set of parameter values. FK: PARAMETER_VALUE_BASE. PRM_VALUE_ID. It is possible to assign to a bscs-service a list of parameters with their values. The PARAMETER_VALUE_BASE table contains those lists. The PARAMETER_VALUE table, containing linked parameters and their values, reference the PARAMETER_VALUE_BASE table. NULL-value means, that for the service within a profile no set of parameter values is required.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.CURRENCY IS 'Currency. FK: FORCURR. In this currency all amounts of money are calculated and saved in this table. This column was introduced with the Euro feature 52818. It contains the rateplan currency to the assignment time. The attribute is needed, because the entry is not changed if the currency in the rateplan is changed. The same service can have different currency information in different profiles (p.4, ch.2.1)';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.SRV_TYPE IS 'Service type (flag for BCH to avoid large joins): V=service is VAS (network VAS) (used for selling goods), NULL=all other services.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.SRV_SUBTYPE IS 'Defines the Service subtype, which is needed in Free Units:
C: COFU (contract individual Free Units)
P: POFU (pooled Free Units at subscriber level)
L: POFUL (pooled Free Units at payment responsible level)
T: Billed Line Taxation
B: BOP Service
A: Agreement Service
NULL: all other Services';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.OVW_ADV_CHARGE IS 'This flag determines the algorithm how the recurring charge (formerly: access charge/fee) is calculated if the recurring charge is billed in advance.
Domain: N = no changes relative to MPULKTMB.ACCESSFEE value have to be made
A = ADV_CHARGE is an amount
R = ADV_CHARGE is a percentage of the rate plan price, see MPULKTMB table, attribute ACCESSFEE.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.ADV_CHARGE IS 'Advance recurring charge (formerly: advance access charge/fee).
See description of the OVW_ADV_CHARGE attribute.
Note: If the value is NULL than it has not to be considered by BCH and can be ignored';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.ADV_CHARGE_PRD IS 'How often the ADV_CHARGE amount, saved in this table, has to be applied by BCH, value -1 means unlimited.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.DELETE_FLAG IS 'Value `D` means that the entry is marked as deactivated, but used until the end of cdrmaxage.  Value `X` means that the entry is marked for deletion.  Otherwise the entry is null.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.REC_VERSION IS 'Record Version
The PROFILE_SERVICE.REC_VERSION attribute specifies the counter for multi user access. It is used for the optimistic locking method.';

COMMENT ON COLUMN SYSADM.PROFILE_SERVICE.ATTRIB_HISTNO IS 'History entry ID of Contracted service attribute value.';


CREATE INDEX SYSADM.IDX_PROF_SERV_PRM_VALUE_ID ON SYSADM.PROFILE_SERVICE
(PRM_VALUE_ID)
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P02_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P3_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P4_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P5_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P06_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P07_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P08_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P09_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P10_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P11_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P12_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P13_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P14_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P15_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P16_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P17_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P18_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P19_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P20_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P22_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P23_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P24_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P25_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P26_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P27_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P29_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P30_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P31_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P32_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P33_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P34_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P36_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P37_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P38_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P39_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P41_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P43_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P44_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P45_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P46_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P47_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P48_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P50_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P51_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P52_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P53_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P54_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P55_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


CREATE INDEX SYSADM.IX_PROFILESRV_TRIALENDDATE ON SYSADM.PROFILE_SERVICE
(TRIAL_END_DATE)
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P02_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P3_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P4_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P5_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P06_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P07_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P08_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P09_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P10_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P11_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P12_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P13_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P14_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P15_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P16_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P17_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P18_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P19_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P20_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P22_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P23_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P24_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P25_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P26_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P27_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P29_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P30_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P31_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P32_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P33_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P34_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P36_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P37_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P38_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P39_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P41_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P43_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P44_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P45_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P46_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P47_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P48_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P50_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P51_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P52_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P53_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P54_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P55_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


CREATE INDEX SYSADM.I_PROSERV_COID_SN_PRMVID_PID ON SYSADM.PROFILE_SERVICE
(CO_ID, SNCODE, PRM_VALUE_ID, PROFILE_ID)
  TABLESPACE i_bscs_contract
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P02_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P3_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P4_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P5_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P06_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P07_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P08_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P09_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P10_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P11_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P12_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P13_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P14_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P15_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P16_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P17_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P18_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P19_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P20_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P22_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P23_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P24_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P25_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P26_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P27_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P29_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P30_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P31_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P32_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P33_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P34_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P36_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P37_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P38_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P39_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P41_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P43_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P44_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P45_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P46_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P47_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P48_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P50_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P51_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P52_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P53_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P54_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P55_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


CREATE INDEX SYSADM.I_PR_SERV_SRV_SUBTYPE ON SYSADM.PROFILE_SERVICE
(CO_ID, SNCODE, PROFILE_ID, SRV_SUBTYPE)
  TABLESPACE i_bscs_contract
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P02_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P3_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P4_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P5_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P06_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P07_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P08_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P09_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P10_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P11_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P12_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P13_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P14_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P15_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P16_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P17_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P18_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P19_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P20_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P22_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P23_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P24_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P25_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P26_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P27_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P29_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P30_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P31_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P32_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P33_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P34_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P36_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P37_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P38_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P39_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P41_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P43_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P44_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P45_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P46_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P47_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P48_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P50_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P51_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P52_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P53_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P54_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P55_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


CREATE UNIQUE INDEX SYSADM.PK_PROFILE_SERVICE ON SYSADM.PROFILE_SERVICE
(CO_ID, SNCODE, PROFILE_ID)
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P02_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P3_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P4_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P5_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P06_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P07_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P08_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P09_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P10_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P11_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P12_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P13_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P14_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P15_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P16_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P17_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P18_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P19_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P20_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P22_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P23_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P24_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P25_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P26_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P27_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P29_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P30_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P31_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P32_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P33_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P34_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P36_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P37_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P38_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P39_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P41_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P43_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P44_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P45_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P46_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P47_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P48_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P50_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P51_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P52_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P53_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P54_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P55_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


CREATE INDEX SYSADM.PROFILE_SERVICE_DELETE_FLAG ON SYSADM.PROFILE_SERVICE
(DELETE_FLAG)
NOLOGGING
COMPRESS
LOCAL (  
  PARTITION P01_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P02_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P3_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P4_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P5_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P06_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P07_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P08_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P09_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P10_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P11_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P12_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P13_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P14_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P15_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P16_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P17_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P18_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P19_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P20_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P22_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P23_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P24_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P25_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P26_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P27_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P29_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P30_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P31_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P32_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P33_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P34_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P36_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P37_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P38_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P39_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P41_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P43_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P44_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P45_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P46_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P47_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P48_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P50_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P51_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P52_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P53_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P54_M_PSSP
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION P55_M_PS
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
,
  PARTITION
    NOLOGGING
    COMPRESS
    TABLESPACE i_bscs_contract
)
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT );


CREATE OR REPLACE TRIGGER SYSADM."CHECK_PROFILE_IN_PR_SERVICE" 
 BEFORE INSERT OR UPDATE OF PROFILE_ID ON SYSADM.PROFILE_SERVICE FOR EACH ROW
DECLARE
    lonCoId INTEGER;
BEGIN
     IF UPDATING
     THEN
             lonCoId := :OLD.CO_ID;
     ELSE
             lonCoId := :NEW.CO_ID;
     END IF;
     FOR xcr IN (SELECT PROFILE_ID FROM NET_PROFILE WHERE
                              PLCODE = (SELECT PLCODE FROM CONTRACT_ALL WHERE CO_ID = lonCoID) AND
                             PROFILE_ID = :NEW.PROFILE_ID) LOOP
             RETURN;
     END LOOP;
     RAISE_APPLICATION_ERROR(-20001, 'Cannot find user profile ' || :NEW.PROFILE_ID ||
            ' among profiles reserved for the network related to the contract ' || lonCoID);
END CHECK_PROFILE_IN_PR_SERVICE;
/


DROP PUBLIC SYNONYM PROFILE_SERVICE;

CREATE PUBLIC SYNONYM PROFILE_SERVICE FOR SYSADM.PROFILE_SERVICE;


ALTER TABLE SYSADM.PROFILE_SERVICE ADD (
  CONSTRAINT CC_PROFILESERV_SRVTYPE
 CHECK (
      SRV_TYPE = 'V'
    ),
  CONSTRAINT CC_PROFILE_SERVICE_SS
 CHECK (
      SRV_SUBTYPE IN ('C', 'P', 'L', 'T', 'B', 'A')
    ),
  CONSTRAINT CHECK_ADV_CHARGE_ATTRIBUTES
 CHECK (
      OVW_ADV_CHARGE='N'
      AND
      ADV_CHARGE=0.0
      AND
      ADV_CHARGE_PRD=0
      OR
      OVW_ADV_CHARGE in ('A','R')
    ),
  CONSTRAINT CHECK_CHANNEL_EXCL
 CHECK (
      CHANNEL_NUM IS NULL
      AND
      CHANNEL_EXCL IS NULL
      OR
      CHANNEL_NUM IS NOT NULL
    ),
  CONSTRAINT CHECK_OVW_ACCESS
 CHECK (
      OVW_ACCESS IS NULL
      AND
      OVW_ACC_PRD =0
      AND
      ACCESSFEE IS NULL
      OR
      OVW_ACCESS IN ('A', 'R')
      AND
      ACCESSFEE > =0
    ),
  CONSTRAINT CHECK_OVW_SUBSCR
 CHECK (
      OVW_SUBSCR IS NULL
      AND
      SUBSCRIPT IS NULL
      OR
      OVW_SUBSCR IN ('A', 'R')
      AND
      SUBSCRIPT > =0
    ),
  CONSTRAINT PK_PROFILE_SERVICE
 PRIMARY KEY
 (CO_ID, SNCODE, PROFILE_ID)
 USING INDEX LOCAL);

ALTER TABLE SYSADM.PROFILE_SERVICE ADD (
  CONSTRAINT FK_PROFILE_SERVICE_CONTR_SERV 
 FOREIGN KEY (CO_ID, SNCODE) 
 REFERENCES SYSADM.CONTRACT_SERVICE (CO_ID,SNCODE),
  CONSTRAINT FK_PROFILE_SERVICE_FORCURR 
 FOREIGN KEY (CURRENCY) 
 REFERENCES SYSADM.FORCURR (FC_ID),
  CONSTRAINT FK_PROFILE_SERVICE_PRM_VALUE 
 FOREIGN KEY (PRM_VALUE_ID) 
 REFERENCES SYSADM.PARAMETER_VALUE_BASE (PRM_VALUE_ID),
  CONSTRAINT FK_PROFILE_SERVICE_PROFILE 
 FOREIGN KEY (PROFILE_ID) 
 REFERENCES SYSADM.PROFILE (PROFILE_ID));

GRANT SELECT ON SYSADM.PROFILE_SERVICE TO BATCH142;

GRANT SELECT ON SYSADM.PROFILE_SERVICE TO BATCH214;

GRANT SELECT ON SYSADM.PROFILE_SERVICE TO BATCH327;

GRANT DELETE, INSERT, SELECT, UPDATE ON SYSADM.PROFILE_SERVICE TO BSCS_ROLE;

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON SYSADM.PROFILE_SERVICE TO CMS_INTERFACE;

GRANT SELECT ON SYSADM.PROFILE_SERVICE TO INTERFACE;

GRANT INSERT, SELECT, UPDATE ON SYSADM.PROFILE_SERVICE TO MUTROLE;

GRANT SELECT ON SYSADM.PROFILE_SERVICE TO SYSADM_RO;

GRANT SELECT ON SYSADM.PROFILE_SERVICE TO VEHIB;
