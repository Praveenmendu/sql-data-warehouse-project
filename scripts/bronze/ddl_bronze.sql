/*
===================================================================================
Script Name:    Create_Bronze_Tables.sql
Description:    This script is designed to create foundational data tables under 
                the 'bronze' schema within the 'DataWarehouse' database.

                The 'bronze' layer typically stores raw, unprocessed data ingested 
                directly from various source systems (CRM, ERP, etc.). These tables 
                act as the first landing zone in a modern data architecture pipeline.

                Prior to creating each table, the script checks for its existence 
                using OBJECT_ID and drops it if found. This ensures a clean slate 
                before re-creation, which is useful during development or testing.

Tables Created:
                1. bronze.crm_cust_info       - Raw customer information from CRM
                2. bronze.crm_prd_info        - Product details from CRM
                3. bronze.crm_sales_details   - Sales transactions and metrics
                4. bronze.erp_cust_az12       - ERP system customer demographic info
                5. bronze.erp_loc_a101        - ERP customer location data
                6. bronze.erp_px_cat_g1v2     - Product category and maintenance info

!!! WARNING !!!
===================================================================================
Running this script will DROP and RECREATE all specified 'bronze' tables. 
All existing data in these tables will be lost.

Make sure to back up any important data before executing this script.
===================================================================================
*/

-- Creates or recreates the crm_cust_info table
IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
	cst_id			INT,
	cst_key			NVARCHAR(50),
	cst_firstname		NVARCHAR(50),
	cst_lastname		NVARCHAR(50),
	cst_marital_status	NVARCHAR(50),
	cst_gndr		NVARCHAR(50),
	cst_create_date		DATE
);

-- Creates or recreates the crm_prd_info table
IF OBJECT_ID ('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
	prd_id			INT,
	prd_key			NVARCHAR(50),
	prd_nm			NVARCHAR(50),
	prd_cost		INT,
	prd_line		NVARCHAR(50),
	prd_start_dt		DATETIME,
	prd_end_dt		DATETIME
);

-- Creates or recreates the crm_sales_details table
IF OBJECT_ID ('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
	sls_ord_num		NVARCHAR(50),
	sls_prd_key		NVARCHAR(50),
	sls_cust_id		INT,
	sls_order_dt		INT,
	sls_ship_dt		INT,
	sls_due_dt		INT,
	sls_sales		INT,
	sls_quantity		INT,
	sls_price		INT
);

-- Creates or recreates the erp_cust_az12 table
IF OBJECT_ID ('bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
	cid			NVARCHAR(50),
	bdate			DATE,
	gen			NVARCHAR(50)
);

-- Creates or recreates the erp_loc_a101 table
IF OBJECT_ID ('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
	cid			NVARCHAR(50),
	cntry			NVARCHAR(50)
);

-- Creates or recreates the erp_px_cat_g1v2 table
IF OBJECT_ID ('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
	id			NVARCHAR(50),
	cat			NVARCHAR(50),
	sudcat			NVARCHAR(50),
	maintenance		NVARCHAR(50)
);
