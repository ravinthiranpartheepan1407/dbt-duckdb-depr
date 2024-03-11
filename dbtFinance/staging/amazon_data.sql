WITH amazon_data AS(
    SELECT * FROM {{ source('staging', 'output.csv') }}
)


select *
from amazon_data