
with cte_1 as (
 
select * from
{{ref('currency')}}
 
 
)
 
select * from cte_1