use role ACCOUNTADMIN;

set snowflake_role_name = 'SNOWFLAKE_ROLE';

set warehouse_name = 'SNOWFLAKE_ROLE';
set db_name = 'SNOWFLAKE_DB_NAME';
set db_schema_name = 'SNOWFLAKE_DB_SCHEMA_NAME';

grant usage, monitor on database identifier($db_name) to role identifier($snowflake_role_name);
grant usage, monitor on warehouse identifier($warehouse_name) to role identifier($snowflake_role_name);



