with base as (
    select * from {{ ref('stg_employees') }}
),

by_month as (
    select
        date_trunc('month', exit_date) as period,
        count(*) as separations
    from base
    where exit_date is not null
    group by 1
),

employee_months as (
    select
        employee_id,
        explode(sequence(
            date_trunc('month', hire_date),
            coalesce(date_trunc('month', exit_date), date_trunc('month', current_date)),
            interval 1 month
        )) as period
    from base
),

headcount as (
    select
        period,
        count(distinct employee_id) as avg_employees
    from employee_months
    group by period
),

combined as (
    select
        h.period,
        h.avg_employees,
        coalesce(b.separations, 0) as separations,
        {{ calc_turnover_rate('coalesce(b.separations, 0)', 'h.avg_employees') }} as turnover_rate
    from headcount h
    left join by_month b on h.period = b.period
)

select * from combined
order by period
