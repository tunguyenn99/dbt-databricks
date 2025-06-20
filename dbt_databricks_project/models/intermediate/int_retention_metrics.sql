with snapshot as (
    select * from {{ ref('int_employee_snapshot') }}
),

per_year as (
    select
        year,
        count(*) filter (where is_active = 1) as avg_employees,
        count(*) filter (where exit_date is not null and date_trunc('year', exit_date) = year) as separations
    from snapshot
    group by year
),

retention as (
    select
        year,
        separations,
        avg_employees,
        {{ calc_retention_rate('separations', 'avg_employees') }} as retention_rate
    from per_year
)

select * from retention