{% set old_etl_relation=ref('customer_orders') %} 

{% set dbt_relation=ref('fct_customer_orders') %}  {{ 

audit_helper.compare_relations(
        a_relation=old_etl_relation,
        b_relation=dbt_relation,
        primary_key="order_id"
    ) }}


select * from {{ ref('all_dates') }}


{{ target.name }}
{{ target.type }}
{{ target.role }}

{{ target }}

{{ union_tables_by_prefix('all_data')}}