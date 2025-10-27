-- Returning all vendors who supplied products BUT none of whose orders contained rejected products.

select distinct
		 v.BusinessEntityID as VendorID
		,v.Name as VendorName
		,pod.RejectedQty

from AdventureWorks2019.Purchasing.Vendor as v
	left join AdventureWorks2019.Purchasing.PurchaseOrderHeader as poh
		on poh.VendorID = v.BusinessEntityID
	left join AdventureWorks2019.Purchasing.PurchaseOrderDetail as pod
		on pod.PurchaseOrderID = poh.PurchaseOrderID
	AND pod.RejectedQty > 0
where pod.PurchaseOrderDetailID IS NULL
