CREATE or ALTER PROCEDURE bronze.load_bronze AS
BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME;
	print 'Loading bronze';
	SET @start_time = GETDATE();

		-- crm_cust_info --
	print 'Truncating crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info;

	print 'Inserting crm_cust_info';
	BULK INSERT bronze.crm_cust_info
	FROM 'D:\sql-datawarehouse-project\datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

		-- crm_prd_info --
	print 'Truncating crm_prd_info';
	TRUNCATE TABLE bronze.crm_prd_info;

	print 'Inserting crm_prd_info';
	BULK INSERT bronze.crm_prd_info
	FROM 'D:\sql-datawarehouse-project\datasets\source_crm\prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

		-- crm_sales_details --
	print 'Truncating crm_sales_details';
	TRUNCATE TABLE bronze.crm_sales_details;

	print 'Inserting crm_sales_details';
	BULK INSERT bronze.crm_sales_details
	FROM 'D:\sql-datawarehouse-project\datasets\source_crm\sales_details.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

		-- erp_CUST_AZ12 --
	print 'Truncating erp_CUST_AZ12';
	TRUNCATE TABLE bronze.erp_CUST_AZ12;

	print 'Inserting erp_CUST_AZ12';
	BULK INSERT bronze.erp_CUST_AZ12
	FROM 'D:\sql-datawarehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

		-- erp_LOC_A101 --
	print 'Truncating erp_LOC_A101';
	TRUNCATE TABLE bronze.erp_LOC_A101;

	print 'Inserting erp_LOC_A101';
	BULK INSERT bronze.erp_LOC_A101
	FROM 'D:\sql-datawarehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

		-- erp_PX_CAT_G1V2 --
	print 'Truncating erp_PX_CAT_G1V2';
	TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

	print 'Inserting erp_PX_CAT_G1V2';
	BULK INSERT bronze.erp_PX_CAT_G1V2
	FROM 'D:\sql-datawarehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE();

	print 'Time elapsed: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
END	