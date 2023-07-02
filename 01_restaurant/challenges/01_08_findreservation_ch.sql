-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.


SELECT *
FROM Customers
WHERE LastName IN ('Stevensen', 'Stephensen', 'Stevenson', 'Stephenson', 'Stuyvesant')
AND CustomerID IN (
    SELECT *
    FROM Reservations
    WHERE DATE(Date) = DATE('2018-06-14')
);

SELECT *
FROM Reservations
WHERE CustomerID in (14,91,99)
ORDER BY CustomerID
WHERE CustomerID IN (
    SELECT *
    FROM Customers
    WHERE LastName IN ('Stevensen', 'Stephensen', 'Stevenson', 'Stephenson', 'Stuyvesant')
);

SELECT *
FROM Reservations
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE LastName IN ('Stevensen', 'Stephensen', 'Stevenson', 'Stephenson', 'Stuyvesant')
)
AND FORMAT(Date, 'MM-dd')='06-14';

SELECT *
FROM Reservations
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE LastName IN ('Stevensen', 'Stephensen', 'Stevenson', 'Stephenson', 'Stuyvesant')
)
AND TO_CHAR(Date, 'YYYY-MM-DD') LIKE '%-06-18';


SELECT *
FROM Reservations
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE LastName IN ('Stevensen', 'Stephensen', 'Stevenson', 'Stephenson', 'Stuyvesant')
)
AND TO_CHAR(Date, 'MM-DD') LIKE '06-18';

SELECT strftime(Date)
FROM Reservations;

SELECT *
FROM Reservations
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE LastName IN ('Stevensen', 'Stephensen', 'Stevenson', 'Stephenson', 'Stuyvesant')
)
AND strftime('%m-%d', Date) = '06-18';
