select * from 
{{ref('dim_listings_cleanse')}}
where minimum_nights < '{{ var("jaya_variable") }}'
