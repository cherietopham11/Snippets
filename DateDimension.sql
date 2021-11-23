WITH TimeCTE ([Time]) AS
	(SELECT CAST('20190101 00:00:00' AS DATETIME)			
	UNION ALL
	SELECT DATEADD(DAY, 1, [Time])
	--SELECT DATEADD(HOUR,1 [Time])
	FROM TimeCTE
	WHERE [Time] < CAST('20251231 23:50:00' AS DATETIME)
	)
SELECT 
[Time]
--,DATEPART(HOUR, Time) AS Hour
,CONVERT(date, Time) AS DATE
--,DATEPART(MINUTE, Time) AS Minutes
,DATEPART(YEAR, Time) as Year
,DATENAME(MONTH, Time) as MonthName
,DATEPART(MONTH, Time) as MonthNumber 
,DATEPART(WEEK, Time) as WeekNumber
,DATEPART(WEEKDAY, Time) as WeekDay
INTO TimeTable -- Creates new DB Table
FROM TimeCTE 
OPTION(MAXRECURSION 0)

GO