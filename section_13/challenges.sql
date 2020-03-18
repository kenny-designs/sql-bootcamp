-- TV Joins Challenge 1
SELECT
  title,
  rating
FROM reviews
INNER JOIN series
  ON series.id = reviews.series_id;

-- TV Joins Challenge 2
SELECT
  title,
  AVG(rating) AS avg_rating
FROM reviews
INNER JOIN series
  ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

-- TV Joins Challenge 3
SELECT
  first_name,
  last_name,
  rating
FROM reviews
INNER JOIN reviewers
  ON reviewers.id = reviews.reviewer_id;

-- TV Joins Challenge 4
SELECT
  title,
  rating
FROM reviews
RIGHT JOIN series
  ON series.id = reviews.series_id
WHERE rating IS NULL;

-- TV Joins Challenge 5
SELECT
  genre,
  ROUND(
    AVG(rating), 2
  ) AS avg_rating
FROM reviews
INNER JOIN series
  ON series.id = reviews.series_id
GROUP BY series.genre;

-- TV Joins Challenge 6
SELECT
  first_name,
  last_name,
  COUNT(rating) AS COUNT,
  MIN(IFNULL(rating, 0)) AS MIN,
  MAX(IFNULL(rating, 0)) AS MAX,
  AVG(IFNULL(rating, 0)) AS AVG,
  IF(COUNT(rating) = 0, 'INACTIVE', 'ACTIVE') AS STATUS
FROM reviews
RIGHT JOIN reviewers
  ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

-- TV Joins Challenge 7
SELECT
  title,
  rating,
  CONCAT(first_name, ' ', last_name) AS reviewer
FROM reviews
INNER JOIN reviewers
  ON reviewers.id = reviews.reviewer_id
INNER JOIN series
  ON series.id = reviews.series_id;
