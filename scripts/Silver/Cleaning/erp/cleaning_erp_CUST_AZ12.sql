insert into silver.erp_cust_az12 (cid, bdate, gen)
select
	case 
		when CID like 'NAS%' then SUBSTRING(cid, 4, len(cid))
		else CID
	end,

	case
		when BDATE > getdate() then null
		else BDATE
	end,

	case
		when UPPER(GEN) = 'M' then 'Male'
		when upper(GEN) = 'F' then 'Female'
 		when GEN = null or TRIM(GEN) = '' then 'n/a'
		else GEN
	end
from bronze.erp_CUST_AZ12