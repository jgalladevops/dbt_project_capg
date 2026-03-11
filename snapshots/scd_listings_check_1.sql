{% snapshot scd_listings_check_1 %}

{{
    config(
        target_schema='dbt_deploy_schema',
        unique_key='id',
        strategy='check',
        check_cols= 'all',
        hard_delete='invalidate'
    )
}}

select * from 
{{ source('RAW_SOURCE_LAYER','LISTINGS')}}
 

{% endsnapshot %}