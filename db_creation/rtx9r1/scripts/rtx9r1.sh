# The file is used to start DB creation
# $Log: rtx9r1.sh,v $
# Revision 1.1.1.1  2011/02/15 15:30:28  shmyg
# All Maroc Telecom project files after reorganization
#
# Revision 1.2  2010-04-29 07:52:12  shmyg
# Changed DB name in all the files
#
# Revision 1.1  2010-04-28 12:56:40  shmyg
# *** empty log message ***
#

mkdir -p /ora/rtxadmin03/RTX9R1/admin/adump
mkdir -p /ora/rtxadmin03/RTX9R1/admin/bdump
mkdir -p /ora/rtxadmin03/RTX9R1/admin/cdump
mkdir -p /ora/rtxadmin03/RTX9R1/admin/udump
ORACLE_SID=RTX9R1; export ORACLE_SID
echo You should Add this entry in the /var/opt/oracle/oratab: RTX9R1:/export/home/product/10.2.0:Y
/export/home/product/10.2.0/bin/sqlplus /nolog @/export/home/admin/RTX9R1/scripts/RTX9R1.sql
