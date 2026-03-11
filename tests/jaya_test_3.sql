select * from
{{ ref('dim_listings_cleanse') }} l
inner join {{ ref('fct') }} r
using (listing_id)
where l.created_at >= r.date
 