-- How much is the average order value per customer ?
SELECT      
       soh.[CustomerID]   
	  ,AVG(soh.TotalDue) AS Avg_order_value
	  ,CONCAT(pp.FirstName, ' ',pp.LastName) AS FullName
 
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] AS soh
	LEFT JOIN AdventureWorks2019.Sales.Customer AS sc
		ON  sc.CustomerID = soh.CustomerID
	LEFT JOIN AdventureWorks2019.Person.Person AS pp
		ON pp.BusinessEntityID = sc.PersonID

GROUP BY soh.[CustomerID], pp.FirstName, pp.LastName
ORDER BY Avg_order_value DESC;
