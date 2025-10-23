--Find duplicates email addresses
SELECT EmailAddress, COUNT(*) AS Num_EmailAddress
FROM [AdventureWorksDW2020].[dbo].[DimCustomer]
GROUP BY  EmailAddress
HAVING COUNT(*) >1
ORDER BY Num_EmailAddress DESC;
