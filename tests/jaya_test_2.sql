select * from 
{{ref('src_listings')}} 
where minimum_nights < 1
 