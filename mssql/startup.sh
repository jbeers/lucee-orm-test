
for i in {1..50};
do
	/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$MSSQL_SA_PASSWORD" -Q 'CREATE DATABASE testdb'    
    if [ $? -eq 0 ]
    then
        echo "testdb.setup.sql completed"
        break
    else
        echo "testdb not ready yet..."
        sleep 1
    fi
done
