#! /bin/bash

/opt/mssql/bin/sqlservr &

sleep 15

for file in /usr/src/sql/*.sql; do
    echo "Excecuting $file..."
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -l 30 -e -i $file
done

sleep infinity