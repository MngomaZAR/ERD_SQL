Here is a text-based representation of the ERD with dimensions and facts:

Customer (DimCustomer)

CustomerID (Primary Key)
Name
Address
Phone
Product (DimProduct)

ProductID (Primary Key)
Name
Description
Price
Order (DimOrder)

OrderID (Primary Key)
CustomerID (Foreign Key)
OrderDate
OrderLine (FactTable)

OrderLineID (Primary Key)
OrderID (Foreign Key)
ProductID (Foreign Key)
Quantity (Measure)
TotalPrice (Measure)
One-to-Many Relationships:

Customer - Order
Order - OrderLine
Many-to-One Relationship:

Product - OrderLine