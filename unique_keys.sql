--
-- get unique keys and related info
--
select kcu.table_schema,
       kcu.table_name,
       tco.constraint_name,
       kcu.ordinal_position as position,
       kcu.column_name as key_column,
       tco.constraint_type
from information_schema.table_constraints tco
join information_schema.key_column_usage kcu 
     on kcu.constraint_name = tco.constraint_name
     and kcu.constraint_schema = tco.constraint_schema
     and kcu.constraint_name = tco.constraint_name
where tco.constraint_type = 'UNIQUE'
order by kcu.table_schema,
         kcu.table_name,
         position;