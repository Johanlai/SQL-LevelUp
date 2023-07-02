-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.


SELECT *
FROM Customers
JOIN Reservations ON Customers.CustomerID = Reservations.CustomerID
WHERE LastName IN ('Stevensen', 'Stephensen', 'Stevenson', 'Stephenson', 'Stuyvesant')
AND strftime('%m-%d', Date) = '06-18';
-- Doesnt come up with anything because the reservation
-- is not for today but following few days

SELECT *
FROM Customers
JOIN Reservations ON Customers.CustomerID = Reservations.CustomerID
WHERE LastName LIKE 'St%'
AND PartySize = 4
AND Date>DATE('2022-06-14')
ORDER BY Date DESC;

