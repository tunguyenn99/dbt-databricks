select
    country,
    city,
    count(*) as employee_count,
    round(avg(latitude), 4) as avg_lat,
    round(avg(longitude), 4) as avg_long
from {{ ref('stg_employees') }}
group by country, city
