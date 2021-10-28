# VM/Deploy
This is the VM that's responsible for supporting the fundamental operations of each node in the cluster.

## Responsibility
- TFTP Server: vSphere Auto Deploy utilizes PXE to bootstrap each deployment node, which relies on TFTP to send bootloaders to the systems.
- Syslog: With Auto Deploy, no disk is dedicated to vSphere. In order to retain logs, the nodes need to send them out to a Syslog server.

## Components
- `tftp-hpa`
- `syslog-ng`

Currently, all services are deployed with Docker Compose.

## Deploy with Docker Compose
You can deploy all services together with Docker Compose. Not that there are some Compose environment variables you need to set:
| Name | Usage |
| ------ | ------ |
| `ESXI_PXE_DIR` |  PXE bootloader directory for vSphere Auto Deploy to be exposed by TFTP |
| `SYSLOG_NG_CONF` | Configuration file for `syslog-ng` |
| `SYSLOG_NG_LOG_DIR` | Directory for `syslog-ng` to put its log files. If not given, `syslog-ng` will be given a Docker volume with name `deploy_logs`. |

Exmple Docker Compose `.env` file:
```
HOME_DIR=/home/deploy
BASE_DIR=${HOME_DIR}/services
ESXI_PXE_DIR=${BASE_DIR}/tftp/esxi-pxe
SYSLOG_NG_CONF=${BASE_DIR}/syslog-ng/syslog-ng.conf
SYSLOG_NG_LOG_DIR=${HOME_DIR}/syslogs
```
