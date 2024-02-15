#!/bin/sh

source ./env.sh
printf "${G}--- Installing nodes --- ${N}\n"
rm -rf pemdemo
tpaexec configure pemdemo -a M1 --platform docker --postgresql 15 --enable-repmgr --no-git --enable-pem
cp configyml.backup pemdemo/config.yml
tpaexec provision pemdemo && tpaexec deploy pemdemo

EDBPASSWORD=$(tpaexec show-password pemdemo enterprisedb)
IP=$(hostname -i)

printf "${G}--- Provisioning complete. You can now access PEM on ${R}https://$IP/pem${G} using userid ${R}enterprisedb${G} and password ${R}$EDBPASSWORD${G}.${N}\n"
