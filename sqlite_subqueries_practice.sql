
-- SQLite Script: Subqueries and Nested Queries Practice

-- Drop existing tables if they exist
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS projects;

-- Create departments table
CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT
);

-- Create employees table
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    salary INTEGER,
    dept_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

-- Create projects table
CREATE TABLE projects (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    emp_id INTEGER,
    FOREIGN KEY (emp_id) REFERENCES employees(id)
);

-- Insert sample data into departments
INSERT INTO departments (id, name, location) VALUES
(1, 'HR', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Marketing', 'Chicago');

-- Insert sample data into employees
INSERT INTO employees (id, name, salary, dept_id) VALUES
(1, 'Alice', 60000, 1),
(2, 'Bob', 75000, 2),
(3, 'Charlie', 50000, 1),
(4, 'David', 85000, 2),
(5, 'Eva', 55000, 3),
(6, 'Frank', 90000, 2);

-- Insert sample data into projects
INSERT INTO projects (id, name, emp_id) VALUES
(1, 'Project X', 2),
(2, 'Project Y', 4),
(3, 'Project Z', 6);

-- ===========================
-- Example Queries with Subqueries
-- ===========================

-- 1. Scalar Subquery in SELECT
SELECT name,
       (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;

-- 2. Subquery in WHERE with IN
SELECT name FROM employees
WHERE dept_id IN (SELECT id FROM departments WHERE location = 'New York');

-- 3. Subquery in WHERE with EXISTS
SELECT name FROM employees e
WHERE EXISTS (
    SELECT 1 FROM projects p WHERE p.emp_id = e.id
);

-- 4. Subquery in FROM (Derived Table)
SELECT dept, avg_salary FROM (
    SELECT dept_id AS dept, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS dept_avg;

-- 5. Correlated Subquery
SELECT name, salary FROM employees e
WHERE salary > (
    SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id
);
