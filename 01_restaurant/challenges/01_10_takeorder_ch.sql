-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

SELECT CustomerID
FROM Customers
WHERE (FirstName||' '||LastName)='Loretta Hundey'
AND Address='6939 Elka Place';

SELECT DishID, Price
FROM Dishes
WHERE Name IN ('House Salad','Mini Cheeseburgers','Tropical Blue Smoothie');

SELECT SUM(Price) as subtotal
FROM Dishes
WHERE Name IN ('House Salad','Mini Cheeseburgers','Tropical Blue Smoothie');

INSERT INTO Orders (CustomerID, OrderDate)
VALUES ((
  SELECT CustomerID
  FROM Customers
  WHERE (FirstName||' '||LastName)='Loretta Hundey'
  AND Address='6939 Elka Place'),
DATETIME('now'));

SELECT *
FROM Orders
WHERE CustomerID=70
ORDER BY OrderDate DESC

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES
(1001, (SELECT DishID FROM Dishes WHERE Name='House Salad')),
(1001, (SELECT DishID FROM Dishes WHERE Name='Mini Cheeseburgers')),
(1001, (SELECT DishID FROM Dishes WHERE Name='Tropical Blue Smoothie'));

SELECT *
FROM Dishes
JOIN OrdersDishes ON Dishes.DishID=OrdersDishes.DishID
WHERE OrdersDishes.OrderID=1001

SELECT SUM(Price) as subtotal
FROM Dishes
JOIN OrdersDishes ON OrdersDishes.DishID=Dishes.DishID
WHERE OrderID=1001