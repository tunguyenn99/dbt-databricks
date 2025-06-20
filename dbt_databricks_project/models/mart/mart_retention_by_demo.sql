with snapshot as (
    select * from {{ ref('int_employee_snapshot') }}
),

grouped as (
    select
        year,
        gender,
        ethnicity,
        {{ group_age('age') }} as age_group,
        count(*) filter (where is_active = 1) as headcount,
        count(*) filter (
            where exit_date is not null and date_trunc('year', exit_date) = year
        ) as separations
    from snapshot
    group by year, gender, ethnicity, age_group
)

select *,
    {{ calc_retention_rate('separations', 'headcount') }} as retention_rate
from grouped
