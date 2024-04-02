#!/bin/sh

. ./env.sh
printf "${G}--- Installing nodes --- ${N}\n"
rm -rf pemdemo
tpaexec configure pemdemo -a M1 --platform docker --postgresql 15 --enable-patroni --no-git --enable-pem --enable-pg-backup-api
cp configyml.backup pemdemo/config.yml
tpaexec provision pemdemo && tpaexec deploy pemdemo

EDBPASSWORD=$(tpaexec show-password pemdemo enterprisedb)
DBAPASSWORD=$(tpaexec show-password pemdemo dba)

#IP=$(hostname -i)
IP=localhost
printf "${G}--- Initializing pgbench on ${R}pg1${G} --- ${N}\n"
PGPASSWORD=$EDBPASSWORD pgbench -h $IP -p 5444 -i -U enterprisedb postgres
printf "${G}--- Provisioning complete. You can now access PEM on ${R}https://$IP/pem${G} using userid ${R}enterprisedb${G} and password ${R}$EDBPASSWORD\n"
printf "${G}--- There is also a user ${R}dba${G} with password ${R}$DBAPASSWORD\n"

