
-- we materialize as incremental to save all changes and historical data
-- we use jinja template to chek if review_date is fresher then last review date

{{
 config(
 materialized = 'incremental',
 on_schema_change='fail'
 )
}}
WITH src_reviews AS (
 SELECT * FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null
{% if is_incremental() %}
 AND review_date > (select max(review_date) from {{ this }})
{% endif %}