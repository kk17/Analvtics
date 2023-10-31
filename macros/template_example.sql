{% macro template_example() %}
    {% set query %}
        select true as bool
    {% endset %}

    {% if execute %}
        {% set result = run_query(query).columns[0].values()[0] %}
        {{ log('SQL result ' ~ results, info=True) }}
        select
         {{ result }} as is_real
         from a_real_table
    {% endif %}
{% endmacro %}