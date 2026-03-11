{% snapshot scd_listings_2 %}

{{
    config(
        target_schema='dbt_deploy_schema',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        hard_delete='new_record'
    )
}}

select * from 
{{ source('RAW_SOURCE_LAYER','LISTINGS')}}
 

{% endsnapshot %}