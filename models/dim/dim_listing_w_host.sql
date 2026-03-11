with cte_1 as 

( 

select

*

from 

{{ref('dim_host_cleanse')}}

)

,
 
cte_2 as (

select * from {{ref('dim_listings_cleanse')}}

)
 
SELECT

list.listing_id,

list.listing_name,

list.room_type,

list.minimum_nights,

list.price_str,

list.host_id,

host.host_name,

host.is_superhost as host_is_superhost,

list.created_at,

greatest(list.updated_at, host.updated_at) as updated_at

from 

cte_2 as list left join cte_1 as host 

on list.host_id = host.host_id

 