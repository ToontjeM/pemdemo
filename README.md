# Postgres Enterprise Manager demo

This demo is built for Docker and is using the Trusted Postgres Architect to deploy.

## Demo prep
Run `000-provision.sh` to provision the Postgres (PG1) and the PEM (pemserver) container.
After successful deployment PEM should be available on https://<host-ip>/pem

PEM user is `enterprisedb` and the access password for this user can be revealed using `tpaexec show-password pemdemo enterprisedb`.

