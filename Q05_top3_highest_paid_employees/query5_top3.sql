select top 3
		eph.BusinessEntityID,
		eph.Rate,
		pp.FirstName,
		pp.LastName
		
from AdventureWorks2019.HumanResources.EmployeePayHistory as eph
left join AdventureWorks2019.Person.Person as pp on pp.BusinessEntityID = eph.BusinessEntityID
order by Rate desc
