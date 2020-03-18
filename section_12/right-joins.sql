-- RIGHT JOIN is where we select everything from the right (table B), along with anything
-- matching records on the left (table A).
-- Literally just the opposite of the LEFT JOIN

-- Also good to note, LEFT and RIGHT joins aren't really that different.
-- We could do a LEFT join and mimic a RIGHT join but swapping the data round

-- RIGHT JOIN
SELECT * FROM customers
RIGHT JOIN orders
  ON customers.id = orders.customer_id;
