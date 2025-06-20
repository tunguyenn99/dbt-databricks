select
    gender,
    ethnicity,
    {{ group_age('age') }} as age_group,
    round(avg(annual_salary), 2) as avg_salary,
    round(avg(bonus_percentage), 2) as avg_bonus
from {{ ref('stg_employees') }}
group by gender, ethnicity, age_group
