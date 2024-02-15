#!/bin/sh

source ./env.sh
printf "--- Installing nodes --- \n"
tpaexec configure pemdemo -a M1 --platform docker --postgresql 15 --enable-repmgr --no-git --enable-pem
cp configyml.backup pemdemo/config.yml
tpaexec provision && tpaexec deploy

EDBPASSWORD=(`tpaexec show-password pemdemo enterprisedb`)
IP=(`hostname -i`)

printf "--- Provisioning complete. You can now access PEM on https://$IP/pem using userid $H enterprisedb $N and password $H $EDBPASSWORD $N .\n"
