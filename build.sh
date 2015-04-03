#!/bin/bash

SQL_FILE=$1
DB_NAME=$2
DB_USER=$3
DB_PASSWORD=$4

cp $1 ./schema.sql

docker 
