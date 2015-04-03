#!/bin/bash

: ${DB_USER:=boozelogger}
: ${DB_PASSWORD:=boozelogger}
: ${DB_NAME:=boozelogger}
: ${DB_ENCODING:=UTF-8}
: ${DB_PG_DUMP_FILE:=/tmp/db.sql}

{ gosu postgres postgres --single -jE <<-EOSQL
    CREATE ROLE "$DB_USER" WITH LOGIN PASSWORD '$DB_PASSWORD';
EOSQL
} && { gosu postgres postgres --single -jE <<-EOSQL
    CREATE DATABASE "$DB_NAME";
EOSQL
} && { gosu postgres postgres --single -jE <<-EOSQL
    GRANT ALL PRIVILEGES ON DATABASE "$DB_NAME" TO "$DB_USER";
EOSQL
} && { gosu postgres pg_ctl start -w && gosu postgres psql -d "$DB_NAME" < "$DB_PG_DUMP_FILE" && gosu postgres pg_ctl stop -w
} && /bin/rm -f ${DB_PG_DUMP_FILE}

