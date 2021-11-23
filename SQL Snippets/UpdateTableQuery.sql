USE FinanceDB

--SELECT * FROM Products

UPDATE dbo.Products
	SET ProductName = 'Flat Head Screwdriver'
	WHERE ProductID = 2
GO
