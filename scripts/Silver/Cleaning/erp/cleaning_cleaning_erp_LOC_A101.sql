insert into silver.erp_loc_a101 (cid, cntry)
select
	REPLACE(cid, '-', '') as cid,
	case 
		when trim(cntry) = 'DE' then 'Germany'
		when trim(cntry) in('USA', 'United States') then 'United States of America'
		when trim(cntry) in(NULL, '') then 'n/a'
		else trim(cntry)
	end as cntry
from bronze.erp_loc_a101;
