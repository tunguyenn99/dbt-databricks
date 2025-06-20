select
    business_unit,
    department,
    count(*) as employee_count,
    round(avg(bonus_percentage), 2) as avg_bonus_percentage
from {{ ref('stg_employees') }}
group by business_unit, department
order by avg_bonus_percentage desc
