-- CHALLENGE 1
SELECT * FROM users ORDER BY created_at LIMIT 5;

-- CHALLENGE 2
SELECT
  DAYNAME(created_at) AS day,
  COUNT(*) AS total 
FROM users
GROUP BY day
ORDER BY total DESC;

-- CHALLENGE 3
SELECT username
FROM users
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- CHALLENGE 4
SELECT
  users.username,
  photos.id,
  photos.image_url,
  COUNT(*) AS total
FROM photos
INNER JOIN likes
  ON likes.photo_id = photos.id
INNER JOIN users
  ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- CHALLENGE 5
SELECT
  (SELECT COUNT(*) FROM photos) /
  (SELECT COUNT(*) FROM users)
AS average;

-- CHALLENGE 6
SELECT
  tags.tag_name,
  COUNT(*) AS total
FROM tags
INNER JOIN photo_tags
  ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- CHALLENGE 7
SELECT
  users.username,
  COUNT(*) AS num_likes
FROM users
INNER JOIN likes
  ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);
