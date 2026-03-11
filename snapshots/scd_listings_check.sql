{% snapshot scd_listings_check %}

{{
    config(
        target_schema='dbt_deploy_schema',
        unique_key='id',
        strategy='check',
        check_cols= ['id','name','listing_url'],
        hard_delete='invalidate'
    )
}}

select * from 
{{ source('RAW_SOURCE_LAYER','LISTINGS')}}
 

{% endsnapshot %}