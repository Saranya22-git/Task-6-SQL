# 🎯Subqueries and Nested Queries

This demonstrates the use of **SQL subqueries and nested queries**. It includes scalar subqueries, correlated subqueries, and subqueries used with `IN`, `EXISTS`, and `=` operators.

## 📌 SQL Queries Overview

### 1. Scalar Subquery in `SELECT`

🔹Displays the max English marks along with each student.
```sql
SELECT student_id, student_name,
       (SELECT MAX(english) FROM student_marks) AS max_english
FROM student_marks;
```
### 2. Subquery in WHERE using `IN`
   
🔹Find students whose total marks match those who scored > 70 in English.
```sql
SELECT student_name
FROM student_marks
WHERE total_marks_obtained IN (
  SELECT total_marks_obtained
  FROM student_marks
  WHERE english > 70
);
```
### 3. Subquery in WHERE using `EXISTS`
   
🔹Lists students with computer > 90 only if someone scored english > 90.
```sql
SELECT student_name
FROM student_marks
WHERE computer > 90
AND EXISTS (
  SELECT 1
  FROM student_marks
  WHERE english > 90
);
```
### 4. Subquery in `WHERE using =`
   
🔹Get the student with the highest total marks.
```sql
SELECT student_name
FROM student_marks
WHERE total_marks_obtained = (
  SELECT MAX(total_marks_obtained)
  FROM student_marks
);
```
### 5. Correlated Subquery in `SELECT`
   
🔹Shows each student's English mark and the class average.
```sql
SELECT student_name, english,
       (SELECT AVG(english) FROM student_marks) AS avg_english
FROM student_marks;
```
### 6. Subquery in `FROM Clause (Nested)`
   
🔹Lists students scoring above the average total marks.
```sql
SELECT student_name, total_marks_obtained
FROM student_marks
WHERE total_marks_obtained > (
  SELECT avg_marks
  FROM (
    SELECT AVG(total_marks_obtained) AS avg_marks
    FROM student_marks
  ) AS avg_sub
);
```
### 7. Correlated Subquery with `WHERE`
   
🔹Finds students whose English marks are above the average of all other students.
```sql
SELECT s1.student_name, s1.english
FROM student_marks s1
WHERE s1.english > (
  SELECT AVG(s2.english)
  FROM student_marks s2
  WHERE s2.student_id != s1.student_id
);
```
# ⛏️Tools
🔹 MySQL Workbench

# **Happy Learning! 🎓**
