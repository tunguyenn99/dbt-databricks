with snapshot as (
    select * from {{ ref('int_employee_snapshot') }}
),

base as (
    select
        year,
        business_unit,
        count(*) filter (where is_active = 1) as headcount,
        count(*) filter (
            where snapshot.exit_date is not null and date_trunc('year', snapshot.exit_date) = year
        ) as separations
    from snapshot
    join {{ ref('stg_employees') }} as emp using (employee_id)
    group by year, business_unit
)

select *,
    {{ calc_retention_rate('separations', 'headcount') }} as retention_rate
from base
