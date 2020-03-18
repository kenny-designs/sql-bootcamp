-- INNER JOINS are data shared between two tables

-- IMPLICIT INNER JOIN.
-- This works because we cross joined customers and orders
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN
SELECT * FROM customers
JOIN orders
  ON customers.id = orders.customer_id;

-- The INNER keyword is implied when we don't write it
SELECT * FROM customers
INNER JOIN orders
  ON customers.id = orders.customer_id;


-- Fancy example of what we can do (find biggest spenders)
SELECT
  first_name,
  last_name,
  SUM(amount) AS total_spent
FROM customers
JOIN orders
  ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;
