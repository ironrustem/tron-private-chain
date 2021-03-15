#!/bin/sh

cd /opt/tron/supernode
nohup java -Xmx6g -XX:+HeapDumpOnOutOfMemoryError -jar FullNode.jar --witness -c supernode.conf </dev/null &>/dev/null &

cd /opt/tron/fullnode
nohup java -Xmx6g -XX:+HeapDumpOnOutOfMemoryError -jar FullNode.jar -c fullnode.conf </dev/null &>/dev/null &
