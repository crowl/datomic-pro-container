#!/usr/bin/env bash

set -e

DATOMIC_VERSION=$(cat DATOMIC_VERSION)

JVM_OPTS="-Xms1g -Xmx4g"

container run \
    --init \
    --detach \
    --cpus 4 \
    --memory 4g \
    --publish 4334:4334 \
    --publish 4335:4335 \
    --volume $(pwd)/transactor.properties:/etc/datomic/transactor.properties \
    --volume $(pwd)/data:/data \
    --name datomic-pro \
    datomic-pro:$DATOMIC_VERSION \
    /opt/datomic/bin/transactor $JVM_OPTS /etc/datomic/transactor.properties
