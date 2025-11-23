CREATE OR ALTER PROCEDURE bronze.create_bronze AS
BEGIN
        -- crm_cust_info --
    IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
        DROP TABLE bronze.crm_cust_info

    create table bronze.crm_cust_info (
        cst_id INT,
        cst_key NVARCHAR(50),
        cst_firstname NVARCHAR(50),
        cst_lastname NVARCHAR(50),
        cst_marital_status NVARCHAR(1),
        cst_gndr NVARCHAR(1),
        cst_create_date DATE
    );

        -- crm_prd_info --
    IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
        DROP TABLE bronze.crm_prd_info
    create table bronze.crm_prd_info (
        prd_id INT,
        prd_key VARCHAR(50),
        prd_nm NVARCHAR(50),
        prd_cost INT,
        prd_line NVARCHAR(50),
        prd_start_dt DATE,
        prd_end_dt DATE
    );

        -- crm_sales_details --
    IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
        DROP TABLE bronze.crm_sales_details
        
    create table bronze.crm_sales_details (
        sls_ord_num VARCHAR(50),
        sls_prd_key VARCHAR(50),
        sls_cust_id INT,
        sls_order_dt INT,
        sls_ship_dt INT,
        sls_due_dt INT,
        sls_sales INT,
        sls_quantity INT,
        sls_price INT
    );

        -- erp_CUST_AZ12 --
    IF OBJECT_ID('bronze.erp_CUST_AZ12', 'U') IS NOT NULL
        DROP TABLE bronze.erp_CUST_AZ12
        
    create table bronze.erp_CUST_AZ12 (
        CID VARCHAR(50),
        BDATE DATE,
        GEN NVARCHAR(50)
    );

        -- erp_LOC_A101 --
    IF OBJECT_ID('bronze.erp_LOC_A101', 'U') IS NOT NULL
        DROP TABLE bronze.erp_LOC_A101

    create table bronze.erp_LOC_A101 (
        CID VARCHAR(50),
        CNTRY VARCHAR(50)
    );

        -- erp_PX_CAT_G1V --
    IF OBJECT_ID('bronze.erp_PX_CAT_G1V', 'U') IS NOT NULL
        DROP TABLE bronze.erp_PX_CAT_G1V
        
    create table bronze.erp_PX_CAT_G1V2 (
        ID VARCHAR(50),
        CAT VARCHAR(50),
        SUBCAT VARCHAR(50),
        MAINTENANCE VARCHAR(50)
    );
END