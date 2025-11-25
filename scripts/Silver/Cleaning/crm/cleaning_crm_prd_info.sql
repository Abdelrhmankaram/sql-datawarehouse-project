insert into silver.crm_prd_info(
	prd_id,
	cat_id,
	prd_key,
	prd_nm,
	prd_cost,
	prd_line,
	prd_start_dt,
	prd_end_dt)
select
prd_id,
replace(substring(prd_key, 1, 5), '-', '_') AS cat_id,
substring(prd_key, 7, len(prd_key)) as prd_key,
prd_nm,
ISNULL(prd_cost, 0) as prd_cost,

case UPPER(TRIM(prd_line))
	 when 'M' then 'Mountain'
	 when 'R' then 'Road'
	 when 'S' then 'Mountain'
	 when 'T' then 'Touring'
	 else 'n/a'
end as prd_line,

prd_start_dt,
DATEADD(day, -1, LEAD(prd_start_dt) over (partition by prd_key order by prd_start_dt)) as prd_end_dt
from bronze.crm_prd_info