-- First, we assign a number to the sequence of the Rate list
select BusinessEntityID,
       Rate,
	   ROW_NUMBER()OVER(ORDER BY Rate DESC) AS RowNum
from [AdventureWorks2019].[HumanResources].[EmployeePayHistory]

-- Then, we filter this subquery to get the second position

select BusinessEntityID,
       Rate
from (select BusinessEntityID,
       Rate,
	   ROW_NUMBER()OVER(ORDER BY Rate DESC) AS RowNum
from [AdventureWorks2019].[HumanResources].[EmployeePayHistory]) AS RankedRate
where RowNum = 2;
