use role ACCOUNTADMIN;

set snowflake_role_name = 'SNOWFLAKE_ROLE';
set db_name = 'SNOWFLAKE_DB_NAME';
set db_schema_name = 'SNOWFLAKE_DB_SCHEMA_NAME';

grant usage, monitor on database identifier($db_name) to role identifier($snowflake_role_name)
grant usage, monitor on warehouse xs_wh to role reader_db_1;


