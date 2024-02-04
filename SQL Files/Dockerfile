# Use the SQL Server 2019 image from Microsoft
FROM mcr.microsoft.com/mssql/server:2019-latest

# Set environment variables for SQL Server
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Your_Strong_Password

# Copy the SQL script that initializes the database
COPY init.sql /docker-entrypoint-initdb.d/