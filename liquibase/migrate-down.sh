#!/bin/bash

set -e

echo "Multiple rollback commands available, here we only rollback of 1 version."

docker run --rm --network=container:db \
    -v $(pwd)/liquibase.properties:/liquibase/liquibase.docker.properties \
    -v $(pwd)/candles_changelog.sql:/liquibase/candles_changelog.sql \
    liquibase/liquibase:4.29 \
    rollbackCount 1
