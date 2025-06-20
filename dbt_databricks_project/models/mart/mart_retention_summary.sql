-- mart_retention_summary.sql

with snapshot as (
    select * from {{ ref('int_employee_snapshot') }}
),

aggregated as (
    select
        year,
        gender,
        ethnicity,
        {{ group_age('age') }} as age_group,
        count(*) as headcount,
        count(*) filter (where exit_date is not null and date_trunc('year', exit_date) = year) as separations
    from snapshot
    where is_active = 1
    group by year, gender, ethnicity, age_group
)

select *,
    {{ calc_retention_rate('separations', 'headcount') }} as retention_rate
from aggregated
