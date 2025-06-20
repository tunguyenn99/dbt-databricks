select
    year(to_date(hire_date)) as hire_year,
    round(avg(bonus_percentage), 2) as avg_bonus_percentage,
    count(*) as num_employees
from {{ ref('stg_employees') }}
group by hire_year
order by hire_year
