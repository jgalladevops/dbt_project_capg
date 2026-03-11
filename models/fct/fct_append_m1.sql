{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'append'
    )
}}


WITH src_reviews
AS
(
  SELECT * FROM {{ ref('src_reviews') }}
)

SELECT 
listing_id,
review_date,
reviewer_name,
review_text,
review_sentiment
FROM src_reviews
WHERE review_text is not null


{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}