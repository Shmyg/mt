select distinct 'alter table sysadm.' || table_name || ' parallel;' from dba_constraints where owner = 'SYSADM' and table_name in (select
table_name from dba_tables where owner = 'SYSADM' and tablespace_name not in ('D_BSCS_SMALL', 'D_BSCS_TINY')) and validated = 'NOT
VALIDATED';
