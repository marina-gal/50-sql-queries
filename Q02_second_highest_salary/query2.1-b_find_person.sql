select *
from(
	select 
	   eph.[BusinessEntityID]
      ,eph.[Rate] as HourlyRate
      ,eph.Rate*40*52 as EstimatedAnnualSalary
	  ,pp.FirstName
	  ,pp.LastName
	  ,hre.JobTitle
	  ,hre.OrganizationLevel
	  ,hredh.DepartmentID
	  ,hrd.Name as DepartementName
	  ,DENSE_RANK()OVER(ORDER BY eph.[Rate]*40*52 DESC) AS SalaryRank


from [HumanResources].[EmployeePayHistory] as eph
	LEFT JOIN [Person].[Person] as pp 
				on pp.[BusinessEntityID] = eph.BusinessEntityID
	LEFT JOIN [HumanResources].[Employee] as hre
			    on hre.BusinessEntityID = eph.BusinessEntityID
    LEFT JOIN [HumanResources].[EmployeeDepartmentHistory] as hredh
		        on hredh.BusinessEntityID = eph.BusinessEntityID
    LEFT JOIN [HumanResources].[Department] as hrd
	            on hrd.DepartmentID = hredh.DepartmentID
) as Ranked
where SalaryRank = 2;
