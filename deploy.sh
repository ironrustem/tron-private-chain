#!/bin/bash

# Exit on first error
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

find . -type f -name "*.sh" -print0 | xargs -0 chmod 755

JAVA_TRON_RELEASE_VERION=GreatVoyage-v4.1.2

if [ ! -f "${SCRIPT_DIR}/supernode/FullNode.jar" ]; then
  curl -L https://github.com/tronprotocol/java-tron/releases/download/${JAVA_TRON_RELEASE_VERION}/FullNode.jar > ${SCRIPT_DIR}/supernode/FullNode.jar
  cp ${SCRIPT_DIR}/supernode/FullNode.jar ${SCRIPT_DIR}/fullnode/FullNode.jar
fi

${SCRIPT_DIR}/clean-all.sh

docker-compose up -d aionode

sleep 5
tail -f ${SCRIPT_DIR}/fullnode/logs/tron.log
