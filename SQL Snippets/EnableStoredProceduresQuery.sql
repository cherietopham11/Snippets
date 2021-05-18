USE [AdventureWorksDW2019]
GO

sp_changedbowner 'sa'

EXEC sys.sp_cdc_enable_db
GO

--This script enables stored procedures for the AdventureWorksDW2019 database on the DimAccount Table

EXEC sys.sp_cdc_enable_table
@source_schema = 'dbo',
@source_name = 'DimAccount',
@role_name = 'MyRole',
@filegroup_name = 'Primary',
@supports_net_changes = 1
GO

--SELECT * FROM cdc.dbo_DimAccount_CT