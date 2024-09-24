#!/bin/bash

set -e

docker run --rm --network=container:db \
    -v $(pwd)/liquibase.properties:/liquibase/liquibase.docker.properties \
    -v $(pwd)/candles_changelog.sql:/liquibase/candles_changelog.sql \
    liquibase/liquibase:4.29 \
    migrate
