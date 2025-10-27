-- Number of orders per customer

select 
 soh.CustomerID
,CONCAT (p.FirstName, ' ', p.LastName) as FullName
,COUNT(soh.SalesOrderID) as nb_orders_per_customer

from [AdventureWorks2019].[Sales].[SalesOrderHeader] as soh
	left join [AdventureWorks2019].[Sales].[Customer] as c
		on c.CustomerID = soh.CustomerID
	left join [AdventureWorks2019].[Person].[Person] as p
		on p.BusinessEntityID = c.PersonID
	
group by soh.CustomerID, p.FirstName, p.LastName
order by nb_orders_per_customer DESC
