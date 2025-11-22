IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info
create table bronze.crm_cust_info (
	cst_id INT,
	cst_key VARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(1),
	cst_gndr NVARCHAR(1),
	cst_create_date DATE
);