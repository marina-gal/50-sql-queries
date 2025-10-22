-- Find the total revenue per product
select pp.ProductID,
       pp.Name as ProductName, 
	   SUM(sod.OrderQty*sod.UnitPrice*(1-sod.UnitPriceDiscount)) as Total_Revenue
          
from [AdventureWorks2019].[Sales].[SalesOrderDetail] as sod
	LEFT JOIN AdventureWorks2019.Production.Product as pp
			on pp.ProductID = sod.ProductID
group by pp.ProductID, pp.Name 
order by Total_Revenue desc
