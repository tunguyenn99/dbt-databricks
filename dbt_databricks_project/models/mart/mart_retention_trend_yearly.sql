select
    year,
    avg_employees,
    separations,
    retention_rate
from {{ ref('int_retention_metrics') }}
order by year