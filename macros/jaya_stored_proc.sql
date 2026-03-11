{% macro jaya_stored_proc(target_table)  %}
    {% set sqls %}
CREATE OR REPLACE PROCEDURE sp_jaya_proc()
    RETURNS STRING
    LANGUAGE SQL
    AS
    $$
    DECLARE
      row_count INT;
    BEGIN
      SELECT COUNT(*) INTO row_count FROM {{ ref('dim_host_cleanse') }};
      RETURN 'Row count is : ' || row_count;
    END;
    $$;
    {% endset %}
    {{ log("CREATING STORE PROCEDURE: RUNNING BUNCH OF QUERIES ", info=true) }}
    {{ run_query(sqls) }}
{% endmacro %}