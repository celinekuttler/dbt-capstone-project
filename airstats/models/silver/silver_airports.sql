WITH src_airports AS (
    SELECT * FROM {{ ref('src_airports')}}
)
SELECT
id,
airport_ident,
airport_type,
airport_name,
airport_lat,
airport_long,
continent,
iso_country,
iso_region
FROM src_airports