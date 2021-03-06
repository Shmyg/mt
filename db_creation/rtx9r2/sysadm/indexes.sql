
-- new object type path is: SCHEMA_EXPORT/TABLE/INDEX/INDEX
CREATE INDEX "SYSADM"."I1_BI_ACCOUNTS" ON "SYSADM"."BI_ACCOUNTS" ("BI_BALAN_IDENT_CONTRACT_ID", "BI_BALAN_IDENT_USER_PROFILE_ID", "BI_BALAN_IDENT_SNCODE", "BI_BALAN_IDENT_BUNDL_PROD_ID", "BI_BALAN_IDENT_PURCHASE_SEQ_NO", "BI_BALAN_ATTR_BALAN_SEQUENCE", "BI_BALAN_IDENT_BILL_CYCLE", "BI_BALAN_SNAP_DATE_TIMESTAMP", "UDS_STREAM_ID", "BI_RECORD_ID", "BI_BALANCE_PART_ID", "BI_THRESHOLD_PART_ID") 
  ;

  ALTER INDEX "SYSADM"."I1_BI_ACCOUNTS" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_UDR_ST" ON "SYSADM"."UDR_ST" ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") 
  ;

  ALTER INDEX "SYSADM"."PK_UDR_ST" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."UI_UDR_KEY_HOME_PART" ON "SYSADM"."UDR_KEY_HOME_PART" ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_NUMBER_ADDRESS", "O_P_NUMBER_ADDRESS", "NET_ELEMENT_ADDRESS", "DURATION_VOLUME", "SERVICE_VAS_CODE") 
   LOCAL
 (PARTITION "UDR_KEY_HOME_011109" , 
 PARTITION "UDR_KEY_HOME_021109" , 
 PARTITION "UDR_KEY_HOME_031109" , 
 PARTITION "UDR_KEY_HOME_041109" , 
 PARTITION "UDR_KEY_HOME_051109" , 
 PARTITION "UDR_KEY_HOME_061109" , 
 PARTITION "UDR_KEY_HOME_071109" , 
 PARTITION "UDR_KEY_HOME_081109" , 
 PARTITION "UDR_KEY_HOME_091109" , 
 PARTITION "UDR_KEY_HOME_101109" , 
 PARTITION "UDR_KEY_HOME_111109" , 
 PARTITION "UDR_KEY_HOME_121109" , 
 PARTITION "UDR_KEY_HOME_131109" , 
 PARTITION "UDR_KEY_HOME_141109" , 
 PARTITION "UDR_KEY_HOME_151109" , 
 PARTITION "UDR_KEY_HOME_161109" , 
 PARTITION "UDR_KEY_HOME_171109" , 
 PARTITION "UDR_KEY_HOME_181109" , 
 PARTITION "UDR_KEY_HOME_191109" , 
 PARTITION "UDR_KEY_HOME_201109" , 
 PARTITION "UDR_KEY_HOME_211109" , 
 PARTITION "UDR_KEY_HOME_221109" , 
 PARTITION "UDR_KEY_HOME_231109" , 
 PARTITION "UDR_KEY_HOME_241109" , 
 PARTITION "UDR_KEY_HOME_251109" , 
 PARTITION "UDR_KEY_HOME_261109" , 
 PARTITION "UDR_KEY_HOME_271109" , 
 PARTITION "UDR_KEY_HOME_281109" , 
 PARTITION "UDR_KEY_HOME_291109" , 
 PARTITION "UDR_KEY_HOME_301109" ) ;

  ALTER INDEX "SYSADM"."UI_UDR_KEY_HOME_PART" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_RTX_TAP" ON "SYSADM"."RTX_TAP" ("CUST_INFO_CUSTOMER_ID", "RECORD_ID_TAP_SEQUENCE_NUM", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "CALL_TYPE") 
  ;

  ALTER INDEX "SYSADM"."PK_RTX_TAP" NOPARALLEL;
 
CREATE INDEX "SYSADM"."I1_RTX_TAP" ON "SYSADM"."RTX_TAP" ("RECORD_ID_TAP_RECORD_ID") 
  ;

  ALTER INDEX "SYSADM"."I1_RTX_TAP" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_RTX_PART" ON "SYSADM"."UDR_LT_ARCH" ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "UDS_SPECIAL_PURPOSE_PART_ID", "ENTRY_DATE_TIMESTAMP") 
   LOCAL
 (PARTITION "RTX_PART_LT_NOV09_01" , 
 PARTITION "RTX_PART_LT_NOV09_02" , 
 PARTITION "RTX_PART_LT_NOV09_03" , 
 PARTITION "RTX_PART_LT_NOV09_04" , 
 PARTITION "RTX_PART_LT_NOV09_05" , 
 PARTITION "RTX_PART_LT_NOV09_06" , 
 PARTITION "RTX_PART_LT_NOV09_07" , 
 PARTITION "RTX_PART_LT_NOV09_08" , 
 PARTITION "RTX_PART_LT_NOV09_09" , 
 PARTITION "RTX_PART_LT_NOV09_10" , 
 PARTITION "RTX_PART_LT_NOV09_11" , 
 PARTITION "RTX_PART_LT_NOV09_12" , 
 PARTITION "RTX_PART_LT_NOV09_13" , 
 PARTITION "RTX_PART_LT_NOV09_14" , 
 PARTITION "RTX_PART_LT_NOV09_15" ) ;

  ALTER INDEX "SYSADM"."PK_RTX_PART" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_BCH_LT_APPEND" ON "SYSADM"."BCH_LT_APPEND" ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") 
  ;

  ALTER INDEX "SYSADM"."PK_BCH_LT_APPEND" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_BCH_ST_APPEND" ON "SYSADM"."BCH_ST_APPEND" ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") 
  ;

  ALTER INDEX "SYSADM"."PK_BCH_ST_APPEND" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."U1_RTX_TAP_KEY" ON "SYSADM"."RTX_TAP_KEY" ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_NUMBER_ADDRESS", "RECORD_ID_ORIG_CDR_ID", "O_P_NUMBER_ADDRESS", "NET_ELEMENT_ADDRESS", "DURATION_VOLUME", "SERVICE_VAS_CODE", "S_P_PORT_ADDRESS", "RECORD_ID_TAP_SEQUENCE_NUM", "CONTENT_TRANSACTION_ID", "CONTENT_REFUND_IND", "NET_ELEMENT_ENTITY", "RECORD_ID_CALL_ID", "LCS_QOS_INFO_RESPONSE_TIME") 
  ;

  ALTER INDEX "SYSADM"."U1_RTX_TAP_KEY" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_SBR_PROCESS_CONTR" ON "SYSADM"."SBR_PROCESS_CONTR" ("CONTRACT_ID", "BILLSEQNO", "CUSTOMER_SET_ID", "BCH_PACKAGE_NUM") 
  ;

  ALTER INDEX "SYSADM"."PK_SBR_PROCESS_CONTR" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."U1_UDR_KEY_HOME" ON "SYSADM"."UDR_KEY_HOME" ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_PORT_ADDRESS", "S_P_NUMBER_ADDRESS", "O_P_NUMBER_ADDRESS") 
  ;

  ALTER INDEX "SYSADM"."U1_UDR_KEY_HOME" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."U1_UDR_KEY_UDP" ON "SYSADM"."UDR_KEY_UDP" ("CUST_INFO_ADDRESS", "EVENT_ST_INFO_EXT_REQ_ID") 
  ;

  ALTER INDEX "SYSADM"."U1_UDR_KEY_UDP" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."U1_UDR_KEY_VPLMN" ON "SYSADM"."UDR_KEY_VPLMN" ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_NUMBER_ADDRESS", "O_P_NUMBER_ADDRESS", "NET_ELEMENT_ADDRESS", "DURATION_VOLUME", "SERVICE_VAS_CODE", "CONTENT_TRANSACTION_ID", "CONTENT_REFUND_IND", "NET_ELEMENT_ENTITY", "RECORD_ID_CALL_ID") 
  ;

  ALTER INDEX "SYSADM"."U1_UDR_KEY_VPLMN" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_UDR_PROCESS_CUST" ON "SYSADM"."UDR_PROCESS_CUST" ("CUSTOMER_ID", "BILLSEQNO", "CUSTOMER_SET_ID", "BCH_PACKAGE_NUM") 
  ;

  ALTER INDEX "SYSADM"."PK_UDR_PROCESS_CUST" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_UDR_SUM_BCH_LT_APPEND" ON "SYSADM"."UDR_SUM_BCH_LT_APPEND" ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") 
  ;

  ALTER INDEX "SYSADM"."PK_UDR_SUM_BCH_LT_APPEND" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."PK_UDR_SUM_BCH_ST_APPEND" ON "SYSADM"."UDR_SUM_BCH_ST_APPEND" ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") 
  ;

  ALTER INDEX "SYSADM"."PK_UDR_SUM_BCH_ST_APPEND" NOPARALLEL;
 
CREATE UNIQUE INDEX "SYSADM"."UI_UDR_KEY_VPLMN" ON "SYSADM"."UDR_KEY_VPLMN_NOT_PART" ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_NUMBER_ADDRESS", "O_P_NUMBER_ADDRESS", "NET_ELEMENT_ADDRESS", "DURATION_VOLUME", "SERVICE_VAS_CODE") 
  ;

  ALTER INDEX "SYSADM"."UI_UDR_KEY_VPLMN" NOPARALLEL;
 
-- new object type path is: SCHEMA_EXPORT/TABLE/CONSTRAINT/CONSTRAINT
-- CONNECT SHMYG
ALTER TABLE "SYSADM"."UDR_ST" ADD CONSTRAINT "PK_UDR_ST" PRIMARY KEY ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") ENABLE;
 
ALTER TABLE "SYSADM"."RTX_TAP" ADD CONSTRAINT "PK_RTX_TAP" PRIMARY KEY ("CUST_INFO_CUSTOMER_ID", "RECORD_ID_TAP_SEQUENCE_NUM", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "CALL_TYPE") ENABLE;
 
ALTER TABLE "SYSADM"."BCH_LT_APPEND" ADD CONSTRAINT "PK_BCH_LT_APPEND" PRIMARY KEY ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") ENABLE;
 
ALTER TABLE "SYSADM"."BCH_ST_APPEND" ADD CONSTRAINT "PK_BCH_ST_APPEND" PRIMARY KEY ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") ENABLE;
 
ALTER TABLE "SYSADM"."RTX_TAP_KEY" ADD CONSTRAINT "U1_RTX_TAP_KEY" UNIQUE ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_NUMBER_ADDRESS", "RECORD_ID_ORIG_CDR_ID", "O_P_NUMBER_ADDRESS", "NET_ELEMENT_ADDRESS", "DURATION_VOLUME", "SERVICE_VAS_CODE", "S_P_PORT_ADDRESS", "RECORD_ID_TAP_SEQUENCE_NUM", "CONTENT_TRANSACTION_ID", "CONTENT_REFUND_IND", "NET_ELEMENT_ENTITY", "RECORD_ID_CALL_ID", "LCS_QOS_INFO_RESPONSE_TIME") ENABLE;
 
ALTER TABLE "SYSADM"."SBR_PROCESS_CONTR" ADD CONSTRAINT "PK_SBR_PROCESS_CONTR" PRIMARY KEY ("CONTRACT_ID", "BILLSEQNO", "CUSTOMER_SET_ID", "BCH_PACKAGE_NUM") ENABLE;
 
ALTER TABLE "SYSADM"."UDR_KEY_HOME" ADD CONSTRAINT "U1_UDR_KEY_HOME" UNIQUE ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_PORT_ADDRESS", "S_P_NUMBER_ADDRESS", "O_P_NUMBER_ADDRESS") ENABLE;
 
ALTER TABLE "SYSADM"."UDR_KEY_UDP" ADD CONSTRAINT "U1_UDR_KEY_UDP" UNIQUE ("CUST_INFO_ADDRESS", "EVENT_ST_INFO_EXT_REQ_ID") ENABLE;
 
ALTER TABLE "SYSADM"."UDR_KEY_VPLMN" ADD CONSTRAINT "U1_UDR_KEY_VPLMN" UNIQUE ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_NUMBER_ADDRESS", "O_P_NUMBER_ADDRESS", "NET_ELEMENT_ADDRESS", "DURATION_VOLUME", "SERVICE_VAS_CODE", "CONTENT_TRANSACTION_ID", "CONTENT_REFUND_IND", "NET_ELEMENT_ENTITY", "RECORD_ID_CALL_ID") ENABLE;
 
ALTER TABLE "SYSADM"."UDR_PROCESS_CUST" ADD CONSTRAINT "PK_UDR_PROCESS_CUST" PRIMARY KEY ("CUSTOMER_ID", "BILLSEQNO", "CUSTOMER_SET_ID", "BCH_PACKAGE_NUM") ENABLE;
 
ALTER TABLE "SYSADM"."UDR_SUM_BCH_LT_APPEND" ADD CONSTRAINT "PK_UDR_SUM_BCH_LT_APPEND" PRIMARY KEY ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") ENABLE;
 
ALTER TABLE "SYSADM"."UDR_SUM_BCH_ST_APPEND" ADD CONSTRAINT "PK_UDR_SUM_BCH_ST_APPEND" PRIMARY KEY ("CUST_INFO_CUSTOMER_ID", "CUST_INFO_CONTRACT_ID", "CUST_INFO_BILL_CYCLE", "UDS_STREAM_ID", "UDS_RECORD_ID", "UDS_BASE_PART_ID", "UDS_CHARGE_PART_ID", "UDS_FREE_UNIT_PART_ID", "ENTRY_DATE_TIMESTAMP") ENABLE;
 
ALTER TABLE "SYSADM"."UDR_KEY_VPLMN_NOT_PART" ADD CONSTRAINT "UI_UDR_KEY_VPLMN" UNIQUE ("INITIAL_START_TIME_TIMESTAMP", "SERVICE_LOGIC_CODE", "CALL_TYPE", "S_P_NUMBER_ADDRESS", "O_P_NUMBER_ADDRESS", "NET_ELEMENT_ADDRESS", "DURATION_VOLUME", "SERVICE_VAS_CODE") ENABLE;
 
