{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'microbatch',
    event_time = 'created_at',
    batch_size = 'year',
    unique_key = 'host_id',
    begin = '2010-01-01',
    lookback = 2
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