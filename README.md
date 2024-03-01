# Postgres Enterprise Manager demo

This demo is built for Docker and is using the Trusted Postgres Architect (TPA) to deploy a 2-node cluster managed by EDB Failover Manager, a Barman server and a PEM server.
The objective of the demo environment is to show the value of Postgres Enterprise Manager.

TPA will deploy the following components:
| Name | Task | Remarks |
| -------- | -------- | -------- |
| pg1| Postgres primary | PEM agent<br>Backup target |
| pg2 | Postgres replica | PEM agent |
| pemserver | PEM |  |
| barman | Barman | PEM agent <br> EFM witness|

The EFM cluster which is creatd is called `pemdemo`. Status of the EFM cluster can be shown using `docker exec -it pg1 bash -c "/usr/edb/efm-4.7/bin/efm cluster-status pemdemo"`

## Demo prep
Run `00-provision.sh` to provision the Postgres (PG1) and the PEM (pemserver) container. This deployment will take appx. 
After successful deployment PEM should be available on https://<host-ip>/pem

PEM user is `enterprisedb` and the access password for this user can be revealed using `tpaexec show-password pemdemo enterprisedb`.

After setting u the demo you need to disconnect from PG1 and PG2, add the EFM parameters to Propeties / Advanced.
```
EFM cluster name : pemdemo
EFM installation path : /usr/edb/efm-4.7/bin/
```

## Demo flow

## Demo cleanup
To clean up the demo environment you just have to run `99-deprovision.sh`. This script will remove the docker containers and the cluster configuration.

## Closing remarks
This demo is broken on Docker Engine V25 and beyond (eg. Docker Desktop for Mac v4.27 and later). You will get the following error:
```
TASK [sys : Enable rc-local service] *********************************************************************************************************************************************************************************************************
fatal: [pg1]: FAILED! => {"changed": false, "cmd": "/usr/bin/systemctl", "msg": "Failed to connect to bus: No such file or directory", "rc": 1, "stderr": "Failed to connect to bus: No such file or directory\n", "stderr_lines": ["Failed to connect to bus: No such file or directory"], "stdout": "", "stdout_lines": []}
```
This is a Docker Engine issue and the only way i found to work around this is to run a pre-V25 Docker Engine. For Docker Desktop for Mac this is version 4.26.1.
