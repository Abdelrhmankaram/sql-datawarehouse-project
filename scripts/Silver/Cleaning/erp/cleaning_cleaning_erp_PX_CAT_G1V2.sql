insert into silver.erp_PX_CAT_G1V2(id, cat, subcat, maintenance)
select
	ID,
	CAT,
	SUBCAT,
	MAINTENANCE
from bronze.erp_PX_CAT_G1V2