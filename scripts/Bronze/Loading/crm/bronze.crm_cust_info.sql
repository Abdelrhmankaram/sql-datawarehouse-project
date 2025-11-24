TRUNCATE TABLE bronze.crm_cust_info;
GO

BULK INSERT bronze.crm_cust_info
FROM 'D:\sql-datawarehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);