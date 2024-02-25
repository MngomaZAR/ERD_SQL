SQL Commands:



Create Tables:
sql

CREATE TABLE DimCustomer (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(20)
);

CREATE TABLE DimProduct (
  ProductID INT PRIMARY KEY,
  Name VARCHAR(255),
  Description TEXT,
  Price DECIMAL(10,2)
);

CREATE TABLE DimOrder (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID)
);

CREATE TABLE FactOrderLine (
  OrderLineID INT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  Quantity INT,
  TotalPrice DECIMAL(10,2),
  FOREIGN KEY (OrderID) REFERENCES DimOrder(OrderID),
  FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID)
);



Insert Data:
sql

INSERT INTO DimCustomer (CustomerID, Name, Address, Phone)
VALUES (1, 'John Doe', '123 Main St', '555-1234');

INSERT INTO DimProduct (ProductID, Name, Description, Price)
VALUES (1, 'Product A', 'Description A', 100.00);

INSERT INTO DimOrder (OrderID, CustomerID, OrderDate)
VALUES (1, 1, '2023-03-01');

INSERT INTO FactOrderLine (OrderLineID, OrderID, ProductID, Quantity, TotalPrice)
VALUES (1, 1, 1, 2, 200.00);



Select Data:
sql

SELECT c.Name, o.OrderDate, p.Name, ol.Quantity, ol.TotalPrice
FROM FactOrderLine ol
JOIN DimOrder o ON ol.OrderID = o.OrderID
JOIN DimProduct p ON ol.ProductID = p.ProductID
JOIN DimCustomer c ON o.CustomerID = c.CustomerID;




Update Data:
sql

UPDATE DimCustomer
SET Address = '456 Main St'
WHERE CustomerID = 1;




Delete Data:
sql

DELETE FROM DimOrder
WHERE OrderID = 1;