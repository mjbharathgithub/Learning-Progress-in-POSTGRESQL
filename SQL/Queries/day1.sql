1.drop table if exists student;
2.create table student(
 student_id serial,
	first_name text ,
	last_name text ,
	gpa decimal(4,2),  --decimal(precision,scale)--
	enrollment_date timestamp,
	major text
);

drop table if exists program_table;
3.create table program_table(
student_ref_id int,
program_name text,
program_start_date timestamp,
foreign key(student_ref_id) references student(student_id)
);

4.drop table if exists scholarShip;
create table scholarship(
student_ref_id int,
scholarship_amount bigint,
scholarship_date timestamp,
foreign key(student_ref_id) references student(student_id)
);

5)--change the first_name to uppercase and print it--
select upper(first_name) from student;

6)--select firs_name whose first character is in capital--
select first_name from student
where substring(first_name from 1 for 1)=upper(substring(first_name from 1 for 1));

7)--select distinct subjects --
select distinct(major) from student order by major asc; -- or select major from student group by student;--

8)--select first three character in a string--
select substring(first_name from 1 for 3) from student ;

9)--select distinct string and print their length--
select major,length(major) from student group by(major) order by length(major) asc; --or  SELECT DISTINCT MAJOR, LENGTH(MAJOR) FROM Student;--

-- replace 'a' with 'A' in first_name and print it--
10)select replace(first_name,'a','A') from student;


--------------------------------------------------------------------- DAY 2 -------------------------------------------------------------------------------------

11)--To concat two strings from two columns and print it as a single column--
select concat(first_name,' ',last_name) as "Complete Name" from student;
-- OR--
select first_name||' '||last_name as "Complete Name" from student;

12)--select first_name in asc and major in desc --	
SELECT first_name, major, gpa
FROM Student
ORDER BY first_name ASC, major DESC;

13)--select specific student details from the table USED IN which acts as multiple OR--
select *
from student
where first_name in('Prem','Shivansh');

14)--SQL query to print details of the Students excluding FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.--
select *
from student
where first_name not in('Prem','Shivansh');

15)--Write a SQL query to print details of the Students whose FIRST_NAME ends with ‘a’.--
select *
from student
where first_name like '%a';

--------------------------------------------------------------------- DAY 3 -------------------------------------------------------------------------------------
-- Write an SQL query to list STUDENT_ID who does not get Scholarship.--
select *
from student
where student_id not in(select student_ref_id from scholarship);

-- Write an SQL query to fetch the first 50% records from a table. --
select *
from student
limit (select count(student_id) from student)/2 offset 0;

-- Write an SQL query to fetch the MAJOR subject that have more than 1 people in it. --
select major
from student
group by (major) having count(major)>1;

--Write an SQL query to show all MAJOR subject along with the number of people in there.--
select major,count(major) as "students Count"
from student
group by (major);

-- Write an SQL query to show the last record from a table. (no numbers or id)--
with lastStudent as(
	select *,
	row_number() over (order by (select null)) as row_num
	from student
)
select * from lastStudent 
order by row_num desc
limit 1;

-- Select first row from table--
select * from student limit  1;

--select last five records with student_id--
select * from
	(
		select * from student
		order by student_id desc
		limit 5
	) as "Last Five"
	order by student_id;

--select last five records without student_id--
with lastFiveRecords as
 (
	 select *,
	 row_number() over (order by(select null)) row_num
	 from student
 )
 
 select * from
 	(select * from lastFiveRecords
 	order by row_num desc
	 limit 5) as "Last five Records"
 order by row_num;	 

--Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.--
select major , max(gpa)
from student 
group by major;

--Select the name of the student with max gpq--
select concat(first_name,' ',last_name) as full_name,gpa
from student
where gpa=(select max(gpa) from student);

--clone a table and create another table--
create table student_clone as select * from student;

--update gpa of mathematics major--
select * from student order by student_id;

--select the major and their averages--
select major,avg(gpa) as "major average"
from student
group by major;

--top 3 gpa students--
select * from student
order by gpa desc
limit 3;

--cognizant multiple  table join question--
select u.user_id,a.user_address,p.status
from users u
inner join address a on u.user_add=a.add_id
inner join payment p on p.payment_id=u.user_stat
where p.status='true';

 -- Joins – Inner, Left, Right, Full
 -- Aggregates – COUNT, AVG, SUM, GROUP BY, HAVING
 -- Subqueries – Correlated & Non-Correlated
 -- Window Functions – ROW_NUMBER(), RANK(), DENSE_RANK()
 -- Data Manipulation – INSERT, UPDATE, DELETE
 -- Performance Tips – Indexing, EXPLAIN
