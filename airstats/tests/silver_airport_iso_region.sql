SELECT
airport_ident,
iso_region
FROM {{ ref('silver_airports') }}
WHERE 
iso_region IS NOT NULL 
AND 
iso_region NOT LIKE '%-%'