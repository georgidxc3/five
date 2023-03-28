-- this file with the help of jinja template is creating snapshot of raw_listings table
{% snapshot scd_raw_listings %}

{{
    config(
        target_schema="public",
        unique_key="id",
        strategy="timestamp",
        updated_at='updated_at',
        invalidate_hard_deletes=True
    )
}}

select * from {{ source('airbnb', 'listings') }}

{% endsnapshot %}
