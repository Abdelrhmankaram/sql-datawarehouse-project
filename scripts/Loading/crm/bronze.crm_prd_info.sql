TRUNCATE TABLE bronze.crm_prd_info;
GO

BULK INSERT bronze.crm_prd_info
FROM 'D:\sql-datawarehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);