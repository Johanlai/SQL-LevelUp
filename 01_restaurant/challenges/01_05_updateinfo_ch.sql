-- Update a customer's contact information.

-- Taylor Jenkins, of 27170 6th Ave., Washington, DC,
-- has moved to 74 Pine St., 74 Pine St., NY.

SELECT CustomerID, FirstName, LastName, Address, City, State
FROM Customers
WHERE FirstName='Taylor'
AND LastName='Jenkins'

UPDATE Customers
SET Address='74 Pine St.',
    City='New York',
    State='NY'
Where CustomerID=26;

SELECT * from Customers
WHERE CustomerID=26;