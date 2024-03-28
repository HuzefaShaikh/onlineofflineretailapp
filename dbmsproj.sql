create database project;
use project;

-- ------------------------------not normalized-----------------------------
-- Table for Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmpFirst_Name VARCHAR(255) NOT NULL,
    EmpLast_SSN VARCHAR(255) NOT NULL,
    EmpMail_Address VARCHAR(255),
    Designation VARCHAR(255),
    Department VARCHAR(255),
    Salary DECIMAL(10, 2),
    Employee_Type VARCHAR(255),
    UNIQUE KEY (EmpLast_SSN)
);

-- Table for Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Email_Address VARCHAR(255),
    Phone_Number VARCHAR(20),
    Category VARCHAR(255),
    UNIQUE KEY (Email_Address)
);

-- Table for Bills
CREATE TABLE Bills (
    Billing_ID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    Amount_Paid DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for Addresses
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    Address_line1 VARCHAR(255) NOT NULL,
    Address_line2 VARCHAR(255),
    ZipCode INT,
    FOREIGN KEY (ZipCode) REFERENCES ZipCodes(ZipCode)
);

-- Table for Zip Codes
CREATE TABLE ZipCodes (
    ZipCode INT PRIMARY KEY,
    City VARCHAR(255),
    State VARCHAR(255)
);

-- Table for Payments
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    CustomerID INT,
    Payment_Type VARCHAR(255),
    CreditCard_Number VARCHAR(255),
    Card_Type VARCHAR(255),
    CVV_Number VARCHAR(255),
    ExpiryDate DATE,
    CardHolder_Name VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for Orders
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    CustomerID INT,
    Shippment_Duration VARCHAR(255),
    Order_Date DATE,
    Status VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for Order Items
CREATE TABLE OrderItems (
    OrderItem_ID INT PRIMARY KEY,
    Order_ID INT,
    ProductID INT,
    Date_of_Order DATE,
    Quantity INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table for Order Products
CREATE TABLE OrderProducts (
    OrderProduct_ID INT PRIMARY KEY,
    Order_ID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table for Vouchers
CREATE TABLE Vouchers (
    Voucher_Number INT PRIMARY KEY,
    Description VARCHAR(255),
    Priority INT,
    Quantity_Item INT
);

-- Table for Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Product_Name VARCHAR(255),
    Available_Number INT
);

-- Table for Product Details
CREATE TABLE ProductDetails (
    ProductID INT PRIMARY KEY,
    Weight DECIMAL(10, 2),
    Width DECIMAL(10, 2),
    Colour VARCHAR(255),
    Height DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table for Product Groups
CREATE TABLE ProductGroups (
    Group_ID INT PRIMARY KEY,
    Group_Name VARCHAR(255)
);

-- Table for Reviews
CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY,
    Quality INT,
    DefectPercentage DECIMAL(5, 2),
    Review_Date DATE,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- ------------------------------normalized---------------------------------
-- Table for Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmpFirst_Name VARCHAR(255) NOT NULL,
    EmpLast_SSN VARCHAR(255) NOT NULL,
    EmpMail_Address VARCHAR(255),
    Designation VARCHAR(255),
    Department VARCHAR(255),
    Salary DECIMAL(10, 2),
    Employee_Type VARCHAR(255)
);

-- Table for Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Email_Address VARCHAR(255),
    Phone_Number VARCHAR(20),
    Category VARCHAR(255)
);

-- Table for Bills
CREATE TABLE Bills (
    Billing_ID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    Amount_Paid DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Table for Addresses
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    Address_line1 VARCHAR(255) NOT NULL,
    Address_line2 VARCHAR(255),
    ZipCode INT,
    FOREIGN KEY (ZipCode) REFERENCES ZipCodes(ZipCode)
);

-- Table for Zip Codes
CREATE TABLE ZipCodes (
    ZipCode INT PRIMARY KEY,
    City VARCHAR(255),
    State VARCHAR(255)
);

-- Table for Payments
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    CustomerID INT,
    Payment_Type VARCHAR(255),
    CreditCard_Number VARCHAR(255),
    Card_Type VARCHAR(255),
    CVV_Number VARCHAR(255),
    ExpiryDate DATE,
    CardHolder_Name VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for Orders
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    CustomerID INT,
    Shippment_Duration VARCHAR(255),
    Order_Date DATE,
    Status VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for Order Items
CREATE TABLE OrderItems (
    OrderItem_ID INT PRIMARY KEY,
    Order_ID INT,
    ProductID INT,
    Date_of_Order DATE,
    Quantity INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Table for Order Products
CREATE TABLE OrderProducts (
    OrderProduct_ID INT PRIMARY KEY,
    Order_ID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table for Vouchers
CREATE TABLE Vouchers (
    Voucher_Number INT PRIMARY KEY,
    Description VARCHAR(255),
    Priority INT,
    Quantity_Item INT
);

-- Table for Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Product_Name VARCHAR(255),
    Available_Number INT
);

-- Table for Product Details
CREATE TABLE ProductDetails (
    ProductID INT PRIMARY KEY,
    Weight DECIMAL(10, 2),
    Width DECIMAL(10, 2),
    Colour VARCHAR(255),
    Height DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table for Product Groups
CREATE TABLE ProductGroups (
    Group_ID INT PRIMARY KEY,
    Group_Name VARCHAR(255)
);

-- Table for Reviews
CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY,
    Quality INT,
    DefectPercentage DECIMAL(5, 2),
    Review_Date DATE,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- INSERT QUERIES
-- INSERT queries for Employees table
INSERT INTO Employees (EmployeeID, EmpFirst_Name, EmpLast_SSN, EmpMail_Address, Designation, Department, Salary, Employee_Type) 
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'Manager', 'Sales', 50000.00, 'Full-time'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'Sales Associate', 'Sales', 35000.00, 'Full-time'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 'Customer Support Specialist', 'Customer Service', 40000.00, 'Full-time'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', 'Marketing Manager', 'Marketing', 55000.00, 'Full-time'),
(5, 'David', 'Wilson', 'david.wilson@example.com', 'IT Specialist', 'IT', 45000.00, 'Full-time'),
(6, 'Sarah', 'Anderson', 'sarah.anderson@example.com', 'HR Coordinator', 'Human Resources', 38000.00, 'Full-time'),
(7, 'James', 'Martinez', 'james.martinez@example.com', 'Accountant', 'Finance', 48000.00, 'Full-time'),
(8, 'Jessica', 'Taylor', 'jessica.taylor@example.com', 'Operations Manager', 'Operations', 52000.00, 'Full-time'),
(9, 'Christopher', 'Hernandez', 'christopher.hernandez@example.com', 'Software Engineer', 'Engineering', 60000.00, 'Full-time'),
(10, 'Amanda', 'Young', 'amanda.young@example.com', 'Graphic Designer', 'Creative', 42000.00, 'Full-time');
SELECT * FROM Employees;


-- INSERT queries for Customers table
INSERT INTO Customers (CustomerID, First_Name, Last_Name, Mail_Address, Phone_Number, Category) 
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890', 'Retail'),
(2, 'Bob', 'Williams', 'bob.williams@example.com', '234-567-8901', 'Retail'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '345-678-9012', 'Wholesale'),
(4, 'Diana', 'Miller', 'diana.miller@example.com', '456-789-0123', 'Retail'),
(5, 'Ethan', 'Jones', 'ethan.jones@example.com', '567-890-1234', 'Wholesale'),
(6, 'Fiona', 'Davis', 'fiona.davis@example.com', '678-901-2345', 'Retail'),
(7, 'George', 'Garcia', 'george.garcia@example.com', '789-012-3456', 'Retail'),
(8, 'Hannah', 'Martinez', 'hannah.martinez@example.com', '890-123-4567', 'Wholesale'),
(9, 'Ian', 'Taylor', 'ian.taylor@example.com', '901-234-5678', 'Retail'),
(10, 'Jennifer', 'Hernandez', 'jennifer.hernandez@example.com', '012-345-6789', 'Retail');
SELECT * FROM Customers;


-- INSERT queries for Bills table
INSERT INTO Bills (Billing_ID, CustomerID, Amount_Paid) 
VALUES
(1, 1, 100.00),
(2, 2, 150.50),
(3, 3, 200.25),
(4, 4, 75.75),
(5, 5, 300.00),
(6, 6, 125.50),
(7, 7, 180.00),
(8, 8, 90.25),
(9, 9, 250.75),
(10, 10, 120.00);
SELECT * FROM Bills;


-- INSERT queries for Addresses table
INSERT INTO Addresses (AddressID, Address_line1, Address_line2, ZipCode) 
VALUES
(1, '123 Main St', 'Apt 101', 12345),
(2, '456 Elm St', NULL, 23456),
(3, '789 Oak St', 'Suite 200', 34567),
(4, '101 Pine St', NULL, 45678),
(5, '222 Maple St', 'Apt 303', 56789),
(6, '333 Cedar St', NULL, 67890),
(7, '444 Birch St', 'Unit B', 78901),
(8, '555 Walnut St', NULL, 89012),
(9, '666 Chestnut St', 'Suite 100', 90123),
(10, '777 Spruce St', NULL, 01234);
SELECT * FROM Addresses;


-- INSERT queries for ZipCodes table
INSERT INTO ZipCodes (ZipCode, City, State) 
VALUES
(12345, 'New York', 'NY'),
(23456, 'Los Angeles', 'CA'),
(34567, 'Chicago', 'IL'),
(45678, 'Houston', 'TX'),
(56789, 'Phoenix', 'AZ'),
(67890, 'Philadelphia', 'PA'),
(78901, 'San Antonio', 'TX'),
(89012, 'San Diego', 'CA'),
(90123, 'Dallas', 'TX'),
(01234, 'San Jose', 'CA');
SELECT * FROM ZipCodes;


-- INSERT queries for Payments table
INSERT INTO Payments (Payment_ID, CustomerID, Payment_Type, CreditCard_Number, Card_Type, CVV_Number, ExpiryDate, CardHolder_Name) 
VALUES
(1, 1, 'Credit Card', '1234567890123456', 'Visa', '123', '2024-12-31', 'Alice Johnson'),
(2, 2, 'Credit Card', '2345678901234567', 'MasterCard', '234', '2025-06-30', 'Bob Williams'),
(3, 3, 'Cash', NULL, NULL, NULL, NULL, NULL),
(4, 4, 'Credit Card', '3456789012345678', 'American Express', '345', '2024-09-30', 'Diana Miller'),
(5, 5, 'Cash', NULL, NULL, NULL, NULL, NULL),
(6, 6, 'Credit Card', '4567890123456789', 'Discover', '456', '2023-03-31', 'Fiona Davis'),
(7, 7, 'Credit Card', '5678901234567890', 'Visa', '567', '2024-11-30', 'George Garcia'),
(8, 8, 'Credit Card', '6789012345678901', 'MasterCard', '678', '2025-02-28', 'Hannah Martinez'),
(9, 9, 'Cash', NULL, NULL, NULL, NULL, NULL),
(10, 10, 'Credit Card', '7890123456789012', 'American Express', '789', '2023-08-31', 'Jennifer Hernandez');
SELECT * FROM Payments;


-- INSERT queries for Orders table
INSERT INTO Orders (Order_ID, CustomerID, Shippment_Duration, Order_Date, Status) 
VALUES
(1, 1, '3 days', '2024-03-15', 'Shipped'),
(2, 2, '2 days', '2024-03-16', 'Pending'),
(3, 3, '5 days', '2024-03-17', 'Delivered'),
(4, 4, '4 days', '2024-03-18', 'Pending'),
(5, 5, '3 days', '2024-03-19', 'Shipped'),
(6, 6, '2 days', '2024-03-20', 'Delivered'),
(7, 7, '5 days', '2024-03-21', 'Shipped'),
(8, 8, '4 days', '2024-03-22', 'Pending'),
(9, 9, '3 days', '2024-03-23', 'Shipped'),
(10, 10, '2 days', '2024-03-24', 'Delivered');
SELECT * FROM Orders;


-- INSERT queries for OrderItems table
INSERT INTO OrderItems (OrderItem_ID, Order_ID, ProductID, Date_of_Order, Quantity) 
VALUES
(1, 1, 1, '2024-03-15', 2),
(2, 2, 2, '2024-03-16', 1),
(3, 3, 3, '2024-03-17', 3),
(4, 4, 4, '2024-03-18', 2),
(5, 5, 5, '2024-03-19', 1),
(6, 6, 6, '2024-03-20', 4),
(7, 7, 7, '2024-03-21', 2),
(8, 8, 8, '2024-03-22', 1),
(9, 9, 9, '2024-03-23', 3),
(10, 10, 10, '2024-03-24', 2);
SELECT * FROM OrderItems;


-- INSERT queries for OrderProducts table
INSERT INTO OrderProducts (OrderProduct_ID, Order_ID, ProductID, Quantity) 
VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 2),
(5, 5, 5, 1),
(6, 6, 6, 4),
(7, 7, 7, 2),
(8, 8, 8, 1),
(9, 9, 9, 3),
(10, 10, 10, 2);
SELECT * FROM OrderProducts;


-- INSERT queries for Vouchers table
INSERT INTO Vouchers (Voucher_Number, Description, Priority, Quantity_Item) 
VALUES
(1, '10% off on next purchase', 1, 100),
(2, '20% off on all electronics', 2, 50),
(3, 'Free shipping on orders over $50', 3, 200),
(4, 'Buy one get one free on select items', 4, 75),
(5, '15% off for VIP customers', 5, 30),
(6, 'Special discount for first-time buyers', 6, 50),
(7, 'Exclusive offer for newsletter subscribers', 7, 100),
(8, 'Limited time offer: 25% off on clearance items', 8, 25),
(9, 'Birthday discount: 10% off during your birthday month', 9, 50),
(10, 'Refer a friend and get $10 credit', 10, 100);
SELECT * FROM Vouchers;


-- INSERT queries for Products table
INSERT INTO Products (ProductID, Product_Name, Available_Number) 
VALUES
(1, 'Laptop', 50),
(2, 'Smartphone', 100),
(3, 'Tablet', 75),
(4, 'Headphones', 200),
(5, 'Camera', 50),
(6, 'Printer', 30),
(7, 'Television', 80),
(8, 'Gaming Console', 60),
(9, 'Fitness Tracker', 100),
(10, 'Bluetooth Speaker', 120);
SELECT * FROM Products;


-- INSERT queries for ProductDetails table
INSERT INTO ProductDetails (ProductID, Weight, Width, Colour, Height) 
VALUES
(1, 2.5, 14.0, 'Silver', 0.7),
(2, 0.3, 6.0, 'Black', 0.3),
(3, 0.5, 9.0, 'White', 0.4),
(4, 0.1, 8.0, 'Red', 0.2),
(5, 0.8, 4.0, 'Black', 0.6),
(6, 4.0, 18.0, 'White', 0.8),
(7, 20.0, 50.0, 'Black', 30.0),
(8, 3.0, 12.0, 'Black', 2.0),
(9, 0.2, 2.0, 'Black', 0.1),
(10, 0.5, 6.0, 'Blue', 0.3);
SELECT * FROM ProductDetails;


-- INSERT queries for ProductGroups table
INSERT INTO ProductGroups (Group_ID, Group_Name) 
VALUES
(1, 'Electronics'),
(2, 'Appliances'),
(3, 'Accessories'),
(4, 'Fitness'),
(5, 'Entertainment'),
(6, 'Home');
SELECT * FROM ProductGroups;


-- INSERT queries for Reviews table
INSERT INTO Reviews (Review_ID, Quality, DefectPercentage, Review_Date, ProductID) 
VALUES
(1, 4, 2.5, '2024-03-15', 1),
(2, 5, 1.0, '2024-03-16', 2),
(3, 3, 3.0, '2024-03-17', 3),
(4, 4, 1.5, '2024-03-18', 4),
(5, 5, 0.5, '2024-03-19', 5),
(6, 4, 2.0, '2024-03-20', 6),
(7, 3, 3.5, '2024-03-21', 7),
(8, 5, 0.0, '2024-03-22', 8),
(9, 4, 2.0, '2024-03-23', 9),
(10, 3, 3.0, '2024-03-24', 10);
SELECT * FROM Reviews;

-- Queries
-- 1)List all customers who have made at least one payment
SELECT DISTINCT c.CustomerID, c.First_Name, c.Last_Name
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID;

-- 2)Get the average salary of employees in each department
SELECT Department, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department;

-- 3) Find the highest and lowest paid employees in each department
SELECT Department, MAX(Salary) AS Highest_Salary, MIN(Salary) AS Lowest_Salary
FROM Employees
GROUP BY Department;

-- 4) List all orders that have been shipped and paid for, along with the customer details:
SELECT o.Order_ID, c.First_Name, c.Last_Name, o.Order_Date, o.Shippment_Duration
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Status = 'Shipped'
AND EXISTS (
    SELECT 1 FROM Payments p WHERE p.CustomerID = o.CustomerID
);

-- 5) Count the number of orders placed by each customer and display in descending order of order count::
SELECT c.CustomerID, c.First_Name, c.Last_Name, COUNT(o.Order_ID) AS Order_Count
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY Order_Count DESC;

-- 6) Find the top 5 products with the highest defect percentage in reviews:
SELECT ProductID, MAX(DefectPercentage) AS Highest_Defect_Percentage
FROM Reviews
GROUP BY ProductID
ORDER BY Highest_Defect_Percentage DESC;

-- 7) Retrieve the total quantity of each product sold and list them in descending order of quantity
SELECT op.ProductID, SUM(op.Quantity) AS Total_Quantity_Sold
FROM OrderProducts op
GROUP BY op.ProductID
ORDER BY Total_Quantity_Sold DESC;

-- 8) List all reviews along with the product information they are related to:
SELECT r.*, p.Product_Name
FROM Reviews r
RIGHT JOIN Products p ON r.ProductID = p.ProductID;

-- 9) Display all orders along with their associated order items:
SELECT o.*, oi.ProductID, oi.Date_of_Order, oi.Quantity
FROM Orders o
LEFT JOIN OrderItems oi ON o.Order_ID = oi.Order_ID;

-- 10) find customers who made purchases online and paid using a credit card:
SELECT c.First_Name, c.Last_Name
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Payments p ON c.CustomerID = p.CustomerID
WHERE p.Payment_Type = 'Credit Card';

-- 11) Find how many customers are there group by category
SELECT Category, COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Category;

-- 12) Total amount of revenue earned with respect to their purchasing modes
SELECT COUNT(*) AS Total_Customers, Payment_Type, SUM(Amount_Paid) AS Total_Amount
FROM Payments
INNER JOIN Bills ON Payments.CustomerID = Bills.CustomerID
GROUP BY Payment_Type;

-- 13)Find product and their respective color
SELECT p.Product_Name, pd.Colour
FROM ProductDetails pd
INNER JOIN Products p ON pd.ProductID = p.ProductID
ORDER BY pd.Colour;

-- 14) Retrieve all customers and their orders, even if some customers have not placed any orders.
SELECT c.CustomerID, c.First_Name, c.Last_Name, o.Order_ID
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 15) Retrieve data about orders, including the employee and customer involved, the product ordered, and the quantity
SELECT Orders.Order_ID, Employees.EmpFirst_Name AS Employee_FirstName, Employees.EmpLast_SSN AS Employee_LastName, 
Customers.First_Name AS Customer_FirstName, Customers.Last_Name AS Customer_LastName, Products.Product_Name, OrderItems.Quantity
FROM Orders
NATURAL JOIN Customers
JOIN Employees ON Orders.CustomerID = Employees.EmployeeID
JOIN OrderItems ON Orders.Order_ID = OrderItems.Order_ID
JOIN Products ON OrderItems.ProductID = Products.ProductID;


-- 16) Query to list all customers from a specific city
SELECT C.First_Name, C.Last_Name
FROM Customers C
JOIN Addresses A ON C.AddressID = A.AddressID
JOIN ZipCodes Z ON A.ZipCode = Z.ZipCode
WHERE Z.City = 'New York';

-- 17) Create view for retail customers
CREATE VIEW RetailCustomers AS
SELECT *
FROM Customers
WHERE Category = 'Retail';

-- 18) Utilize the RetailCustomers view to retrieve information about retail customers along with their associated orders
SELECT c.First_Name, c.Last_Name, o.Order_ID, o.Order_Date, oi.ProductID, p.Product_Name, oi.Quantity
FROM RetailCustomers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.Order_ID = oi.Order_ID
JOIN Products p ON oi.ProductID = p.ProductID;

-- 19) Distinct employee departments whose salary is greater than 1200 limit to 4
CREATE VIEW DistinctEmployeeDepartments AS
(
    SELECT DISTINCT EmployeeID, EmpFirst_Name, Department
    FROM Employees
    WHERE Salary > 1200
    LIMIT 4
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER UpdateLastUpdated
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    SET NEW.LastUpdated = CURRENT_TIMESTAMP;
END;
//

DELIMITER ;


-- ------------------------------
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    StockQuantity INT
);

DELIMITER //

CREATE TRIGGER PreventDeleteProduct
BEFORE DELETE ON Product
FOR EACH ROW
BEGIN
    IF OLD.StockQuantity > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete product with non-zero stock quantity';
    END IF;
END;
//

DELIMITER ;

-- Attempt to delete a product with a non-zero stock quantity
DELETE FROM Product WHERE ProductID = 1; -- Assuming ProductID 1 has a non-zero stock quantity

-- Check if the deletion was successful
SELECT * FROM Product;

-- Inserting some sample data into the Product table
INSERT INTO Product (ProductID, ProductName, StockQuantity) VALUES
(1, 'Product A', 10), -- Product with non-zero stock quantity
(2, 'Product B', 0);   -- Product with zero stock quantity




