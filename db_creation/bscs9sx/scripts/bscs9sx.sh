
ORACLE_SID=bscs9sx; export ORACLE_SID
echo You should Add this entry in the /var/opt/oracle/oratab: bscs9sx:/export/home/product/10.2.0:Y
/export/home/product/10.2.0/bin/sqlplus /nolog @/export/home/admin/bscs9sx/scripts/bscs9sx.sql
