#!/bin/bash

set -e

docker run --rm --network=container:db \
    -v "$(pwd):/flyway/sql" \
    -v "$(pwd):/flyway/conf" \
    redgate/flyway:10 \
    migrate
