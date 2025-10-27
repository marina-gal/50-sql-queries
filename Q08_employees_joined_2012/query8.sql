-- Employees who joined in 2012? (The maximum date in this DB is 2013)
SELECT
	   CONCAT(pp.FirstName, ' ', pp.LastName) AS FullName
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[HireDate]
FROM [AdventureWorks2019].[HumanResources].[Employee] AS e
	LEFT JOIN AdventureWorks2019.Person.Person AS pp
		ON pp.BusinessEntityID = e.BusinessEntityID
WHERE HireDate LIKE '%2012%'
ORDER BY HireDate DESC;
