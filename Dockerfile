FROM postgres:9.4
RUN mkdir -p /docker-entrypoint-initdb.d

ADD init-database.sh /docker-entrypoint-initdb.d/
ADD schema.sql /tmp/schema.sql
ADD db.sql /tmp/db.sql
