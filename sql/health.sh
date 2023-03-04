#! /bin/bash

data=$(/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -Q "SELECT COUNT(*)  FROM master.dbo.sysdatabases WHERE name = N'$SONAR_DB'" | tr -dc '0-9'| cut -c1 )
if [ ${data} -eq "1" ]; then
    echo "GO!"
    exit 0
else
    echo "RETRY..."
    exit 1
fi