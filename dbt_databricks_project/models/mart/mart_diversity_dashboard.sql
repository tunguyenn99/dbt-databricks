with base as (
    select * from {{ ref('stg_employees') }}
),

grouped as (
    select
        gender,
        ethnicity,
        case
            when age < 30 then '<30'
            when age between 30 and 50 then '30–50'
            else '50+'
        end as age_group,
        count(*) as employee_count
    from base
    group by gender, ethnicity, age_group
)

select * from grouped
