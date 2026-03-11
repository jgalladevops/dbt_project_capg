{{
  config(
    materialized = 'incremental',
    on_schema_change='append_new_columns'
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
null as my_new_column,
null as new_column2  
FROM src_reviews
WHERE review_text is not null


{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}