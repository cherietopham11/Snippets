--YOU MUST CREATE A HOLIDAY TABLE FIRST 

/*

CREATE TABLE dbo.HolidayDimension
(
  TheDate date NOT NULL,
  HolidayText nvarchar(255) NOT NULL,
  CONSTRAINT FK_DateDimension FOREIGN KEY(TheDate) REFERENCES dbo.DateDimension(TheDate)
);

CREATE CLUSTERED INDEX CIX_HolidayDimension ON dbo.HolidayDimension(TheDate);
GO

*/

;WITH x AS 
(
  SELECT
    TheDate,
    TheFirstOfYear,
    TheDayOfWeekInMonth, 
    TheMonth, 
    TheDayName, 
    TheDay,
    TheLastDayOfWeekInMonth = ROW_NUMBER() OVER 
    (
      PARTITION BY TheFirstOfMonth, TheDayOfWeek
      ORDER BY TheDate DESC
    )
  FROM dbo.DateDimension
),
s AS
(
  SELECT TheDate, HolidayText = CASE
  WHEN (TheDate = TheFirstOfYear) 
    THEN 'New Year''s Day'
  WHEN (TheDayOfWeekInMonth = 3 AND TheMonth = 1 AND TheDayName = 'Monday')
    THEN 'Martin Luther King Day'    -- (3rd Monday in January)
  WHEN (TheDayOfWeekInMonth = 3 AND TheMonth = 2 AND TheDayName = 'Monday')
    THEN 'President''s Day'          -- (3rd Monday in February)
  WHEN (TheLastDayOfWeekInMonth = 1 AND TheMonth = 5 AND TheDayName = 'Monday')
    THEN 'Memorial Day'              -- (last Monday in May)
  WHEN (TheMonth = 7 AND TheDay = 4)
    THEN 'Independence Day'          -- (July 4th)
  WHEN (TheDayOfWeekInMonth = 1 AND TheMonth = 9 AND TheDayName = 'Monday')
    THEN 'Labour Day'                -- (first Monday in September)
  WHEN (TheDayOfWeekInMonth = 2 AND TheMonth = 10 AND TheDayName = 'Monday')
    THEN 'Columbus Day'              -- Columbus Day (second Monday in October)
  WHEN (TheMonth = 11 AND TheDay = 11)
    THEN 'Veterans'' Day'            -- (November 11th)
  WHEN (TheDayOfWeekInMonth = 4 AND TheMonth = 11 AND TheDayName = 'Thursday')
    THEN 'Thanksgiving Day'          -- (Thanksgiving Day ()fourth Thursday in November)
  WHEN (TheMonth = 12 AND TheDay = 25)
    THEN 'Christmas Day'
  END
  FROM x
  WHERE 
    (TheDate = TheFirstOfYear)
    OR (TheDayOfWeekInMonth = 3     AND TheMonth = 1  AND TheDayName = 'Monday')
    OR (TheDayOfWeekInMonth = 3     AND TheMonth = 2  AND TheDayName = 'Monday')
    OR (TheLastDayOfWeekInMonth = 1 AND TheMonth = 5  AND TheDayName = 'Monday')
    OR (TheMonth = 7 AND TheDay = 4)
    OR (TheDayOfWeekInMonth = 1     AND TheMonth = 9  AND TheDayName = 'Monday')
    OR (TheDayOfWeekInMonth = 2     AND TheMonth = 10 AND TheDayName = 'Monday')
    OR (TheMonth = 11 AND TheDay = 11)
    OR (TheDayOfWeekInMonth = 4     AND TheMonth = 11 AND TheDayName = 'Thursday')
    OR (TheMonth = 12 AND TheDay = 25)
)
INSERT dbo.HolidayDimension(TheDate, HolidayText)
SELECT TheDate, HolidayText FROM s 
UNION ALL 
SELECT DATEADD(DAY, 1, TheDate), 'Black Friday'
  FROM s WHERE HolidayText = 'Thanksgiving Day'
ORDER BY TheDate;

SELECT * FROM dbo.holidayDimension