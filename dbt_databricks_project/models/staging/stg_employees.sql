with source as (
    select * from {{ source('hr_source', 'hr_raw_data') }}
),

cleaned as (
    select
        employee_id,
        full_name,
        job_title,
        department,
        business_unit,
        gender,
        ethnicity,
        cast(age as int) as age,
        to_date(hire_date, 'M/d/yyyy') as hire_date,
        to_date(exit_date, 'M/d/yyyy') as exit_date,
        cast(annual_salary as float) as annual_salary,
        bonus as bonus_percentage,
        country,
        city,
        cast(latitude as float) as latitude,
        cast(longitude as float) as longitude
    from source
)

select * from cleaned
