{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'insert_overwrite',
    partition_by = {'field':'updated_at','data_type':'date'}
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