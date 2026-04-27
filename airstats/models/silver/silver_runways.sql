WITH src_runways AS (
    SELECT * FROM {{ ref('src_runways')}}
)
SELECT
runway_id,
airport_ident,
runway_length_ft,
runway_width_ft,
--- If the surface is null or empty,
--- change it to __UNKNOWN__;
---- empty string == NULL?
CASE 
WHEN LENGTH(runway_surface) = 0 THEN '__UNKNOWN__'
ELSE NVL(runway_surface,'__UNKNOWN__') 
END AS runway_surface,
runway_lighted,
runway_closed
FROM src_runways
