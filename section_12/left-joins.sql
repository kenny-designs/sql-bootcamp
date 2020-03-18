-- LEFT JOINS denote that we select everything from table A, along with any matching
-- records in table B.

-- With the LEFT keyword, we get all customers regardless if they ordered or not
-- customers are on the left (table A) and orders on the right (table B)
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders
  ON customers.id = orders.customer_id;

-- Grouping
SELECT
  first_name,
  last_name,
  IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
  ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent DESC;
