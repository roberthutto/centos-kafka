#!/bin/sh

sed -i -e 's|'broker.id=0'|'broker.id=$BROKER_ID'|g' /opt/kafka/config/server.properties
sed -i -e 's|'zookeeper.connect=localhost:2181'|'zookeeper.connect=$ZOOKEEPER_HOST_NAMES'|g' /opt/kafka/config/server.properties

exec "$@"