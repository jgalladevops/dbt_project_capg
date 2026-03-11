{% macro area_of_square() %}
 
CREATE OR REPLACE FUNCTION {{ target.schema }}.area_of_square(side float)
    RETURNS FLOAT 
    AS 
    $$
    side * side 
    $$
    ;
 
{% endmacro %}