TRUNCATE TABLE bronze.erp_CUST_AZ12;
GO

BULK INSERT bronze.erp_CUST_AZ12
FROM 'D:\sql-datawarehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);