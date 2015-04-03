#!/bin/sh

psql -Upostgres postgres -c "create database boozelogger"
psql -Upostgres postgres -c "create role boozelogger with login password \"boozelogger\""
psql -Upostgres postgres -c "grant all privileges on database boozelogger to boozelogger"

psql -Upostgres boozelogger < /tmp/schema.sql
