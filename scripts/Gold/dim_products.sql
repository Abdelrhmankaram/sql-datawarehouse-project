create view gold.dim_products as
select
	row_number() over (order by pri.prd_start_dt, pri.prd_key) as product_key, 
	pri.prd_id as product_id,
	pri.prd_key as product_number,
	pri.prd_nm as product_name,
	pri.cat_id as category_id,
	px.cat as category,
	px.subcat as subcategory,
	px.maintenance,
	pri.prd_cost as cost,
	pri.prd_line as product_line,
	pri.prd_start_dt as start_date
from silver.crm_prd_info as pri
	left join silver.erp_PX_CAT_G1V2 as px on pri.cat_id = px.id
	where pri.prd_end_dt is null;