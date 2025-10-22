-- First we make a ranking over the Rate descending list
select BusinessEntityID,
       Rate,
	   DENSE_RANK() OVER (ORDER BY Rate DESC) AS RankBySalary
from [AdventureWorks2019].[HumanResources].[EmployeePayHistory]

-- And then, we just filter the result of the subquery in the Ranking position 2
select BusinessEntityID, Rate
from (
select BusinessEntityID,
       Rate,
	   DENSE_RANK() OVER (ORDER BY Rate DESC) AS RankBySalary
from [AdventureWorks2019].[HumanResources].[EmployeePayHistory]) AS Ranked
where RankBySalary = 2;
