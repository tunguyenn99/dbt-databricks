select
    department,
    job_title,
    round(avg(annual_salary), 2) as avg_salary,
    round(avg(bonus_percentage), 2) as avg_bonus
from {{ ref('stg_employees') }}
group by department, job_title
