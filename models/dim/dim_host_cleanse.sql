{{ config(
    database = target.database
    )
}}



with cte_1 as
 
(
 
select
* from
{{ref('src_host')}}
 
 
 
)
 
 
 
select host_id,
nvl(host_name, 'anonymous') as host_name,
is_superhost,
created_at,
updated_at from cte_1