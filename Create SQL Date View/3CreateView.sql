CREATE VIEW dbo.TheCalendar
AS 
  SELECT
    d.TheDate,
    d.TheDay,
    d.TheDaySuffix,
    d.TheDayName,
    d.TheDayOfWeek,
    d.TheDayOfWeekInMonth,
    d.TheDayOfYear,
    d.IsWeekend,
    d.TheWeek,
    d.TheISOweek,
    d.TheFirstOfWeek,
    d.TheLastOfWeek,
    d.TheWeekOfMonth,
    d.TheMonth,
    d.TheMonthName,
    d.TheFirstOfMonth,
    d.TheLastOfMonth,
    d.TheFirstOfNextMonth,
    d.TheLastOfNextMonth,
    d.TheQuarter,
    d.TheFirstOfQuarter,
    d.TheLastOfQuarter,
    d.TheYear,
    d.TheISOYear,
    d.TheFirstOfYear,
    d.TheLastOfYear,
    d.IsLeapYear,
    d.Has53Weeks,
    d.Has53ISOWeeks,
    d.MMYYYY,
    d.Style101,
    d.Style103,
    d.Style112,
    d.Style120,
    IsHoliday = CASE WHEN h.TheDate IS NOT NULL THEN 1 ELSE 0 END,
    h.HolidayText
  FROM dbo.DateDimension AS d
  LEFT OUTER JOIN dbo.HolidayDimension AS h
  ON d.TheDate = h.TheDate;