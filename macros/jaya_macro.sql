{% macro jaya_macro() %}

    {%  set your_name = "jaya" %}
    {{ log("hello " ~ your_name, info = true) }}



    {%  set light_colour = "green" %}


    {% if light_colour == "red" %}

        {{ log("PLEASE STOP",info = true) }}

    {% elif light_colour == "yellow" %}

        {{ log("PLEASE WAIT",info = true) }}

    {% elif light_colour == "green" %}

        {{ log("PLEASE MOVE",info = true) }}

    {% else %}

        {{ log("invalid colour", info = true) }}

    {% endif %}

{% endmacro %}
 