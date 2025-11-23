TRUNCATE TABLE bronze.crm_sales_details;
GO

BULK INSERT bronze.crm_sales_details
FROM 'D:\sql-datawarehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);