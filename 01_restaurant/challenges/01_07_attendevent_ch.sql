-- Register a customer for our Anniversary event.

-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.

SELECT * 
FROM Customers
WHERE Email='atapley2j@kinetecoinc.com';

INSERT INTO AnniversaryAttendees(CustomerID, PartySize)
VALUES ((SELECT CustomerID from Customers
WHERE Email='atapley2j@kinetecoinc.com'), 3);

SELECT * FROM AnniversaryAttendees;

SELECT * 
FROM Customers
WHERE CustomerID IN (SELECT CustomerID from AnniversaryAttendees)