--- part 6, ex 7
{{
    config(
     materialized = 'incremental', 
     on_schema_change = 'fail'
    )
}}
WITH src_comments AS
(
    SELECT * FROM {{ ref('src_airport_comments')}}
)
SELECT
comment_id,
airport_ident,
comment_timestamp,
NVL(member_nickname,'__UNKNOWN__') AS member_nickname,
comment_subject,
comment_body,
CURRENT_TIMESTAMP() as loaded_at
FROM 
src_comments
WHERE 
    comment_body IS NOT NULL 
    AND LENGTH(comment_body) > 0
{% if is_incremental() %}
 AND 
 comment_id > (
     SELECT MAX(comment_id) FROM {{ this }}
 )
{% endif %}