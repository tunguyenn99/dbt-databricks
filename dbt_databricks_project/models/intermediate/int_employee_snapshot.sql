with base as (
    select * from {{ ref('stg_employees') }}
),

calendar_years as (
    select distinct year
    from (
        select explode(sequence(
            date_trunc('year', (select min(hire_date) from base)),
            coalesce(date_trunc('year', (select max(exit_date) from base)), current_date),
            interval 1 year
        )) as year
    )
),

crossed as (
    select
        e.employee_id,
        e.gender,
        e.ethnicity,
        e.age,
        e.hire_date,
        e.exit_date,
        c.year
    from base e
    cross join calendar_years c
),

snapshot as (
    select
        *,
        case 
            when year >= date_trunc('year', hire_date)
              and (exit_date is null or year <= date_trunc('year', exit_date))
            then 1 else 0
        end as is_active
    from crossed
)

select * from snapshot
