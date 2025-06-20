select
    period,
    avg_employees,
    separations,
    turnover_rate
from {{ ref('int_turnover_by_period') }}
order by period
