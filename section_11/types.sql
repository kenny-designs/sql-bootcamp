SELECT title, author_lname,
  CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title LIKE 'Just Kids' OR title LIKE 'A Heartbreaking Work%' THEN 'Memoir'
    ELSE 'Novel'
  END AS TYPE
FROM books;
