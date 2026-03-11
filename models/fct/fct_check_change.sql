{{
  config(
    materialized = 'incremental',
    on_schema_change='sync_all_columns'
    )
}}


WITH src_reviews
AS
(
  SELECT * FROM {{ ref('src_reviews') }}
)

SELECT 
cast(listing_id as varchar(420)) as listing_id,
review_date,
cast(reviewer_name as varchar(420)) as reviewer_name,
review_text,
null as new_column 
FROM src_reviews
WHERE review_text is not null


{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}