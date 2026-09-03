# SQL Cheat Sheet (Easy to Learn)

A beginner-friendly SQL cheat sheet covering **DDL, DML, DQL, TCL, Constraints, Joins, Functions, Procedures, Triggers**, and other basic concepts with **syntax, example, and expected output**.

---

# 1. Create Database

### Syntax
```sql
CREATE DATABASE database_name;
```

### Example
```sql
CREATE DATABASE college;
USE college;
```

**Output**
```
Database created successfully.
Database changed.
```

---

# 2. Create Table

### Syntax
```sql
CREATE TABLE table_name(
 column datatype constraints
);
```

### Example
```sql
CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100)
);
```

**Output**
```
Query OK, Table created.
```

---

# 3. Constraints

| Constraint | Purpose | Example |
|------------|---------|----------|
| PRIMARY KEY | Unique identifier | `id INT PRIMARY KEY` |
| FOREIGN KEY | Connects tables | `FOREIGN KEY(dept_id) REFERENCES department(id)` |
| NOT NULL | Cannot be empty | `name VARCHAR(50) NOT NULL` |
| UNIQUE | No duplicate values | `email VARCHAR(100) UNIQUE` |
| DEFAULT | Default value | `age INT DEFAULT 18` |
| AUTO_INCREMENT | Auto-generated number | `id INT AUTO_INCREMENT` |
| CHECK | Validates values | `CHECK(age>=18)` |

---

# 4. Insert Data

### Syntax
```sql
INSERT INTO table_name VALUES(...);
```

### Example
```sql
INSERT INTO student
VALUES(1,'Rahul',20,'rahul@mail.com');
```

**Output**

| id | name | age | email |
|----|------|-----|----------------|
|1|Rahul|20|rahul@mail.com|

---

# 5. Select Data

### Syntax
```sql
SELECT * FROM table_name;
```

### Example
```sql
SELECT * FROM student;
```

**Output**

| id | name | age | email |
|----|------|-----|----------------|
|1|Rahul|20|rahul@mail.com|

---

# 6. Update Data

### Syntax
```sql
UPDATE table_name
SET column=value
WHERE condition;
```

### Example
```sql
UPDATE student
SET age=21
WHERE id=1;
```

**Output**
```
1 row updated.
```

---

# 7. Delete Data

### Syntax
```sql
DELETE FROM table_name
WHERE condition;
```

### Example
```sql
DELETE FROM student
WHERE id=1;
```

**Output**
```
1 row deleted.
```

---

# 8. Alter Table

### Add Column

```sql
ALTER TABLE student
ADD phone VARCHAR(15);
```

### Drop Column

```sql
ALTER TABLE student
DROP COLUMN phone;
```

### Modify Column

```sql
ALTER TABLE student
MODIFY age BIGINT;
```

**Output**
```
Table altered successfully.
```

---

# 9. Drop & Truncate

### Remove All Records

```sql
TRUNCATE TABLE student;
```

### Delete Table

```sql
DROP TABLE student;
```

### Delete Database

```sql
DROP DATABASE college;
```

---

# 10. WHERE Clause

### Example

```sql
SELECT *
FROM student
WHERE age > 18;
```

**Output**

| id | name | age |
|----|------|-----|
|1|Rahul|20|

---

# 11. ORDER BY

### Example

```sql
SELECT *
FROM student
ORDER BY age DESC;
```

---

# 12. LIMIT

```sql
SELECT *
FROM student
LIMIT 5;
```

---

# 13. LIKE

```sql
SELECT *
FROM student
WHERE name LIKE 'R%';
```

**Output**

| name |
|------|
|Rahul|

---

# 14. BETWEEN

```sql
SELECT *
FROM student
WHERE age BETWEEN 18 AND 25;
```

---

# 15. IN

```sql
SELECT *
FROM student
WHERE age IN (18,20,22);
```

---

# 16. Aggregate Functions

### Count

```sql
SELECT COUNT(*) FROM student;
```

Output

|COUNT|
|-----|
|5|

---

### Average

```sql
SELECT AVG(age) FROM student;
```

---

### Maximum

```sql
SELECT MAX(age) FROM student;
```

---

### Minimum

```sql
SELECT MIN(age) FROM student;
```

---

### Sum

```sql
SELECT SUM(age) FROM student;
```

---

# 17. GROUP BY

```sql
SELECT age,COUNT(*)
FROM student
GROUP BY age;
```

---

# 18. HAVING

```sql
SELECT age,COUNT(*)
FROM student
GROUP BY age
HAVING COUNT(*)>1;
```

---

# 19. Joins

## INNER JOIN

```sql
SELECT s.name,d.dept_name
FROM student s
INNER JOIN department d
ON s.dept_id=d.id;
```

---

## LEFT JOIN

```sql
SELECT *
FROM student
LEFT JOIN department
ON student.dept_id=department.id;
```

---

## RIGHT JOIN

```sql
SELECT *
FROM student
RIGHT JOIN department
ON student.dept_id=department.id;
```

---

## CROSS JOIN

```sql
SELECT *
FROM student
CROSS JOIN department;
```

---

## SELF JOIN

```sql
SELECT A.name,B.name
FROM employee A
JOIN employee B
ON A.manager_id=B.id;
```

---

# 20. Foreign Key

```sql
CREATE TABLE department(
id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY(dept_id)
REFERENCES department(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);
```

---

# 21. Transactions

```sql
START TRANSACTION;

UPDATE student
SET age=22
WHERE id=1;

SAVEPOINT s1;

ROLLBACK;

COMMIT;
```

---

# 22. Views

### Create View

```sql
CREATE VIEW student_view AS
SELECT id,name
FROM student;
```

### Use View

```sql
SELECT * FROM student_view;
```

---

# 23. Index

```sql
CREATE INDEX idx_name
ON student(name);
```

Drop Index

```sql
DROP INDEX idx_name
ON student;
```

---

# 24. SQL Functions (Built-in)

## String Functions

```sql
SELECT UPPER('rahul');
```

Output

```
RAHUL
```

```sql
SELECT LOWER('RAHUL');
```

Output

```
rahul
```

```sql
SELECT LENGTH('Database');
```

Output

```
8
```

---

## Numeric Functions

```sql
SELECT ROUND(12.56);
```

Output

```
13
```

```sql
SELECT ABS(-50);
```

Output

```
50
```

---

## Date Functions

```sql
SELECT CURDATE();
```

Output

```
2026-07-23
```

```sql
SELECT NOW();
```

Output

```
2026-07-23 10:30:15
```

---

# 25. User Defined Function (UDF)

### Syntax

```sql
DELIMITER //

CREATE FUNCTION square_num(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN n*n;
END //

DELIMITER ;
```

### Call Function

```sql
SELECT square_num(5);
```

Output

|square_num(5)|
|--------------|
|25|

---

# 26. Stored Procedure

### Syntax

```sql
DELIMITER //

CREATE PROCEDURE GetStudents()
BEGIN
SELECT *
FROM student;
END //

DELIMITER ;
```

### Call Procedure

```sql
CALL GetStudents();
```

Output

| id | name | age |
|----|------|-----|
|1|Rahul|20|

---

# 27. Procedure with Parameter

```sql
DELIMITER //

CREATE PROCEDURE StudentAge(IN a INT)
BEGIN
SELECT *
FROM student
WHERE age>=a;
END //

DELIMITER ;
```

Call

```sql
CALL StudentAge(20);
```

---

# 28. Trigger

## BEFORE INSERT Trigger

```sql
DELIMITER //

CREATE TRIGGER before_insert_student
BEFORE INSERT
ON student
FOR EACH ROW
BEGIN
SET NEW.name=UPPER(NEW.name);
END //

DELIMITER ;
```

Insert

```sql
INSERT INTO student
VALUES(2,'rahul',21,'r@mail.com');
```

Output

| id | name |
|----|------|
|2|RAHUL|

---

## AFTER INSERT Trigger

```sql
CREATE TABLE student_log(
message VARCHAR(100)
);
```

```sql
DELIMITER //

CREATE TRIGGER after_insert_student
AFTER INSERT
ON student
FOR EACH ROW
BEGIN
INSERT INTO student_log
VALUES('Student Inserted');
END //

DELIMITER ;
```

Output

|message|
|--------|
|Student Inserted|

---

# 29. Trigger Types

- BEFORE INSERT
- AFTER INSERT
- BEFORE UPDATE
- AFTER UPDATE
- BEFORE DELETE
- AFTER DELETE

---

# 30. SQL Command Types

| Command | Description |
|----------|-------------|
| DDL | CREATE, ALTER, DROP, TRUNCATE |
| DML | INSERT, UPDATE, DELETE |
| DQL | SELECT |
| DCL | GRANT, REVOKE |
| TCL | COMMIT, ROLLBACK, SAVEPOINT |

---

# SQL Learning Order

1. CREATE DATABASE
2. USE DATABASE
3. CREATE TABLE
4. Constraints
5. INSERT
6. SELECT
7. UPDATE
8. DELETE
9. WHERE
10. ORDER BY
11. GROUP BY
12. Aggregate Functions
13. JOINS
14. FOREIGN KEY
15. VIEWS
16. INDEX
17. BUILT-IN FUNCTIONS
18. USER DEFINED FUNCTIONS
19. STORED PROCEDURES
20. TRIGGERS
21. TRANSACTIONS

---

# Quick Revision

| Topic | Command |
|--------|---------|
| Create Database | `CREATE DATABASE` |
| Create Table | `CREATE TABLE` |
| Insert Data | `INSERT INTO` |
| Read Data | `SELECT` |
| Update Data | `UPDATE` |
| Delete Data | `DELETE` |
| Modify Table | `ALTER TABLE` |
| Delete All Rows | `TRUNCATE` |
| Delete Table | `DROP TABLE` |
| Filter | `WHERE` |
| Sorting | `ORDER BY` |
| Grouping | `GROUP BY` |
| Aggregate | `COUNT(), SUM(), AVG(), MAX(), MIN()` |
| Joins | `INNER, LEFT, RIGHT, CROSS` |
| View | `CREATE VIEW` |
| Index | `CREATE INDEX` |
| Function | `CREATE FUNCTION` |
| Procedure | `CREATE PROCEDURE` |
| Trigger | `CREATE TRIGGER` |
| Transaction | `COMMIT, ROLLBACK, SAVEPOINT` |

---

## Practice Tip

Learn SQL in this order:

**DDL → DML → DQL → Constraints → Joins → Aggregate Functions → Views → Indexes → User Defined Functions → Stored Procedures → Triggers → Transactions**

Practice every topic using a small **Student Management System** database for better understanding.

---
⭐ If this cheat sheet helped you, consider giving the repository a **Star** on GitHub.













# MySQL Installation on Ubuntu

This guide explains how to install and configure MySQL Server on Ubuntu (20.04, 22.04, and 24.04).

---

## Prerequisites

- Ubuntu 20.04 / 22.04 / 24.04
- A user account with `sudo` privileges
- Internet connection

---

## Step 1: Update Package Index

Update the package repository before installing MySQL.

```bash
sudo apt update
```

---

## Step 2: Install MySQL Server

Install the MySQL server package.

```bash
sudo apt install mysql-server -y
```

---

## Step 3: Verify MySQL Installation

Check the status of the MySQL service.

```bash
sudo systemctl status mysql
```

If the service is not running, start and enable it.

```bash
sudo systemctl start mysql
sudo systemctl enable mysql
```

---

## Step 4: Secure MySQL Installation

Run the security script to improve the security of your MySQL installation.

```bash
sudo mysql_secure_installation
```

During the setup, you can:

- Set a root password (if applicable)
- Remove anonymous users
- Disable remote root login
- Remove the test database
- Reload privilege tables

It is recommended to answer **Y** for all security-related prompts.

---

## Step 5: Log in to MySQL

### Using Ubuntu's Default Authentication

```bash
sudo mysql
```

### Using Password Authentication

```bash
mysql -u root -p
```

Enter the root password when prompted.

---

## Step 6: Verify the Installation

Check the installed MySQL version.

### From the Terminal

```bash
mysql --version
```

Example output:

```text
mysql  Ver 8.0.xx for Linux on x86_64
```

### From the MySQL Shell

```sql
SELECT VERSION();
```

---

## Step 7: Create a Database and User (Recommended)

Create a new database.

```sql
CREATE DATABASE mydb;
```

Create a new user.

```sql
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'StrongPassword123!';
```

Grant privileges.

```sql
GRANT ALL PRIVILEGES ON mydb.* TO 'myuser'@'localhost';
```

Reload privileges.

```sql
FLUSH PRIVILEGES;
```

Exit MySQL.

```sql
EXIT;
```

---

## Useful MySQL Service Commands

### Start MySQL

```bash
sudo systemctl start mysql
```

### Stop MySQL

```bash
sudo systemctl stop mysql
```

### Restart MySQL

```bash
sudo systemctl restart mysql
```

### Check Service Status

```bash
sudo systemctl status mysql
```

---

## Troubleshooting

If you receive the following error:

```text
Package 'mysql-server' has no installation candidate
```

Run the following command to check your Ubuntu version:

```bash
lsb_release -a
```

Then verify your package sources:

```bash
sudo apt update
```

If the issue persists, share:

- Ubuntu version
- Output of `lsb_release -a`
- Complete installation error message

---

## References

- Ubuntu LTS: 20.04, 22.04, 24.04
- MySQL Server 8.x

---

## License

This guide is provided for educational purposes.
