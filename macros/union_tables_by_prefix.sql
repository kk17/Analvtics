{% macro union_tables_by_prefix(prefix, database=target.database, schema=target.schema) %}



    {% set tables=dbt_utils.get_relations_by_prefix(database=database, schema=schema, prefix=prefix) %}
    
    {{ log('prefix=' ~ prefix ~ ' database=' ~ database ~ ' schema=' ~schema, info=True) }}
    {{ log(tables, info=True) }}

    {% for table in tables %}
        {{ log(table, info=True) }}
        {% if not loop.first %}
            union all
        {% endif %}
        select * from {{ table.database }}.{{ table.schema }}.{{ table.name }}
        
    {% endfor %}

{% endmacro %}