-- Пример. Получил данные о товарах и их поставщиках
SELECT *
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID


-- **Задача. Вывести информацию о товарах:**
-- - название_товара
-- - стоимость_товара
-- - название_категории
-- - описание_категории
SELECT
		Products.ProductName,
    Products.Price,
    Categories.CategoryName,
    Categories.Description
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID

-- Применить скидку в 7.5% к стоимости товара
Products.Price * (1-.075) AS Price_discount,

-- Задача. Вывести самый дорогой товар из категории Beverages
SELECT *
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE Categories.CategoryName='Beverages'
ORDER BY Price DESC
LIMIT 1


-- Задача. Вывести все заказы клиента 10, которые повезет Speedy Express
SELECT *
FROM Orders
JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
WHERE
		Orders.CustomerID=10
    AND
    Shippers.ShipperName='Speedy Express'


-- **Задача. Вывести заказы клиентов из `USA`, `Germany`, `UK`**

-- - полное_имя_клиента
-- - страна_клиента
-- - полное_имя_менеджера
SELECT 
	Customers.CustomerName,
    Customers.Country,
    Employees.LastName,
    Employees.FirstName
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
WHERE Customers.Country IN ('USA', 'Germany', 'UK')


-- Задача. Вывести два самых дорогих напитка из UK
SELECT * 
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE
		Categories.CategoryName='Beverages'
		AND
    Suppliers.Country='UK'

ORDER BY Price DESC
LIMIT 2


-- Задача. Вывести страны-поставщики напитков
SELECT * 
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE
		Categories.CategoryName='Beverages'
		AND
    Suppliers.Country='UK'

ORDER BY Price DESC
LIMIT 2
