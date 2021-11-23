USE FinanceDB
GO

CREATE TABLE dbo.Products
	(ProductID INT PRIMARY KEY NOT NULL,
	ProductName VARCHAR(25) NOT NULL,
	Price MONEY NULL,
	ProductDescription VARCHAR(MAX) NULL)

GO