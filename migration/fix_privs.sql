revoke create session from fiabiliret;
revoke create session from simscp;
drop index pos.INVOICE_LINE_IL_CREDINV;
drop index interface.SEMA_VE_PROFILE_PRIVILEGE;

revoke create session from vehib;
revoke create session from dthib;
revoke create session from fiabiliret;
revoke create session from gppmhib;
revoke create session from simscp;

revoke unlimited tablespace from GPPM;
revoke unlimited tablespace from SR;
revoke unlimited tablespace from GE;
revoke unlimited tablespace from BATCH068;
revoke unlimited tablespace from POS;
revoke unlimited tablespace from INTERFACE;
revoke unlimited tablespace from DT;
revoke unlimited tablespace from INTR;
revoke unlimited tablespace from BATCH067;
revoke unlimited tablespace from BATCH073;

alter user INTERFACE quota 5G on I_INTERFACE;
alter user POS quota 24G on D_PREPAID;
alter user DT quota 8M on D_INTERFACE;
alter user SR quota 2G on D_INTERFACE;
alter user GE quota 12G on I_INTERFACE;
alter user POS quota 48G on I_PREPAID;
alter user SR quota 2G on I_INTERFACE;
alter user DT quota 4M on I_INTERFACE;
alter user INTR quota 1M on D_INTERFACE;
alter user INTERFACE quota 16G on D_INTERFACE;
alter user GPPM quota 1M on D_INTERFACE;
alter user GE quota 3G on D_INTERFACE;
alter user GPPM quota 1M on I_INTERFACE;

/*
REVOKE dba FROM sysadm;
REVOKE connect FROM sysadm;
GRANT CREATE SESSION TO sysadm;
GRANT ALTER USER TO sysadm;
GRANT SELECT ON dba_audit_session TO sysadm;
*/

alter user sysadm quota 8G on D_BSCS_TINY;
alter user sysadm quota 4G on D_BSCS_SMALL;
alter user sysadm quota 48G on D_BSCS_BILLING;
alter user sysadm quota 80G on D_BSCS_CONTRACT;
alter user sysadm quota 48G on D_BSCS_CUSTOMER;
alter user sysadm quota 160G on D_BSCS_BIG;
alter user sysadm quota 2G on I_BSCS_TINY;
alter user sysadm quota 4G on I_BSCS_SMALL;
alter user sysadm quota 48G on I_BSCS_BILLING;
alter user sysadm quota 192G on I_BSCS_CONTRACT;
alter user sysadm quota 56G on I_BSCS_CUSTOMER;
alter user sysadm quota 112G on I_BSCS_BIG;
alter user sysadm quota 48G on D_INTERFACE;
alter user sysadm quota 24G on D_PREPAID;
alter user sysadm quota 40G on I_INTERFACE;
alter user sysadm quota 32G on I_PREPAID;
