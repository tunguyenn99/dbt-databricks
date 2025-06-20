with base as (
    select * from {{ ref('stg_employees') }}
)

select
    business_unit,
    department,
    count(*) as num_employees,
    round(avg(bonus_percentage), 2) as avg_bonus_percentage,
    round(sum(bonus_percentage), 2) as total_bonus_percentage
from base
group by business_unit, department
order by avg_bonus_percentage desc
