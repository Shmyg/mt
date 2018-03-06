alter table sysadm.customer_role move tablespace i_bscs_customer;

set pagesize 0
set termout off
spool run_move_leftovers.sql

SELECT	'alter index sysadm.UKMPULKFXO rebuild partition ' || partition_name || ' tablespace i_bscs_billing;'
FROM	dba_ind_partitions
WHERE	index_name = 'UKMPULKFXO';

spool off

start 	run_move_leftovers.sql
!rm run_move_leftovers.sql
set termout on
