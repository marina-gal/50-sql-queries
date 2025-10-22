-- Retrieve the second highest Rate from the Employee table
select MAX(Rate) as SecondHighestRate
from [AdventureWorks2019].[HumanResources].[EmployeePayHistory]
where Rate < (select MAX(Rate*40*52)
			  from [AdventureWorks2019].[HumanResources].[EmployeePayHistory]);

-- To calculate the second highest annual salary based on aproximately 40 hours of work per week and 52 weeks.
select MAX(Rate*40*52) as SecondHighestAnnualSalary
from [AdventureWorks2019].[HumanResources].[EmployeePayHistory]
where Rate*40*52 < (
					select MAX(Rate*40*52)
					from [AdventureWorks2019].[HumanResources].[EmployeePayHistory])
