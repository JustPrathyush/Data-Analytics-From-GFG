USE geeksforgeeks

show tables

select * from courses

-- as per the courseFee, we need to categize the course as Expensive, Moderatw or Cheeap
-- If courseFee > 20000 -> Expensive, courseFee >13000 -> moderate, otherwise its a cheap course

SELECT CourseID, courseName, courseFee,
Case
when courseFee >20000 then "Expensive"
when courseFee >14000 then "Moderate"
Else "Cheap"
END as cateogy
From courses

-- CASE EXPRESSIONS
SELECT CourseID, courseName, courseFee
Case courseFee
when 20000 then "Expensive"
when 14000 then "Moderate"
Else "Cheap"
END as cateogy
from courses