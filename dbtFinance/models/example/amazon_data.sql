
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

import dbt_utils.csv as csv

{{ config(materialized='table') }}

amazon = csv.read_csv(filepath="dataset/archive/output.csv")

SELECT * FROM amazon;

CREATE OR REPLACE TABLE analyzed_data AS SELECT * FROM amazon;

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
