select FirstName, LastName, COUNT(*) as num_of_people_with_same_full_name
from AdventureWorks2019.Person.Person
group by FirstName, LastName
	having COUNT(*) > 1
order by num_of_people_with_same_full_name desc
