USE geeksforgeeks_db

SHOW TABLES

SELECT * FROM employee

-- Corresponding to each location [employee], 
-- what is the total count of employee belonging to that location and the average salary of them.
/*
	location		total_employee		avg_salary
	Bengaluru		3					(30000+10000+25000)/3
    Noida			1					45000
    Pune			1					100000
    Hyderabad		1					250000
*/

SELECT Location, count(Location) as total_employee, avg(Salary) as avg_salary
FROM employee
GROUP BY Location

-- what is the firstName, lastName, location, total count of employee belonging to that location and the average salary of them.
-- subqueries -> one query and inside that there is another query(Like nested loop)

-- Approach 1 - Joins (Computationally Expensive Task [time required to execute the command is more])

SELECT * FROM employee

SELECT FirstName, LastName, employee.Location, total_employee, avg_salary
FROM employee
JOIN
(SELECT Location, count(Location) as total_employee, avg(Salary) as avg_salary
FROM employee
GROUP BY Location) as temp
ON employee.Location = temp.Location

-- Approach 2 - Window Functions

SELECT * FROM employee

SELECT First_Name, Last_Name, Location,
COUNT(Location) OVER (PARTITION BY Location) total_employee,
AVG(Salary) OVER (PARTITION BY Location) avg_salary
FROM employee

-- Prioritize of employees as per the salary in the descending order
SELECT First_Name, Last_Name, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee

-- Inserting two records in employee table having salary as 100000 and 45000
INSERT INTO employee(First_Name, Last_Name, Age, Salary, Location) VALUES ("Pramod", "Kumar", 26, 10000, "Noida");
INSERT INTO employee(First_Name, Last_Name, Age, Salary, Location) VALUES ("Rohan", "Bhatia", 27, 45000, "Hyderabad");

-- RANK() -> ranking with skipping numeric data for which the ranks are same
SELECT First_Name, Last_Name, Salary,
RANK() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee

-- DENSE_RANK() -> ranking without skipping any numeric data
SELECT First_Name, Last_Name, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) as Priority_Salary
FROM employee

-- ROW_NUMBER() vs RANK() vs DENSE_RANK()

-- Give me the details of those employee who are having 2nd highest salary
SELECT*FROM
(SELECT First_Name, Last_Name, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) as priority_salary
FROM employee) as Temp
WHERE priority_salary=2