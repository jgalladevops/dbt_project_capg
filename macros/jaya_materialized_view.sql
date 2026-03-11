{% macro  jaya_materialized_view(args) %}
 
    {% set var %}
 
create or replace materialized view jaya_mv 
as 
(
    select * from {{ref('dim_host_cleanse')}}
)
    {% endset %}
    {% do run_query(var) %}
 
{% endmacro %}