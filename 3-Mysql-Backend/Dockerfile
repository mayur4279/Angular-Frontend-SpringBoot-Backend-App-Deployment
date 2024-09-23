FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=admin@1234

COPY *.sql  /docker-entrypoint-initdb.d/

RUN chmod 644 /docker-entrypoint-initdb.d/*.sql

EXPOSE 3306  

