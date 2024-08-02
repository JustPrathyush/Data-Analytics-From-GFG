use geeksforgeeks

show tables

select * from learners
select * from courses

/*
	courseID	courseName					num_enrollments
    1			DSA							2
    2			Complete Data Analytics		2
    3			Web Development				2
    4			Data Science				0
    5			Complete Excel Mastery		1
				Java Programming			0
*/

Select courseID, courseName,count(selected_course) as num_enrollment
from 
courses left join learners
on courseID=selected_course
group by courseID, courseName

-- Create a new table "Orders"
select * from learners

Create table Orders(
	OrderID INT Auto_increment,
    Order_Date Timestamp not null,
    Order_Learner_Id int not null,
    OrderStatus varchar(30) not null,
    primary key(OrderID),
    foreign key(Order_Learner_Id) references learners(learnerID)
    )

Drop table orders

INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-21',1,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',6,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-02-22',3,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-15',4,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',5,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-16',7,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-13',8,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-14',4,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-22',1,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',5,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-25',1,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-11',7,'CLOSED');

select * from orders
select * from learners

SELECT Order_learner_Id as order_learners_id,Count(*) as num_orders
from orders
group by order_learner_id


-- How many total order places by each student

select order_learner_id, firstName, lastName, email,num_orders
from learners join
(select Order_Learner_Id as order_learner_id, count(*) as num_orders
from orders
group by order_learner_id)as temp
on learners.learnerID+temp.order_learner_id


-- Add one more column by the name of 'avg_orders'
select order_learner_id, firstName, lastName, email,num_orders, avg(sum(num_orders)) over() as avg_orders
from learners join
(select Order_Learner_Id as order_learner_id, count(*) as num_orders
from orders
group by order_learner_id)as temp
on learners.learnerID=temp.order_learner_id
group by order_learner_id

-- Display the premium customers of the website
/*
	num_order > avg_order
*/

-- Common Table expression

with order_counts as(select order_learner_id, firstName, lastName, email, num_orders, avg(sum(num_orders)) over() as avg_order
from learners join
(select Order_Learner_Id as order_learner_id, count(*) as num_orders
from orders
group by order_learner_id)as temp
on learners.learnerID=temp.order_learner_id
group by order_learner_id)
select firstName, lastName, num_orders,avg_order from order_counts
where num_order > avg_order
