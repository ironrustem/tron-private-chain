#!/bin/bash

# Exit on first error
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

docker-compose down

# supernode
sudo rm -rf ${SCRIPT_DIR}/supernode/logs
sudo rm -rf ${SCRIPT_DIR}/supernode/output-directory
sudo rm -f ${SCRIPT_DIR}/supernode/nohup.out

# fullnode
sudo rm -rf ${SCRIPT_DIR}/fullnode/logs
sudo rm -rf ${SCRIPT_DIR}/fullnode/output-directory
sudo rm -f ${SCRIPT_DIR}/fullnode/nohup.out
