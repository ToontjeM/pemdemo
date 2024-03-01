#!/bin/sh

. ./env.sh
printf "${G}--- Deleting nodes --- ${N}\n"
tpaexec deprovision pemdemo
rm -rf pemdemo
printf "${G}--- De-provisioning complete ---${N}\n"
