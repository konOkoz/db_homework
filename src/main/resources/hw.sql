### Найти мин/стоимость товаров для каждой категории
SELECT
    CategoryID,
    MIN(Price)
FROM Products
GROUP BY CategoryID
```
Ответ:
CategoryID	MIN(Price)
1	          4.5
2	           10
3	          9.2
4	        3.30625
5	           7
6	          7.45
7	           10
8	           6

```
### Вывести ТОП-3 стран по количеству доставленных заказов
SELECT
    Customers.Country,
    COUNT(OrderDetails.OrderDetailID) AS delivered_orders_count
FROM OrderDetails
         JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
         JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY
    Customers.Country
ORDER BY delivered_orders_count DESC
    LIMIT 3
```
Ответ:
Country	 delivered_orders_count
USA	          76
Germany	      74
Brazil	      55
```

### Вывести названия категорий, в которых более 10 товаров
SELECT
Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
GROUP BY Products.CategoryID
HAVING
COUNT(Products.ProductName) >=10
```
ОТВЕТ:
CategoryName
Beverages
Condiments
Confections
Dairy Products
Seafood
```
### Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET Phone = ""
WHERE Country LIKE 'USA'
```
Ответ: You have made changes to the database. Rows affected: 4
```
### Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT
    Employees.FirstName,
    Employees.LastName,
    COUNT(OrderID) AS orders_count
FROM Orders
         JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Orders.EmployeeID
HAVING
        COUNT(OrderID)<=15
```
Ответ:
FirstName	  LastName	         orders_count
Steven	      Buchanan	               11
Robert	        King	               14
Anne	      Dodsworth	                6
```
### Вывести товар, который находится на втором месте по ко-ву заказов
SELECT
    Products.ProductName,
    Products.ProductID,
    COUNT(OrderDetails.ProductID) AS top_bought
FROM OrderDetails
         JOIN Products ON OrderDetails.ProductID=Products.ProductID
GROUP BY OrderDetails.ProductID
ORDER BY top_bought DESC
    LIMIT 1 OFFSET 1
```
Ответ:
ProductName	           ProductID	      top_bought
Raclette Courdavault	  59	              14
```

