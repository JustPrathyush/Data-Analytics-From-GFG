USE geeksforgeeks

SHOW TABLES

-- Create a new table named "courses" having column names as
-- 1. courseID - int (auto_increment) Primary key
-- 2. courseName - varchar(30)
-- 3. course_duration_months - int
-- 4. courseFee - int

CREATE TABLE courses(
	courseID	INT	AUTO_INCREMENT,
    courseName	VARCHAR(30)	NOT	NULL,
    course_duration_months	INT,
    courseFee	INT,
    PRIMARY KEY(courseID)
)

-- Insert four courses available on the website
INSERT INTO courses(courseName, course_duration_months, courseFee)
VALUES ("DSA", 2, 20000);
INSERT INTO courses(courseName, course_duration_months, courseFee)
VALUES ("Complete Data Analytics", 3, 22000);
INSERT INTO courses(courseName, course_duration_months, courseFee)
VALUES ("Web Development", 1, 10000);
INSERT INTO courses(courseName, course_duration_months, courseFee)
VALUES ("Data Science", 3, 25000);
INSERT INTO courses(courseName, course_duration_months, courseFee)
VALUES ("Complete Excel Mastery", 2.5, 25000);
INSERT INTO courses(courseName, course_duration_months, courseFee)
VALUES ("Java Programming", 2.5, 15000);

select * from courses

-- To check the schema of any table
DESC courses

-- Update/alter the type of course_duration_month from int to decimal(3,1)
ALTER TABLE courses MODIFY COLUMN course_duration_months DECIMAL(3,1)

-- Drop any column in table schema (ALTER TABLE courses DROP COLUMN courseFee)
-- ADD any new constraint in your table schema (ALTER TABLE courses ADD PRIMARY KEY(courseID))

-- Create a new table named "learners" having column names as:
/* learnerID - int - auto_increment
firstName - varchar(30)
lastName - varchar(30)
email - varchar(30)
phone - varchar(11)
enrollment_date - timestamp
selected_course - int (courseID)
years_of_exp - int
company_name - varchar(20)
source_of_joining - varchar(20)
batch_start_date - timestamp
location - varchar(20)
PRIMARY KEY(learnerID) [by default, not null constraint]
UNIQUE KEY(email) [by default, no not null constraint is applicable]
FOREIGN KEY(selected_course) REFERENCES courses(courseID)
*/

CREATE TABLE learners(
	learnerID	INT AUTO_INCREMENT,
    firstName	VARCHAR(30) NOT NULL,
    lastName	VARCHAR(30) NOT NULL,
    email	VARCHAR(30) NOT NULL,
    Phone	VARCHAR(30)	NOT NULL,
    enrollment_date	TIMESTAMP	NOT NULL,
    selected_course	INT	NOT NULL,
    years_of_exp	INT	NOT NULL,
    company_name	VARCHAR(30) NOT NULL,
    source_of_joining	VARCHAR(30) NOT NULL,
    Location	VARCHAR(30) NOT NULL,
    PRIMARY KEY(learnerID),
    UNIQUE KEY(email),
    FOREIGN KEY(selected_course) REFERENCES courses(courseID)
)

SELECT * FROM courses
DROP TABLE learners
SELECT * FROM learners

ALTER TABLE learners ADD COLUMN batch_start_date TIMESTAMP NOT NULL
DESC Learners


-- Insert the details of the learners
INSERT INTO learners(firstName, lastName, email, phone, enrollment_date, selected_course, years_of_exp, company_name, source_of_joining, location, batch_start_date) 
VALUES ("Kanak", "Roy", "kanak@gmail.com", '9921234567', '2024-07-14', 1, 2, 'EXL', 'LinkedIn', 'Bengaluru', '2024-07-30');

INSERT INTO learners(firstName, lastName, email, phone, enrollment_date, selected_course, years_of_exp, company_name, source_of_joining, location, batch_start_date) 
VALUES ("Debasish", "Nath", "debasish@gmail.com", '9911234567', '2024-07-11', 2, 3, 'Amazon', 'YouTube', 'Noida', '2024-08-05');

INSERT INTO learners(firstName, lastName, email, phone, enrollment_date, selected_course, years_of_exp, company_name, source_of_joining, location, batch_start_date) 
VALUES ("Rohan", "Chauhan", "rohan@gmail.com", '8921234567', '2024-07-10', 3, 5, 'PayTM', 'Insta Ads', 'Hyderabad', '2024-08-15');

INSERT INTO learners(firstName, lastName, email, phone, enrollment_date, selected_course, years_of_exp, company_name, source_of_joining, location, batch_start_date) 
VALUES ("Sadiya", "K", "sadiya@gmail.com", '8821234567', '2024-07-14', 1, 2, 'EXL', 'LinkedIn', 'Bengaluru', '2024-07-30');

INSERT INTO learners(firstName, lastName, email, phone, enrollment_date, selected_course, years_of_exp, company_name, source_of_joining, location, batch_start_date) 
VALUES ("Dinesh", "J", "dinesh@gmail.com", '9921234567', '2024-07-14', 5, 2, 'EXL', 'LinkedIn', 'Bengaluru', '2024-07-30');


SELECT * FROM learners

-- Update the lastName of "Dinesh" from "J" to "Mishra" 
-- Filter on the primary key
UPDATE learners SET lastName ="Mishra"
WHERE learnerID= 6

SELECT * FROM employee

-- Delete the employee named "Harsh Mehta" having EmpID = 7
DELETE FROM employee
WHERE EmpID=7

SELECT * FROM courses


-- Data Retrieval 
SELECT * FROM employee

-- Sort the data entries as per the salary of the people [arrange the data either in ascending or descending order]
-- ORDER BY clause [By default, sort the data in an asceding order]
-- Give me the details of the employee getting highest salary
SELECT FirstName,LastName,Salary FROM employee
ORDER BY Salary DESC
LIMIT 1

/* 	What is the order of Execution
    FROM
    SELECT
    ORDER BY
    LIMIT
*/