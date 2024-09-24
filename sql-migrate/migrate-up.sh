#!/bin/bash

set -e

echo "Get go binary..."

go install github.com/rubenv/sql-migrate/...@v1.7.0

echo "Execute sql-migrate up..."

sql-migrate up \
    -config=dbconfig.yml -env postgres
