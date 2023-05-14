-- Задача. Вывести количественное распределение товаров по поставщикам (название_компании, ко-во_товаров)
SELECT 
	Suppliers.SupplierName, 
	COUNT(*) AS total_products
    
FROM Products
    
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

GROUP BY Suppliers.SupplierID

ORDER BY total_products DESC


-- Задача. Вывести категорию, где больше всего товаров (название_категории, ко-во_товаров)
SELECT 
	CategoryName,
	COUNT(*) AS total
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID

GROUP BY Categories.CategoryID
ORDER BY total DESC

LIMIT 1


-- Задача. Вывести сумму каждого заказа (номер_заказа, сумма)
SELECT 
	OrderID,
	SUM(Products.Price * OrderDetails.Quantity) AS Total_Price

FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID

GROUP BY OrderID


-- Задача. Вывести информацию о последнем стриме (название)
SELECT
	title
FROM streams
ORDER BY created_at DESC
LIMIT 1


-- Задача. Дополнить вывод от предыдущей задачи именем автора
SELECT
	streams.title,
	users.fullname
FROM streams

JOIN users ON streams.author_id=users.user_id

ORDER BY streams.created_at DESC
LIMIT 1


-- Добавление полей в существующую таблицу
ALTER TABLE users
ADD fullname varchar(64)


-- Задача. Добавить трех пользователей (Germany, France, USA)
INSERT INTO users (user_id, created_at, country, email, is_blocked, fullname)
VALUES
	(2, CURRENT_TIMESTAMP, 'Germany', NULL, false, 'Ivanov Petr'),
    (3, CURRENT_TIMESTAMP, 'France', NULL, false, 'Ivanov Misha'),
    (4, CURRENT_TIMESTAMP, 'USA', NULL, false, 'Ivanov Boris');


-- Задача. Вывести кол. распределение пользователей по странам по убыванию
SELECT
	country,
	COUNT(*) AS total_users
FROM users

GROUP BY country

ORDER BY total_users DESC


-- Задача. Добавить пять реакций
INSERT INTO reactions(reaction_id, created_at, stream_id, value, author_id)
VALUES
	(1, CURRENT_TIMESTAMP, 1, 5, 1),
    (2, CURRENT_TIMESTAMP, 2, 5, 2),
    (3, CURRENT_TIMESTAMP, 1, 3, 2),
    (4, CURRENT_TIMESTAMP, 1, 2, 3),
    (5, CURRENT_TIMESTAMP, 1, 4, 3);


-- Задача. Вывести страны пользователей, кто поставил реакцию
SELECT DISTINCT
	users.country 
FROM reactions

JOIN users ON reactions.author_id=users.user_id



-- Задача. Вывести информацию о последней реакции (имя_автора_реакции, название_стрима, оценка)
SELECT
	users.fullname,
	streams.title,
	reactions.value
FROM reactions

JOIN users ON reactions.author_id=users.user_id
JOIN streams ON reactions.stream_id=streams.stream_id

ORDER BY reactions.created_at DESC
LIMIT 1