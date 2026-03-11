{% macro jaya_snowpipe(args) %}

    {% set sqls %}
    create or replace pipe capg_snow_pipe 
    auto_ingest = true
    as
    copy into AWS_SF 
    from @capg_ext_stage
    file_format = EXCITING

    {% endset %}
    {{ log("CREATED SNOWPIPE", info=true) }}
    {{ run_query(sqls) }}
{% endmacro %}