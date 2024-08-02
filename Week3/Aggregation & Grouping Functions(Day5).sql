USE geeksforgeeks

SHOW TABLES

SELECT * FROM courses
SELECT * FROM employee
SELECT * FROM learners

-- Give me the total number of employees working in GFG ??
SELECT Count(*) AS total_emp 
FROM employee

-- How many  different sources of joining [nums] by the  learners??
SELECT Count(DISTINCT source_of_joining) AS diff_source_of_joining
FROM learners

-- How many numbers of learners have joined the courses in th month of july?
-- Adding two more insertion 08 for enrollment_date

INSERT INTO learners(firstName, lastName, email, phone, enrollment_date, selected_course, years_of_exp, company_name, source_of_joining, location, batch_start_date) 
VALUES ("Swati", "Sinha", "swati@gmail.com", '9911234567', '2024-08-1', 2, 3, 'Amazon', 'YouTube', 'Noida', '2024-08-05');

INSERT INTO learners(firstName, lastName, email, phone, enrollment_date, selected_course, years_of_exp, company_name, source_of_joining, location, batch_start_date) 
VALUES ("Devpriya", "Nath", "devpriyagmail.com", '9911234567', '2024-08-3', 3, 3, 'Amazon', 'YouTube', 'Noida', '2024-08-05');

SELECT * FROM learners


SELECT Count(*) AS num_learners_enrolled_july
FROM learners
WHERE enrollment_date LIKE "%-07-%"

-- How many numbers of learners have joined the courses in year of 2024?
SELECT COUNT(*) AS num_learners_enrolled_2024
FROM learners
where enrollment_date LIKE "%2024%"

-- Grouping: For any specific column, if you want to specify the unique set of values and want to do aggregation on top of that
-- That is where the need of grouping comes into picture
/*
-- How many learners enrolled via unique source of joining?
-- Insights: Which specific medium in future I need to focus more on for the advertisement purpose

	source_of_joining		number_learners_enrolled
    LinkedIn				3
    YouTube					3
    Insta Ads				1
*/
DESC learners

SELECT source_of_joining, location, COUNT(*) AS number_learners_enrolled
FROM learners
GROUP BY source_of_joining, location

SELECT * FROM learners

-- IMPORTANT POINT: Non-aggregated columns after SELECT command you have to use after GROUP BY clause.
/*
	SELECT source_of_joining, location,  COUNT(*) AS number_learners_enrolled
    FROM learners
    GROUP BY source_of_joining
    
    --not possible (most developer fail here)
*/

-- How many students have enrolled in each course
/*
	SELECTED_COURSE			NUM_STUDENTS_ENROLLED
    1						2
    2						2
    3						2
    5						1
*/

SELECT * FROM learners

SELECT selected_course, COUNT(*) AS num_students_enrolled
FROM learners
GROUP BY selected_course


-- Another way (Today i think this make more sense)
SELECT selected_course, COUNT(selected_course) AS num_students_enrolled
FROM learners
GROUP BY selected_course

-- Corresponding to each "location", what is the average years of experience learner hold
/*
	LOCATION			AVG_YEARS_OF_EXP
    bengaluru			2
    noida				3
    hyderbad			5
*/
SELECT * FROM learners

SELECT location, AVG(years_of_exp) AS avg_years_of_exp
FROM learners
GROUP BY location

-- Corresponding to each source_of_joining, what is the maximun years of experience learner hold
/*
	SOURCE OF JOINING			MAX_YEARS_OF_EXP
    linkedin					2
    youtube						3
    InstaAds					5
*/
SELECT * FROM learners

SELECT source_of_joining, MAX(years_of_exp) AS max_years_of_exp
FROM learners
GROUP BY source_of_joining

/* 	What is the order of Execution
    FROM
    GROUPBY
	SELECT
    (I guess this is done for more efficency)
*/

----------------------------------------------------------------------------------------------------------------------------------------------
-- Logical Operation in SQL --> Multiple Conditions
-- AND	(all the conditions to be satisfied)
-- OR	(anyone of the condition to be sarisfied)
-- NOT	(Reverse the results)

-- Display the First Name, Last Name if those learners whose source_of_joining is LinkedIn AND the location is Bengaluru
SELECT * FROM learners

SELECT firstName, lastName
FROM learners
WHERE source_of_joining="LinkedIN" AND Location="Bengaluru" 

-- Display the First Name, Last Name if those learners whose source_of_joining is LinkedIn OR the location is Hyderbad
SELECT firstName, lastName
FROM learners
WHERE source_of_joining="LinkedIN" OR Location="Hyderabad" 

-- Display the First Name, Last Name if those learners who doesnt have the years of experience between 1 to 3
SELECT firstName, lastName
FROM learners
where years_of_exp NOT BETWEEN 1 and 3

-- Display the entire columns which doesnot have course name as DSA
SELECT courseName FROM courses
where courseName !="DSA"

-- Another way
SELECT courseName FROM courses
where courseName NOT LIKE "DSA"

----------------------------------------------------------------------------------------------------------------------------------------------

-- Corresponding to each Noida "location", what is the average years of experience learner hold
/*
	LOCATION			AVG_YEARS_OF_EXP
    bengaluru			2
    noida				3
    hyderbad			5
*/
SELECT * FROM learners

-- HAVING CLAUSE: It also serves the purpose of filteration after GROUP BY
-- IMPORTANT POINT: If you want to do the filtration ~before~ GROUP BY (WHERE)
-- If you want to do the filteration ~after~ GROUP BY (HAVING)

-- Approach 1 (MORE OPTIMIZED APPROACH)
SELECT location,  AVG(years_of_exp) AS avg_years_of_exp
FROM learners
WHERE location="Noida"
GROUP BY location

-- Approach 2
SELECT location,  AVG(years_of_exp) AS avg_years_of_exp
FROM learners
GROUP BY location
HAVING location="Noida"





