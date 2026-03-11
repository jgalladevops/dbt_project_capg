{% macro jaya_email_udf(args) %}
 
    {% set sqls %}

    CREATE OR REPLACE FUNCTION jaya_function (email STRING)

    RETURNS STRING

    LANGUAGE SQL

    AS

    $$

      SELECT SPLIT_PART(email, '@', 2)

    $$

    {% endset %}

    {{ log("creating udf: ", info=true) }}

    {{ run_query(sqls) }}

{% endmacro %}
 