-- Вывести страны-поставщики напитков
SELECT DISTINCT
	Suppliers.Country
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE Categories.CategoryName='Beverages'

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


-- Задача. Вывести 10 последних заказов
SELECT * 
FROM Orders
ORDER BY OrderDate DESC
LIMIT 10

-- Создание БД
CREATE DATABASE db_name;
CREATE DATABASE IF NOT EXISTS db_name;


-- Создание таблиц
CREATE TABLE <название_таблицы> (<структура>);
CREATE TABLE users (
	// название_поля тип_данных доп_хар-ки
	user_id int
);


--Основные типы данных в MySQL
--каждый столбец (поле) таблицы должен иметь указание на тип данных

--Числовые

-- `int` / `integer`
-- `decimal(x, y)`
--    `x` - ко-во цифр до запятой
--    `y` - ко-во цифр после запятой

--Строковые

-- `varchar(x)`
--    `x` - макс. ко-во символов
-- `text(x)`
--    `x` - макс. ко-во символов

-- Логические
-- `bool`

-- Дата / время
-- `datetime` / `timestamp`
-- `date`
-- `time`