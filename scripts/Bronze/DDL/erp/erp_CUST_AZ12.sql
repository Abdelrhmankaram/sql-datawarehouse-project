IF OBJECT_ID('bronze.erp_CUST_AZ12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_CUST_AZ12
	
create table bronze.erp_CUST_AZ12 (
	CID VARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50)
);