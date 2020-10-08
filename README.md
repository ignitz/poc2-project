- **Configurar CDC no Postgres**  
  https://debezium.io/documentation/reference/connectors/postgresql.html
- **Configurar CDC no Postgres RDS**  
  https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Source.PostgreSQL.html

Configurar CDC no SQLServer.

```sql
EXEC sys.sp_cdc_enable_db;

EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name   = N'addresses',
    @role_name     = NULL,
    @supports_net_changes = 1;

EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name   = N'companies',
    @role_name     = NULL,
    @supports_net_changes = 1;

EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name   = N'persons',
    @role_name     = NULL,
    @supports_net_changes = 1;

EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name   = N'persons_companies',
    @role_name     = NULL,
    @supports_net_changes = 1;

-- Check if CDC is enable
SELECT name, is_tracked_by_cdc FROM sys.tables where name = 'addresses';
SELECT name, is_tracked_by_cdc FROM sys.tables where name = 'companies';
SELECT name, is_tracked_by_cdc FROM sys.tables where name = 'persons';
SELECT name, is_tracked_by_cdc FROM sys.tables where name = 'persons_companies';
```

## RASCUNHO

```
3.236.157.46

zyPm2h5HZNDGgc0T

POSTGRES_USER=postgres
POSTGRES_PASSWORD=zyPm2h5HZNDGgc0T
POSTGRES_HOST=postgres
SQLSERVER_USER=sa
SQLSERVER_PASSWORD=zyPm2h5HZNDGgc0T
SQLSERVER_HOST=sqlserver
TOKEN=zyPm2h5HZNDGgc0T

docker run -p 3333:3333 --name datafeeder --env-file .env --network databases -d datafeeder_datafeeder yarn start

datafeeder:
datafeeder_datafeeder
    build: ../
    depends_on:
      - sqlserver
      - postgres
    restart: always
    ports:
      - 3333:3333
    environment:
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
      - POSTGRES_HOST=postgres
      - SQLSERVER_USER=${SQLSERVER_USER}
      - SQLSERVER_PASSWORD=${SQLSERVER_PASSWORD}
      - SQLSERVER_HOST=sqlserver
      - NODE_PATH=./src
      - TOKEN=${TOKEN}
    command: bash -c "yarn start"
    networks:
      - databases
```

Habilitar CDC PostgresSQL

```sql
ALTER SYSTEM SET wal_level = logical;

show wal_level;
show max_replication_slots;


select * from pg_replication_slots;
select pg_drop_replication_slot('debezium');

```
