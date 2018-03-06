/*
|| Used to compress biggest non-frequently changed tables
||
|| $Log: compress_tables.sql,v $
|| Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
|| All Maroc Telecom project files after reorganization
||
|| Revision 1.2  2010-10-21 14:11:30  shmyg
|| Fixed sequences script
||
|| Revision 1.1  2010-10-20 22:36:57  shmyg
|| *** empty log message ***
||
|| Revision 1.1  2010-10-18 13:50:19  shmyg
|| Added PR* partitioning scripts
||
*/

ALTER	TABLE sysadm.parameter_value COMPRESS;
ALTER	TABLE sysadm.gmd_request_base COMPRESS;
ALTER	TABLE sysadm.ordertrailer COMPRESS;
ALTER	TABLE sysadm.ordertrailer_tax_items COMPRESS;
ALTER	TABLE sysadm.glentry_all COMPRESS;
ALTER	TABLE sysadm.tickler_records COMPRESS;
ALTER	TABLE sysadm.mpulkfxo COMPRESS;
