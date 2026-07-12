#!/usr/bin/env bash

set -e

DATOMIC_VERSION=$(cat DATOMIC_VERSION)

container build \
    --build-arg "DATOMIC_VERSION=${DATOMIC_VERSION}" \
    -t datomic-pro:$DATOMIC_VERSION \
    .
