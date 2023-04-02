

set db_name = 'SNOWFLAKE_DB_NAME';
set db_schema_name = 'SNOWFLAKE_DB_SCHEMA_NAME';

use database identifier($db_name);

select 'select count(*) from ' || table_catalog || '.' || table_schema || '.' || table_name || ' where condition=true' count_queries
from information_schema.tables
and table_name like any ('%_TABLE_NAME_TO_MATCH')
and table_name not int ('DO_NOT_DELETE_TABLE_1','DO_NOT_DELETE_TABLE_2')
and table_type = 'BASE TABLE'
