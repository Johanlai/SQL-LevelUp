-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

SELECT BookID, Barcode
FROM Books
WHERE Title in ('The Picture of Dorian Gray','Great Expectations')
AND Barcode in (2855934983,4043822646)

SELECT BookID
FROM Books
WHERE Title='The Picture of Dorian Gray'
AND Barcode=2855934983

SELECT PatronID FROM Patrons 
WHERE FirstName||' '||LastName='Jack Vaan'
AND Email='jvaan@wisdompets.com'

INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES 
((SELECT BookID FROM Books 
  WHERE Title='The Picture of Dorian Gray'
  AND Barcode=2855934983),
  (SELECT PatronID FROM Patrons 
  WHERE FirstName||' '||LastName='Jack Vaan'
  AND Email='jvaan@wisdompets.com'),
  '25-08-2022','08-09-2022'),
((SELECT BookID FROM Books 
  WHERE Title='Great Expectations'
  AND Barcode=4043822646),
  (SELECT PatronID FROM Patrons 
  WHERE FirstName||' '||LastName='Jack Vaan'
  AND Email='jvaan@wisdompets.com'),
  '25-08-2022','08-09-2022')
