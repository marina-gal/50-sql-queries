-- Which is the latest order placed from each customer?
SELECT 
	   c.[CustomerID]
	  ,soh.[SalesOrderID]
	  ,soh.[OrderDate]
      ,soh.[TotalDue] AS OrderTotal
	  ,CONCAT(p.FirstName, p.LastName) AS FullName

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] AS soh
LEFT JOIN AdventureWorks2019.Sales.Customer AS c
	ON soh.CustomerID = c.CustomerID
LEFT JOIN AdventureWorks2019.Person.Person AS p
	ON c.PersonID = p.BusinessEntityID

WHERE soh.OrderDate = (
			SELECT MAX(soh2.OrderDate)
			FROM AdventureWorks2019.Sales.SalesOrderHeader AS soh2
			WHERE soh2.CustomerID = soh.CustomerID
		)
ORDER BY OrderDate DESC;
