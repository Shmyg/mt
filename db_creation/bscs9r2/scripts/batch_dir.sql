/*
The script is used to create an Oracle directory for batches
MOVIX project

$Log: batch_dir.sql,v $
Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
All Maroc Telecom project files after reorganization

Revision 1.1  2010-05-18 18:09:11  shmyg
Added directory creation script

*/
CREATE OR REPLACE DIRECTORY BATCHS_LOG_DIR
AS	'/ora/bscsdata12/BSCS9MIG/BATCHS_LOG_DIR/'
/


GRANT READ, WRITE ON DIRECTORY BATCHS_LOG_DIR TO INTERFACE;
GRANT READ, WRITE ON DIRECTORY BATCHS_LOG_DIR TO SYSADM;
