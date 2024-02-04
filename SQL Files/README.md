# Project

## Getting Started

### Prerequisites
- Docker
- .NET SDK

### Running SQL Server in Docker
1. Build the Docker image:
    ```bash
    docker build -t sql_server_with_tables .
    ```
2. Run the Docker container:
    ```bash
    docker run -d -p 1433:1433 --name sql_server_container sql_server_with_tables
    ```
3. Execute SQL scripts to initialize the database:
    ```bash
    docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Your_Strong_Password -i /docker-entrypoint-initdb.d/init.sql
    docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Your_Strong_Password
    ```

### Running the .NET Project
```bash
dotnet run
