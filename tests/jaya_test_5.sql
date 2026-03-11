select * from
{{ ref('dim_listings_cleanse') }} 
where listing_id is null
 