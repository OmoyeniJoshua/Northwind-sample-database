
SELECT * 
FROM Customers

SELECT CompanyName,City
FROM Customers

SELECT Country
FROM Customers

SELECT DISTINCT Country
FROM Customers

SELECT COUNT(DISTINCT Country)
FROM Customers

SELECT * FROM Customers
WHERE Country = 'USA'


SELECT * FROM  Customers

SELECT * FROM Customers
WHERE PostalCode = '97403'

SELECT * FROM Customers
WHERE ContactTitle = 'Owner'

SELECT * FROM Customers
WHERE Country = 'Canada'

SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

SELECT * FROM Customers

SELECT * FROM Customers
WHERE Country = 'Brazil' AND City = 'Rio de Janeiro'

SELECT * FROM Customers
WHERE Country = 'Brazil' OR Country = 'Spain'

SELECT * FROM Customers
WHERE NOT Country = 'Brazil'

SELECT * FROM Customers
WHERE Country = 'UK'

SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Munchen')

SELECT * FROM Customers
WHERE NOT  Country = 'Germany' AND NOT Country = 'UK'

SELECT * FROM Customers
WHERE Country = 'Berlin' AND PostalCode = '12209'

SELECT * FROM Customers
ORDER BY Country

SELECT * FROM Customers
ORDER BY Country DESC

SELECT * FROM Customers
ORDER BY Country, ContactName

SELECT * FROM Customers
ORDER BY Country, ContactName DESC

SELECT * FROM Customers
ORDER BY City

INSERT INTO Customers (CompanyName, ContactName, City, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Stavanger', 'Norway')

SELECT CompanyName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL


UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 'ALFKI'

SELECT * FROM Customers

UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico'

DELETE FROM Customers WHERE CompanyName='Alfreds Futterkiste'

SELECT TOP 3 * FROM Customers

SELECT TOP 50 PERCENT * FROM Customers

SELECT TOP 3 * FROM Customers
WHERE Country='Germany'

SELECT * FROM Products

SELECT MIN(UnitPrice) AS MinPrice FROM Products

SELECT MAX(UnitPrice) AS MaxPrice FROM Products

SELECT COUNT(ProductId) FROM Products

SELECT AVG(UnitPrice) FROM Products

SELECT * FROM [Order Details]

SELECT SUM(Quantity) FROM [Order Details]

SELECT * FROM Customers
WHERE ContactName LIKE '%r%'

SELECT * FROM Customers
WHERE ContactName NOT LIKE 'a%'

SELECT * FROM Customers
WHERE City LIKE '%es%'

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'France' OR Country = 'UK'

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK')

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK')

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers)

SELECT * FROM Customers
WHERE Region IS NULL

SELECT * FROM Products
WHERE UnitPrice BETWEEN 10 AND 20

SELECT * FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 20

SELECT * FROM Products
WHERE UnitPrice BETWEEN 10 AND 20
AND ProductID NOT IN (1,2,3)

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarrella di Giovanni'
ORDER BY ProductName

SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarrella di Giovanni'
ORDER BY ProductName	

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-04' AND '1996-08-01'

SELECT * FROM Customers

SELECT CustomerId AS ID ,ContactName as Name, CompanyName AS Company
FROM Customers

SELECT ContactName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers

SELECT * FROM Orders
SELECT * FROM Customers

SELECT o.OrderID, o.OrderDate, c.CompanyName
FROM Customers AS c, Orders AS o
WHERE c.CompanyName='Around the Horn' AND c.CustomerID=o.CustomerID

SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName
FROM Customers, Orders
WHERE Customers.CompanyName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID


SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate FROM Orders
INNER JOIN Customers 
ON Orders.CustomerID=Customers.CustomerID


SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Orders INNER JOIN Customers 
	ON Orders.CustomerID=Customers.CustomerID

SELECT * FROM Shippers
SELECT * FROM Customers
SELECT * FROM Orders

SELECT * FROM Orders
SELECT * FROM Customers

SELECT Orders.OrderID, Customers.CompanyName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID

SELECT Customers.CompanyName, orders.OrderID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID

SELECT Orders.OrderID,Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID

SELECT A.CompanyName AS CustomerName1, B.CompanyName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID AND A.City = B.City
ORDER BY A.City

SELECT City FROM Customers
UNION 
SELECT City FROM Suppliers
ORDER BY City

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers

SELECT * FROM Customers

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY Count(CustomerId) DESC

SELECT * FROM Orders
SELECT * FROM Shippers

SELECT Shippers.CompanyName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerId) DESC

SELECT * FROM Orders
SELECT * FROM Employees

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25

SELECT * FROM Products
SELECT * FROM Suppliers

SELECT CompanyName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND UnitPrice < 20)

SELECT * FROM Products
SELECT * FROM [Order Details]

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM [Order Details]
  WHERE Quantity = '10')

SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM [Order Details]
  WHERE Quantity > '1000')

SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM [Order Details]
  WHERE Quantity = 10)

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM [Order Details]

SELECT CompanyName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END)

SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder)
FROM Products

SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
FROM Products

SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO

EXEC SelectAllCustomers

--Select all:
SELECT * FROM Customers

/*Select all the columns
of all the records
in the Customers table:*/
SELECT * FROM Customers

SELECT 20*20































