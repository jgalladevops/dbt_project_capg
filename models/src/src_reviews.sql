{{
    config(
        materialized = 'view'
    )
}}

with cte_1 as
(
select * from {{source('RAW_SOURCE_LAYER','REVIEWS')}}
)
select
listing_id,
date as review_date,
reviewer_name,
comments as review_text,
sentiment as review_sentiment
from
cte_1