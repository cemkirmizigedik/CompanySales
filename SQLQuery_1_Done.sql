SELECT e.EmployeeID
	,YEAR(o.OrderDate) as [Year]
	,e.FirstName
	,e.LastName
	,e.FirstName + e.LastName AS FullName
	,od.ProductID
	,p.ProductName
	,SUM(od.Quantity * od.UnitPrice) AS Total_Sales
FROM Employees AS e
INNER JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] AS od ON o.OrderID = od.OrderID
INNER JOIN Products AS p ON od.ProductID = p.ProductID
GROUP BY e.EmployeeID
	,e.FirstName
	,e.LastName
	,YEAR(o.OrderDate)
	,od.ProductID
	,p.ProductName
ORDER BY e.EmployeeID,YEAR(o.OrderDate) DESC
