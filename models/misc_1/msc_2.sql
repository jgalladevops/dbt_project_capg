{{ config(materialized='table') }}
 
with raw as (
 
 
  select  1 as id, 'sample' as name
  from {{ ref('currency') }}  
 
),
 
cte_m as (
 
  select
   
    cast(id as number) as customer_id,
    cast(trim(name) as varchar(100)) as first_name
  from raw
 
)
 
select * from cte_m