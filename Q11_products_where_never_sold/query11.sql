-- Products that where never sold
SELECT p.[ProductID]
      ,p.[Name]
      ,p.[ProductNumber]
      ,p.[ListPrice]
      
FROM [AdventureWorks2019].[Production].[Product] AS p
LEFT JOIN AdventureWorks2019.Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID

WHERE sod.ProductID IS NULL 
ORDER BY p.ProductID;
