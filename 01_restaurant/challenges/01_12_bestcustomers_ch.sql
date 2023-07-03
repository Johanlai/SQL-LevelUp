-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT COUNT(Orders.OrderID) as OrderCount, 
Customers.FirstName||' '||Customers.LastName as Name, 
Customers.Email
FROM Orders
JOIN Customers
ON Orders.CustomerID=Customers.CustomerID
GROUP BY Orders.CustomerID
ORDER BY OrderCount DESC
LIMIT 6;