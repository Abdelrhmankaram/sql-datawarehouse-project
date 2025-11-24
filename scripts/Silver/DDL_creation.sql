    -- crm_cust_info --
IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_cust_info

create table silver.crm_cust_info (
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATETIME,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

    -- crm_prd_info --
IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_info
create table silver.crm_prd_info (
    prd_id INT,
    cat_id VARCHAR(50),
    prd_key VARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

    -- crm_sales_details --
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details
        
create table silver.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

    -- erp_CUST_AZ12 --
IF OBJECT_ID('silver.erp_CUST_AZ12', 'U') IS NOT NULL
    DROP TABLE silver.erp_CUST_AZ12
        
create table silver.erp_CUST_AZ12 (
    CID VARCHAR(50),
    BDATE DATE,
    GEN NVARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

    -- erp_LOC_A101 --
IF OBJECT_ID('silver.erp_LOC_A101', 'U') IS NOT NULL
    DROP TABLE silver.erp_LOC_A101

create table silver.erp_LOC_A101 (
    CID VARCHAR(50),
    CNTRY VARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

    -- erp_PX_CAT_G1V --
IF OBJECT_ID('silver.erp_PX_CAT_G1V2', 'U') IS NOT NULL
    DROP TABLE silver.erp_PX_CAT_G1V2
        
create table silver.erp_PX_CAT_G1V2 (
    ID VARCHAR(50),
    CAT VARCHAR(50),
    SUBCAT VARCHAR(50),
    MAINTENANCE VARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);