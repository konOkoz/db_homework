## Homework 1

### Вывести название и стоимость товаров от 20 EUR.
SELECT  
ProductName,  
Price  
FROM [Products]  
WHERE Price >=20  

### Вывести страны поставщиков.
SELECT  
Country  
FROM [Suppliers]  

### В упорядоченном по стоимости виде вывести название и стоимость товаров со скидкой в 9% от всех поставщиков, кроме поставщика 1.
SELECT  
ProductName,  
Price AS Price_Discounted  
FROM [Products]  
WHERE SupplierID != '1'  
ORDER BY Price ASC  

### Вывести контактные имена клиентов, кроме тех, что из France и USA.
SELECT  
ContactName  
FROM [Customers]  
WHERE  
Country != 'France' OR 'USA'  



## Homework 2

### Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT  
ProductName,  
Price * 1.1 AS Price_USD  
FROM [Products]  
ORDER BY Price DESC  
LIMIT 1  

### Вывести два самых дорогих товара из категории Beverages из USA
SELECT *  
FROM [Products]  
JOIN Categories ON Products.CategoryID=Categories.CategoryID  
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID  
WHERE  
Suppliers.Country='USA'  
AND  
Categories.CategoryName='Beverages'  
ORDER BY Products.Price DESC  
LIMIT 2  

### Удалить товары с ценой менее 5 EUR
DELETE FROM Products  
WHERE Price<5  

### Вывести список стран, которые поставляют морепродукты
SELECT  
Suppliers.Country  
FROM [Products]  
JOIN Categories ON Products.CategoryID=Categories.CategoryID  
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID  
WHERE  
Categories.CategoryID=8  

### Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName=''
WHERE Country!='China'

## Homework 3  

### 1. Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil
   SELECT COUNT(*)  
   FROM OrderDetails  
   JOIN Orders ON OrderDetails.OrderID=Orders.OrderID  
   JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID  
   JOIN Customers ON Orders.CustomerID=Customers.CustomerID  
   WHERE  
   Shippers.ShipperName="Speedy Express" AND  
   Customers.Country="Brazil"  
    Ответ: 22

### 2. Вывести среднюю стоимость проданного в Germany товара
   SELECT AVG(OrderDetails.Quantity*Products.Price) AS avg_sold_to_Germany  
   FROM OrderDetails  
   JOIN Products ON OrderDetails.ProductID=Products.ProductID  
   JOIN Orders ON OrderDetails.OrderID=Orders.OrderID  
   JOIN Customers ON Orders.CustomerID=Customers.CustomerID  
   WHERE  
   Customers.Country="Germany"  
    Ответ: 667.8106756756756

### 3. Вывести ко-во и сред/стоимость товаров из USA
   SELECT COUNT(*) AS total_count_products_from_usa,  
   AVG(Products.Price) AS avg_price_products_from_usa  
   FROM Products  
   JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID  
   WHERE  
   Suppliers.Country='USA'  
    Ответ: кол-во - 12 , сред.стоимость 20.870833333333334

### 4. Вывести стоимость и название двух самых дешевых товаров из Germany
   SELECT  
   Products.Price,  
   Products.ProductName  
   FROM Products  
   JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID  
   WHERE  
   Suppliers.Country like 'germany'  
   ORDER BY Products.Price  
   LIMIT 2  
    Ответ: 7.75  Rhönbräu Klosterbier , 13 Original Frankfurter grüne Soße

### 5. Применить наценку в 15% ко всем товарам из категории 4  
   UPDATE Products  
   SET Price=Price*1.15  
   WHERE CategoryID='4'  
    Ответ: You have made changes to the database. Rows affected: 10
