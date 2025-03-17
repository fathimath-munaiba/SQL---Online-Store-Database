CREATE DATABASE STORE;
USE STORE;
CREATE TABLE Products(
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
	Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
    );
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address TEXT
    );
 CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATETIME ,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    );
INSERT INTO Products (ProductName, Description, Price, Stock) VALUES
	('Laptop', 'High-performance laptop with 16GB RAM', 35000, 10),
    ('Smartphone', 'Latest model with 128GB storage', 30000, 15),
    ('Tablet', '10-inch display with 64GB storage', 10000, 20),
    ('Wireless Mouse', 'Ergonomic design with long battery life', 1000, 50),
    ('Keyboard', 'RGB backlight with tactile switches', 1500, 30),
    ('Smartwatch', 'Waterproof with heart rate monitoring', 3000, 25),
    ('Bluetooth Speaker', 'Portable speaker with deep bass', 500, 40),
    ('Gaming Monitor', '27-inch 144Hz refresh rate display', 29999, 12),
	('External SSD', '1TB fast portable SSD', 149.99, 18),
    ('Noise Cancelling Headphones', 'Premium sound quality with ANC', 249.99, 22);
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
    ('Fathimath', 'Munaiba', 'Fathimath.Munaiba@gmail.com', '1234567890', '123 Main St, NY'),
    ('Jane', 'Smith', 'jane.smith@gmail.com', '2345678901', '456 Oak St, CA'),
    ('daisy', 'maria', 'daisymariya@gmail.com', '3456789012', '789 Pine St, TX'),
    ('Emily', 'Davis', 'emily.davis@example.com', '4567890123', '321 Elm St, FL'),
    ('rahul', 'raghav', 'rahul.raghav@gmail.com', '5678901234', '654 Maple St, WA');   
    INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-02-01 10:15:00', 10500),  
(2, '2024-02-02 12:30:00', 30000),  
(3, '2024-02-03 14:45:00', 7500),  
(4, '2024-02-04 16:00:00', 4500),   
(5, '2024-02-05 18:20:00', 4999),   
(1, '2024-02-06 20:05:00', 5998),   
(2, '2024-02-07 21:40:00', 29999),  
(3, '2024-02-08 10:10:00', 14999),  
(4, '2024-02-09 13:25:00', 24999),  
(5, '2024-02-10 15:35:00', 22000);

-- TASK2
ALTER TABLE Products ADD COLUMN Discount DECIMAL(5,2) DEFAULT 0.00;
SET SQL_SAFE_UPDATES = 0;
UPDATE Products SET Discount = 10.00 WHERE ProductName = 'Laptop';  
UPDATE Products SET Discount = 20.00 WHERE ProductName = 'Tablet';  
UPDATE Products SET Discount = 30.00WHERE ProductName = 'Smartwatch';  
UPDATE Products SET Discount = 15.00 WHERE ProductName = 'Smartphone';  
UPDATE Products SET Discount = 20.00 WHERE ProductName = 'Keyboard'; 

-- TASK3

SELECT * 
FROM Orders 
WHERE TotalAmount > 100 
ORDER BY OrderDate DESC;

-- TASK4

SELECT 
    Customers.CustomerID, 
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS CustomerName, 
    SUM(Orders.TotalAmount) AS TotalSpent
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, CustomerName
ORDER BY TotalSpent DESC;

-- TASK5

SELECT 
    Customers.CustomerID, 
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS CustomerName, 
    SUM(Orders.TotalAmount) AS TotalSpent
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, CustomerName
HAVING TotalSpent >= 500
ORDER BY TotalSpent DESC;

-- TASK6

SELECT AVG(Price) AS AveragePrice FROM Products;
SELECT MAX(TotalAmount) AS MaxOrderValue FROM Orders;
SELECT COUNT(ProductID) AS TotalProducts FROM Products;
SELECT SUM(Stock) AS TotalStock FROM Products;

-- TASK7

SELECT * 
FROM Products 
WHERE (Price BETWEEN 20 AND 50) 
   OR (ProductName LIKE '%Laptop%');

-- TASK8
SELECT 
    Customers.CustomerID, 
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS CustomerName, 
    Orders.OrderID, 
    Orders.OrderDate, 
    Orders.TotalAmount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.OrderDate DESC;
 -- TASK9
 
SELECT 
    Products.ProductID, 
    Products.ProductName, 
    Orders.OrderID, 
    Orders.OrderDate, 
    Orders.TotalAmount
FROM Products
LEFT JOIN Orders ON Products.ProductID = Orders.OrderID
ORDER BY Products.ProductID;
-- TASK10

SELECT 
    Customers.CustomerID, 
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS CustomerName, 
    Orders.OrderID, 
    Orders.OrderDate, 
    Orders.TotalAmount
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
ORDER BY Customers.CustomerID;






