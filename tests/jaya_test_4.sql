select count(*),listing_id from
{{ ref('dim_listings_cleanse') }}
group by listing_id having count(*) > 1
 