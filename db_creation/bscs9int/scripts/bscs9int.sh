
ORACLE_SID=bscs9int; export ORACLE_SID
echo You should Add this entry in the /var/opt/oracle/oratab: bscs9int:/export/home/product/10.2.0:Y
/export/home/product/10.2.0/bin/sqlplus /nolog @/export/home/admin/bscs9int/scripts/bscs9int.sql
