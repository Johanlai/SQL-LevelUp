-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT COUNT(Loans.LoanID) as LoanCount, Loans.PatronID, 
(Patrons.FirstName||' '||Patrons.LastName) AS FullName,
Patrons.Email
FROM Loans JOIN Patrons ON Patrons.PatronID=Loans.PatronID
GROUP BY Loans.PatronID
ORDER BY LoanCount ASC
LIMIT 10;
