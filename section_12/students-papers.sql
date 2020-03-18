CREATE TABLE students(
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100)
);

CREATE TABLE papers(
  title VARCHAR(100),
  grade INT,
  student_id INT,
  FOREIGN KEY(student_id) REFERENCES students(id)
  ON DELETE CASCADE
);
