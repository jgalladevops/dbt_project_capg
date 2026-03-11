{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = 'host_id'
    )
}}


WITH src_host
AS
(
  SELECT * FROM {{ ref('src_host') }}
)

SELECT * 
FROM src_host 
WHERE host_id is not null


{% if is_incremental() %}
  AND updated_at > (select max(updated_at) from {{ this }})
{% endif %}