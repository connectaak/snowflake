show tables;
show user functions;
show procedures;
show views;
show tasks;

describe table demo_table;
describe function demo_func();
describe procedure demo_proc();
describe view demo_view;
describe task demo_task;

select get_ddl('table', 'demo_table');
select get_ddl('function', 'demo_func()');
select get_ddl('procedure', 'demo_proc()');
select get_ddl('view', 'demo_view');
select get_ddl('task', 'demo_task');

create temporary table _temp.demo_table_temp as
select * from demo_table;
