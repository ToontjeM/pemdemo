#!/bin/sh

. ./env.sh
printf "${G}--- Installing nodes --- ${N}\n"
rm -rf pemdemo
tpaexec configure pemdemo -a M1 --platform docker --postgresql 15 --enable-patroni --no-git --enable-pem --enable-pg-backup-api
cp configyml.backup pemdemo/config.yml
tpaexec provision pemdemo && tpaexec deploy pemdemo

docker exec pg1 sh -c 'echo "shared_preload_libraries = '\''\$libdir/dbms_pipe, \$libdir/edb_gen, \$libdir/dbms_aq, edb_wait_states, sql-profiler, index_advisor'\''" >> /opt/postgres/data/conf.d/9999-override.conf'
docker exec pg2 sh -c 'echo "shared_preload_libraries = '\''\$libdir/dbms_pipe, \$libdir/edb_gen, \$libdir/dbms_aq, edb_wait_states, sql-profiler, index_advisor'\''" >> /opt/postgres/data/conf.d/9999-override.conf'
docker exec -it pg1 bash -c "sudo su - enterprisedb -c 'pg_ctl restart'"
docker exec -it pg2 bash -c "sudo su - enterprisedb -c 'pg_ctl restart'"

EDBPASSWORD=$(tpaexec show-password pemdemo enterprisedb)

#IP=$(hostname -i)
IP=localhost
printf "${G}--- Provisioning complete. You can now access PEM on ${R}https://$IP/pem${G} using userid ${R}enterprisedb${G} and password ${R}$EDBPASSWORD\n"
