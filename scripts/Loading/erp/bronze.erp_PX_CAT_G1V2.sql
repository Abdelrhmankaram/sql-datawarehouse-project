TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
GO

BULK INSERT bronze.erp_PX_CAT_G1V2
FROM 'D:\sql-datawarehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);