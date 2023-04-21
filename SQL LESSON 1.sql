
SELECT Country, City
FROM Customers

-- The SELECT DISTINCT statement is used to return only distinct (different) values. 
SELECT DISTINCT Country
FROM Customers

SELECT *
FROM Customers
WHERE Country='Germany' -- фильтрация по стране

SELECT *
FROM Customers
WHERE Country='Germany' AND City='Berlin'

SELECT *
FROM Customers
WHERE Country='Germany' OR Country='France'

SELECT *
FROM Customers
WHERE Country IN ('Germany', 'France', 'USA')

SELECT *
FROM Products
WHERE Price>=100

SELECT *
FROM Products
WHERE Price>=50 AND Price<=100

SELECT *
FROM Products
WHERE Price<=50 AND CategoryID IN (1, 3)


SELECT *
FROM Products
WHERE Price>=50
ORDER BY Price DESC
-- DESC (по убыванию)
-- ASC (по умолч., по возрастанию)

-- Вывести три самых дорогих товара (сортировка)
SELECT *
FROM Products
ORDER BY Price DESC
LIMIT 3 --(до 3х)

-- BETWEEN. Выборка по диапазону значений
SELECT *
FROM Products
WHERE Price BETWEEN 50 AND 100

-- Оператор AS (Изменить названия)
SELECT
	Price AS Price_eur,
	Price * 1.09 AS Price_usd
FROM Products

-- Вывести стоимость товаров:
-- полную
-- со скидкой 25%
-- с наценкой 15%
SELECT
		Price AS Price_full,
		Price * .75 AS Price_down,
    Price * 1.15 AS Price_up
FROM Products
