/*
GOOD PRACTICE TO TRUNCATE TABLE BEFORE DROPPING SO YOU KNOW IT IS NOT REFERENCED
*/

USE FinanceDB

SELECT * FROM Products

DROP TABLE Products
GO