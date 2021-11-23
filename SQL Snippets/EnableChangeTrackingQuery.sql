--USE [AdventureWorksDW2019]

--ALTER DATABASE AdventureWorksDW2019
--SET CHANGE_TRACKING = ON
--(CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON);

--ALTER TABLE [dbo].[DimAccount]
--ENABLE CHANGE_TRACKING 
--WITH (TRACK_COLUMNS_UPDATED = ON);

USE [AdventureWorksDW2019]

SELECT * 
--Function that generates a table on the fly when script is run
FROM CHANGETABLE(CHANGES [dbo].[DimAccount], 0) AS T
