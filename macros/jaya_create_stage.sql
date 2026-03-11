{% macro jaya_create_stage(args) %}
 
    {% set sqls %}
    create or replace stage capg_ext_stage 
    url = 's3://capgmarchjayasri/'
    storage_integration = capg_int
    file_format = EXCITING
 
    {% endset %}
    {{ log("CREATED STAGE", info=true) }}
    {{ run_query(sqls) }}
{% endmacro %}