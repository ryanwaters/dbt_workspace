{% snapshot moderna_snapshot %}
    {{
        config(
            target_schema=target.schema,
            unique_key='uk',
            strategy='timestamp',
            updated_at='fid'
        )
    }}

    select * from {{ ref('moderna_data') }}

 {% endsnapshot %}