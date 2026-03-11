
{{
    config(materialized='view',alias='JAYA_VIEW', schema='new_capg_schema')
}}
 
 
 
with cte_1 as
(
select
host_id,
nvl(host_name,'anonymus') as host_name,
is_superhost,
created_at,
updated_at
from
{{ref('src_host')}}
 
)
select * from cte_1