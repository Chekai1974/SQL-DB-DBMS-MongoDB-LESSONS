-- SQL: Update
-- Пример. Модификация профиля клиента
UPDATE Customers
SET PostalCode='0000000'
WHERE CustomerID=1

-- Задача. У всех пользователей не из UK очистить контактное имя
UPDATE Customers
SET ContactName=''
WHERE NOT Country='UK'


-- Задача. У всех товаров от 50 до 60 (EUR) очистить название и установить категорию 2
UPDATE Products
SET ProductName='',
	CategoryID=2
WHERE Price BETWEEN 50 AND 60
-- WHERE Price>=50 AND Price<=60


-- Задача. У поставщиков из USA и Japan очистить почтовый индекс
UPDATE Suppliers
SET PostalCode=''
WHERE Country IN ('USA', 'Japan')


-- Пример. Удаление клиента
DELETE FROM Customers
WHERE CustomerId=1


-- Задача. Удалить сотрудников 1 и 2
DELETE FROM Employees
WHERE EmployeeID IN (1, 2)

-- Добавление нового клиента
INSERT INTO Customers(CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Ivanov Ivan', NULL, NULL, NULL, NULL, NULL);

-- Задача. Добавить нового поставщика из China
INSERT INTO Suppliers(SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
VALUES
('New supplier', NULL, NULL, NULL, NULL, 'China', NULL);

-- Проверка на неопределенное значение
SELECT *
FROM Suppliers
WHERE Phone IS NULL

-- Задача. У товаров из категории 1 сделать поле Unit неопределенным
UPDATE Products
SET Unit = NULL
WHERE CategoryID=1

-- Задача. Вывести самый дешевый товар у которого поле Unit неопределено
SELECT * 
FROM Products
WHERE Unit IS NULL
ORDER BY Price DESC
LIMIT 1

-- Задача. Вывести три самых дорогих товара до 100 EUR из категорий 2 и 4 
SELECT *
FROM Products
WHERE
		CategoryID IN (2, 4)
    AND
    Price<=100
ORDER BY Price DESC
LIMIT 3