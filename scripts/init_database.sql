/*
===================================================================================
Script Name:    Create_DataWarehouse.sql
Description:    This script is designed to create a new SQL Server database named 
                'DataWarehouse' along with three schemas: bronze, silver, and gold.

                If a database named 'DataWarehouse' already exists, it will be 
                forcefully dropped after setting it to SINGLE_USER mode with 
                immediate rollback of all active connections.

                After dropping, a new 'DataWarehouse' database will be created 
                from scratch with the mentioned schemas.

Schemas Created:
                1. bronze - Typically used for raw and unprocessed data
                2. silver - For cleaned and transformed data
                3. gold   - For curated and analytics-ready data

!!! WARNING !!!
===================================================================================
Running this script will **permanently delete** the existing 'DataWarehouse' 
database and all of its data. Ensure you have taken a full backup if needed.

This operation is irreversible once executed.
===================================================================================
*/

-- Switch to the master database context
USE master;
GO

-- Check if the 'DataWarehouse' database exists
IF EXISTS (
	SELECT 1
	FROM sys.databases
	WHERE name = 'DataWarehouse'
)
BEGIN
	-- Forcefully set to SINGLE_USER mode and drop the database
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the new 'DataWarehouse' database
CREATE DATABASE DataWarehouse; 
GO

-- Switch context to the newly created database
USE DataWarehouse;
GO

-- Create the required schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
