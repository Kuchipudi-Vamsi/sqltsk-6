To practice advanced SQL techniques by writing and understanding queries that use subqueries in different parts of an SQL statement. This strengthens our ability to solve complex data problems by breaking them down into smaller, manageable queries.

What’s Included in the File?
🔹 Three Tables Created
departments
Contains department info: id, name, and location

employees
Contains employee info: id, name, salary, and a foreign key dept_id to departments

projects
Contains project info: id, name, and which employee (emp_id) is assigned

📥 Sample Data:
Each table has multiple rows to simulate a realistic company scenario.
Data variety allows multiple query conditions and relationships.

🔍 Queries We’ll Practice
1. Scalar Subquery in SELECT:
SELECT name,
       (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
This adds a column showing the average salary of all employees next to each employee's name.

2. Subquery in WHERE with IN:
SELECT name FROM employees
WHERE dept_id IN (SELECT id FROM departments WHERE location = 'New York');
Finds employees who work in departments located in New York.

3. Subquery in WHERE with EXISTS:
SELECT name FROM employees e
WHERE EXISTS (
    SELECT 1 FROM projects p WHERE p.emp_id = e.id
);
Returns employees who are assigned to at least one project.

4. Subquery in FROM Clause:
SELECT dept, avg_salary FROM (
    SELECT dept_id AS dept, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS dept_avg;
Creates a temporary table (dept_avg) showing average salary by department, and selects from it.

5. Correlated Subquery:
SELECT name, salary FROM employees e
WHERE salary > (
    SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id
);

This is a correlated subquery because the inner query uses a value from the outer query (e.dept_id).

Learning Outcome:
After completing this task, we should be able to:

Understand the difference between scalar, correlated, and derived subqueries
Know when to use subqueries with IN, EXISTS, or = comparisons
Build complex SQL logic by combining multiple query layers
