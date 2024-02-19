# Postgres Enterprise Manager demo

This demo is built for Docker and is using the Trusted Postgres Architect to deploy.
This demo is broken on Docker Engine V25 and beyond (eg. Docker Desktop for Mac v4.27 and later). You will get the following error:
```TASK [sys : Enable rc-local service] *********************************************************************************************************************************************************************************************************
fatal: [pg1]: FAILED! => {"changed": false, "cmd": "/usr/bin/systemctl", "msg": "Failed to connect to bus: No such file or directory", "rc": 1, "stderr": "Failed to connect to bus: No such file or directory\n", "stderr_lines": ["Failed to connect to bus: No such file or directory"], "stdout": "", "stdout_lines": []}
fatal: [pemserver]: FAILED! => {"changed": false, "cmd": "/usr/bin/systemctl", "msg": "Failed to connect to bus: No such file or directory", "rc": 1, "stderr": "Failed to connect to bus: No such file or directory\n", "stderr_lines": ["Failed to connect to bus: No such file or directory"], "stdout": "", "stdout_lines": []}```

## Demo prep
Run `000-provision.sh` to provision the Postgres (PG1) and the PEM (pemserver) container.
After successful deployment PEM should be available on https://<host-ip>/pem

PEM user is `enterprisedb` and the access password for this user can be revealed using `tpaexec show-password pemdemo enterprisedb`.

