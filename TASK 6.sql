CREATE DATABASE student_details;

CREATE TABLE student_marks(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
english INT,
computer INT,
total_marks_obtained INT
);
 
INSERT INTO student_marks
VALUES (111,"Sonam",78,67,145),
     (112,"Tara",45,89,134),
     (113,"Sakshi",97,95,192),
     (114,"Kapoor",69,76,145),
     (115,"Rahul",59,90,149);
     
--SUBQUERIES

--Scalar Subquery in SELECT

SELECT student_id,student_name,
 (SELECT MAX(english) FROM student_marks)AS max_english
FROM student_marks;

--Subquery in WHERE using IN

SELECT student_name
FROM student_marks
WHERE total_marks_obtained IN (
  SELECT total_marks_obtained
  FROM student_marks
  WHERE english > 70
);

--Subquery in WHERE using EXISTS

SELECT student_name
FROM student_marks
WHERE computer > 90
AND EXISTS (
  SELECT 1
  FROM student_marks
  WHERE english > 90
);

--Subquery in WHERE using =

SELECT student_name
FROM student_marks
WHERE total_marks_obtained = (
  SELECT MAX(total_marks_obtained)
  FROM student_marks
);

--Correlated Subquery in SELECT

SELECT student_name, english,
  (SELECT AVG(english) FROM student_marks) AS avg_english
FROM student_marks;

--Subquery in FROM Clause

SELECT student_name, total_marks_obtained
FROM student_marks
WHERE total_marks_obtained > (
  SELECT avg_marks
  FROM (
    SELECT AVG(total_marks_obtained) AS avg_marks
    FROM student_marks
  ) AS avg_sub
);

--Correlated Subquery with WHERE

SELECT s1.student_name, s1.english
FROM student_marks s1
WHERE s1.english > (
  SELECT AVG(s2.english)
  FROM student_marks s2
  WHERE s2.student_id != s1.student_id
);