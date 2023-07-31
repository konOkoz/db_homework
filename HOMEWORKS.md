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
