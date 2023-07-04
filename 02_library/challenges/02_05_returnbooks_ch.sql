-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424


SELECT Loans.LoanID, Loans.ReturnedDate
FROM Books
JOIN Loans ON Loans.BookID = Books.BookID
WHERE Books.Barcode IN (6435968624, 5677520613, 8730298424)
AND Loans.ReturnedDate IS '2022-07-05';

UPDATE Loans
SET ReturnedDate= DATE('2022-07-05')
WHERE LoanID in (
  SELECT Loans.LoanID
  FROM Books
  JOIN Loans ON Loans.BookID = Books.BookID
  WHERE Books.Barcode IN (6435968624, 5677520613, 8730298424)
  AND Loans.ReturnedDate IS NULL
);