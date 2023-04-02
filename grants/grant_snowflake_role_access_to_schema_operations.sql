use role ACCOUNTADMIN;

set snowflake_role_name = 'SNOWFLAKE_ROLE';

set warehouse_name = 'SNOWFLAKE_ROLE';
set db_name = 'SNOWFLAKE_DB_NAME';
set db_schema_name = 'SNOWFLAKE_DB_SCHEMA_NAME';


grant usage, monitor on database identifier($db_name) to role identifier($snowflake_role_name);
grant usage, monitor on warehouse identifier($warehouse_name) to role identifier($snowflake_role_name);

use database identifier($db_name);

grant usage on schema identifier($db_schema_name) to role identifier($snowflake_role_name);




--- Unfortunately in Snowflake, there is no as such command to grant all access via a single command.
--- Even with all privileges command, you have to grant one usage privilege against the object to be effective.
--- For future grants, you can try following commands at schema and database level

--- SCHEMA LEVEL

grant usage on database SAMPLEDATABASE1 to role identifier($snowflake_role_name);
grant usage on schema SAMPLEDATABASE1.TEST to role identifier($snowflake_role_name);
grant select on future tables in schema SAMPLEDATABASE1.TEST to role identifier($snowflake_role_name);
grant role testrole12 to user SNOWFLAKE_USER;

--- DATABASE LEVEL
grant usage on database SAMPLEDATABASE1 to role identifier($snowflake_role_name);
grant usage on future schemas in database SAMPLEDATABASE1 to role identifier($snowflake_role_name);
grant select on future tables in database SAMPLEDATABASE1 to role identifier($snowflake_role_name);
grant role testrole12 to user SNOWFLAKE_USER;

---There is no one single command to affect all the objects under the database, but you can run these set of SQL's per object:

GRANT ALL ON ALL schemas in database <DB> TO ROLE <role>; 
GRANT ALL ON ALL TABLES IN SCHEMA <db.schema> TO ROLE <role>; 
similarly for future grants:

grant all on future schemas in database <DB> TO ROLE <role>;

grant all on future tables in schema <db.schema> to ROLE <role>;
This can be extended to views and other objects too.


--- views
grant select on all views in schema identifier($db_schema_name) to role identifier($snowflake_role_name);
grant select on future views in schema identifier($db_schema_name) to role identifier($snowflake_role_name);


--- tables

grant create table on schema identifier($db_schema_name) to role identifier($snowflake_role_name);

grant select on all tables in schema identifier($db_schema_name) to role identifier($snowflake_role_name);
grant select,insert,update on all tables on schema identifier($db_schema_name) to role identifier($snowflake_role_name);

--- specific table & permission
grant select,insert,update,delete on table SPECIFIC_TABLE_NAME to role identifier($snowflake_role_name);







--- reference 
-- https://stackoverflow.com/questions/72654388/how-do-i-grant-all-privileges-for-a-database-to-a-role-in-snowflake
-- https://github.com/trevor-higbee/snowflake-tools/tree/master/privileges
