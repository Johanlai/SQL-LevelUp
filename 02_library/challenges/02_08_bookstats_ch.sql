-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

SELECT COUNT(BookID), Published
FROM Books
GROUP BY Published
ORDER BY Published

SELECT COUNT(loans.LoanID) as LoanCount, Books.Title
FROM Loans
JOIN Books ON Books.BookID=Loans.BookID
GROUP BY Books.Title
ORDER BY LoanCount DESC
LIMIT 5