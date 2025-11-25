insert into silver.crm_cust_info(
	cst_id,
	cst_key,
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date
)
select
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,

TRIM(cst_lastname) as cst_lastname,

case when UPPER(cst_marital_status) = 'S' then 'Single'
	 when UPPER(cst_marital_status) = 'M' then 'Married'
	 else 'n/a'
end cst_marital_status,

case when UPPER(cst_gndr) = 'F' then 'Female'
	 when UPPER(cst_gndr) = 'M' then 'Male'
	 else 'n/a'
end cst_gndr,

cst_create_date
from (
select *,
ROW_NUMBER() over (partition by cst_id order by cst_create_date desc) as flag_last
from bronze.crm_cust_info
where cst_id is not null
)t where flag_last = 1;