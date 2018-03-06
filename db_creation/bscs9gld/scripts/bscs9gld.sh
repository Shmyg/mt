
ORACLE_SID=bscs9gld; export ORACLE_SID
echo You should Add this entry in the /var/opt/oracle/oratab: bscs9gld:/export/home/product/10.2.0:Y
/export/home/product/10.2.0/bin/sqlplus /nolog @/export/home/admin/bscs9gld/scripts/bscs9gld.sql
