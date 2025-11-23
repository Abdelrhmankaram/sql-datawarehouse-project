TRUNCATE TABLE bronze.erp_LOC_A101;
GO

BULK INSERT bronze.erp_LOC_A101
FROM 'D:\sql-datawarehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);