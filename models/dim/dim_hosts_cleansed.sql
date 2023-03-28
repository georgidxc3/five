--- in dimention folder we store cleansed data from raw cource
--- in config jinja function we specify the materialization of the table 
--- materialization of the table can be also specified in dbt_project.yml - models:
--- we use cte as best practice

{{
 config(
 materialized = 'view'
 )
}}
WITH src_hosts AS (
 SELECT
 *
 FROM
 {{ ref('src_hosts') }}
)
SELECT
 host_id,
 NVL(host_name,'Anonymous') AS host_name,
 is_superhost,
 created_at,
 updated_at
FROM
 src_hosts