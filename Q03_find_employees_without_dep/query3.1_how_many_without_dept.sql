select COUNT(edh.DepartmentID) as EmployeeWithoutDept
	   
from AdventureWorks2019.HumanResources.Employee as e
		LEFT JOIN AdventureWorks2019.HumanResources.EmployeeDepartmentHistory as edh
				on e.BusinessEntityID = edh.BusinessEntityID
		LEFT JOIN AdventureWorks2019.Person.Person as pp
				on pp.BusinessEntityID = e.BusinessEntityID

where edh.DepartmentID IS NULL
