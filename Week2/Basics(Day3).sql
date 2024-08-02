-- Create a new Database
CREATE DATABASE IF NOT EXISTS geeksforgeeks 
SHOW DATABASES

-- Use your selected database
USE geeksforgeeks

-- verify your current database
SELECT DATABASE()

-- Create new table - "employees"
CREATE TABLE employee(
	EmpID	INT	AUTO_INCREMENT,
    FirstName	VARCHAR(30)		NOT NULL,
    LastName	VARCHAR(30)		NOT NULL,
    Age		INT		NOT	NULL,
    Salary	INT		NOT	NULL,
    Location	VARCHAR(30)	DEFAULT "Noida"	NOT NULL,
    PRIMARY KEY(EmpID)
)

DROP TABLE employee

-- verify the available table in a given database
SHOW TABLES

-- Insert the employee details in the table named "employees"
INSERT INTO employee(FirstName, LastName, Age, Salary, Location)
VALUES("Ram","Mehta",31,30000,"Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location)
VALUES("Priya","Bhatia",26,10000,"Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary)
VALUES("Ajay","Mishra",28,45000);
INSERT INTO employee(FirstName, LastName, Age, Salary, Location)
VALUES("Harshit","Sidhwa",31,100000,"Pune");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location)
VALUES("Rashmi","Tanwar",25,25000,"Bengaluru");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location)
VALUES("Saurabh","Mishra",31,250000,"Hyderbad");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location)
VALUES("Harsh","Mehta",29,125000,"Hyderbad");

-- Read the records
SELECT * FROM employee

-- Data Retrieval Operations

-- Give me the records of the employees having salary more than 30000
-- SELECT (retrieve the records from a given table)
-- WHERE (to filter the records as per the given constraints)
SELECT FirstName, LastName, Age , Salary FROM employee
WHERE Salary>30000

-- Give me the records of the employees having age more than 28
SELECT FirstName, LastName, Age FROM employee
WHERE Age>28
