create or alter procedure silver.load_silver
AS
BEGIN
    -- crm_cust_info --
    truncate table silver.crm_cust_info;
    insert into silver.crm_cust_info
        (
        cst_id,
        cst_key,
        cst_firstname,
        cst_lastname,
        cst_marital_status,
        cst_gndr,
        cst_create_date
        )
    select
        cst_id,
        cst_key,
        TRIM(cst_firstname) as cst_firstname,

        TRIM(cst_lastname) as cst_lastname,

        case when UPPER(cst_marital_status) = 'S' then 'Single'
        when UPPER(cst_marital_status) = 'M' then 'Married'
        else 'n/a'
    end cst_marital_status,

        case when UPPER(cst_gndr) = 'F' then 'Female'
        when UPPER(cst_gndr) = 'M' then 'Male'
        else 'n/a'
    end cst_gndr,

        cst_create_date
    from (
    select *,
            ROW_NUMBER() over (partition by cst_id order by cst_create_date desc) as flag_last
        from bronze.crm_cust_info
        where cst_id is not null
    )t
    where flag_last = 1

    -- crm_prd_info --
    truncate table silver.crm_prd_info;
    insert into silver.crm_prd_info
        (
        prd_id,
        cat_id,
        prd_key,
        prd_nm,
        prd_cost,
        prd_line,
        prd_start_dt,
        prd_end_dt)
    select
        prd_id,
        replace(substring(prd_key, 1, 5), '-', '_') AS cat_id,
        substring(prd_key, 7, len(prd_key)) as prd_key,
        prd_nm,
        ISNULL(prd_cost, 0) as prd_cost,

        case UPPER(TRIM(prd_line))
        when 'M' then 'Mountain'
        when 'R' then 'Road'
        when 'S' then 'Mountain'
        when 'T' then 'Touring'
        else 'n/a'
    end as prd_line,

        prd_start_dt,
        DATEADD(day, -1, LEAD(prd_start_dt) over (partition by prd_key order by prd_start_dt)) as prd_end_dt
    from bronze.crm_prd_info

    -- crm_sales_details --
    truncate table silver.crm_sales_details;
    insert into silver.crm_sales_details
        (
        sls_ord_num,
        sls_prd_key,
        sls_cust_id,
        sls_order_dt,
        sls_ship_dt,
        sls_due_dt,
        sls_sales,
        sls_quantity,
        sls_price)
    SELECT sls_ord_num,
        sls_prd_key,
        sls_cust_id,

        Case when sls_order_dt = 0 or len(sls_order_dt) != 8 then NULL
            else cast(cast(sls_order_dt as varchar) as date)
            end as sls_order_dt,

        Case when sls_ship_dt = 0 or len(sls_ship_dt) != 8 then NULL
            else cast(cast(sls_ship_dt as varchar) as date)
            end as sls_ship_dt,

        Case when sls_due_dt = 0 or len(sls_due_dt) != 8 then NULL
            else cast(cast(sls_due_dt as varchar) as date)
            end as sls_due_dt,

        case when sls_sales is null or sls_sales <= 0 or sls_sales != sls_quantity * ABS(sls_price)
                    then sls_quantity * ABS(sls_price)
            else sls_sales
            end as sls_sales,

        sls_quantity,

        case when sls_price is null or sls_price <= 0
                    then sls_quantity / NULLIF(sls_quantity, 0)
                    else sls_price
            end as sls_price

    FROM bronze.crm_sales_details

    -- erp_cust_az12 --
    truncate table silver.erp_cust_az12
    insert into silver.erp_cust_az12
        (cid, bdate, gen)
    select
        case 
            when CID like 'NAS%' then SUBSTRING(cid, 4, len(cid))
            else CID
        end,

        case
            when BDATE > getdate() then null
            else BDATE
        end,

        case
            when UPPER(GEN) = 'M' then 'Male'
            when upper(GEN) = 'F' then 'Female'
            when GEN = null or TRIM(GEN) = '' then 'n/a'
            else GEN
        end
    from bronze.erp_CUST_AZ12

    -- erp_loc_a101 --
    truncate table silver.erp_loc_a101
    insert into silver.erp_loc_a101
        (cid, cntry)
    select
        REPLACE(cid, '-', '') as cid,
        case 
            when trim(cntry) = 'DE' then 'Germany'
            when trim(cntry) in('USA', 'United States') then 'United States of America'
            when trim(cntry) in(NULL, '') then 'n/a'
            else trim(cntry)
        end as cntry
    from bronze.erp_loc_a101;

    -- erp_PX_CAT_G1V2 --
    truncate table silver.erp_PX_CAT_G1V2
    insert into silver.erp_PX_CAT_G1V2
        (id, cat, subcat, maintenance)
    select
        ID,
        CAT,
        SUBCAT,
        MAINTENANCE
    from bronze.erp_PX_CAT_G1V2
END