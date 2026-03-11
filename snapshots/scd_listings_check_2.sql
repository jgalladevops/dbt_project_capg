
{% snapshot scd_listings_check_2 %}

{{
    config(
        target_schema='dbt_deploy_schema',
        unique_key='id',
        strategy='check',
        check_cols= 'all',
        dbt_valid_to_current="to_date('9999-12-31')",
        hard_delete='invalidate'
    )
}}

select * from 
{{ source('RAW_SOURCE_LAYER','LISTINGS')}}
 

{% endsnapshot %}