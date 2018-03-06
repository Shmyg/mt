mkdir -p /ora/bscsdata20/BSCS9R1/admin/adump
mkdir -p /ora/bscsdata20/BSCS9R1/admin/bdump
mkdir -p /ora/bscsdata20/BSCS9R1/admin/cdump
mkdir -p /ora/bscsdata20/BSCS9R1/admin/udump
mkdir -p /ora/bscsdata20/BSCS9R1/oradata
ORACLE_SID=bscs9r2; export ORACLE_SID
/export/home/product/10.2.0/bin/sqlplus /nolog @/export/home/admin/bscs9r2/bscs9r2.sql
