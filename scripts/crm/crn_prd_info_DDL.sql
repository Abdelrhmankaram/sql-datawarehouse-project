IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info
create table bronze.crm_prd_info (
	prd_id INT,
	prd_key VARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(1),
	prd_start_dt DATE,
	prd_end_dt DATE
);