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
