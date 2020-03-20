-- QUESTION 1
SELECT
  DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date
FROM users;

-- QUESTION 2
SELECT
  *
FROM users
WHERE created_at = (SELECT MIN(created_at) FROM users);

-- QUESTION 3
SELECT
  MONTHNAME(created_at) AS month,
  COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

-- QUESTION 4
SELECT
  COUNT(*) AS yahoo_users
FROM users
WHERE email LIKE '%yahoo.com';

-- QUESTION 5
SELECT
  CASE
    WHEN email LIKE '%@yahoo.com'   THEN 'yahoo'
    WHEN email LIKE '%@gmail.com'   THEN 'gmail'
    WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
    ELSE 'other'
  END AS provider,
  COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;
