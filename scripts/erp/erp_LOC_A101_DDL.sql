IF OBJECT_ID('bronze.erp_LOC_A101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_LOC_A101
create table bronze.erp_LOC_A101 (
	CID VARCHAR(50),
	CNTRY VARCHAR(50)
);