USE AdventureWorksDW2019
GO

CREATE VIEW Report_InternetSales
AS
SELECT dbo.FactInternetSales.CurrencyKey,
dbo.FactInternetSales.OrderQuantity,
dbo.FactInternetSales.SalesAmount,
dbo.FactInternetSales.TaxAmt,
dbo.FactInternetSales.TotalProductCost,
dbo.DimCustomer.FirstName,
dbo.DimCustomer.MiddleName,
dbo.DimCustomer.LastName,
dbo.DimProduct.EnglishProductName,
dbo.DimProduct.ProductKey,
dbo.DimGeography.City,
dbo.DimGeography.StateProvinceName,
dbo.DimGeography.GeographyKey,
dbo.DimCustomer.CustomerKey

FROM dbo.DimGeography INNER JOIN
dbo.DimCustomer ON dbo.DimGeography.GeographyKey = dbo.DimCustomer.GeographyKey INNER JOIN
dbo.FactInternetSales ON dbo.DimCustomer.CustomerKey = dbo.FactInternetSales.CustomerKey INNER JOIN
dbo.DimProduct ON dbo.FactInternetSales.ProductKey = dbo.DimProduct.ProductKey

WHERE dbo.FactInternetSales.CurrencyKey = 100