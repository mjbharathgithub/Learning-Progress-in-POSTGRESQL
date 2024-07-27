drop table if exists student;
create table student(
 student_id serial,
	first_name text ,
	last_name text ,
	gpa decimal(4,2),  --decimal(precision,scale)--
	enrollment_date timestamp,
	major text
);

drop table if exists program_table;
create table program_table(
student_ref_id int,
program_name text,
program_start_date timestamp,
foreign key(student_ref_id) references student(student_id)
);

drop table if exists scholarShip;
create table scholarship(
student_ref_id int,
scholarship_amount bigint,
scholarship_date timestamp,
foreign key(student_ref_id) references student(student_id)
);

--change the first_name to uppercase and print it--
select upper(first_name) from student;

--select firs_name whose first character is in capital--
select first_name from student
where substring(first_name from 1 for 1)=upper(substring(first_name from 1 for 1));

--select distinct subjects --
select distinct(major) from student order by major asc; -- or select major from student group by student;--

--select first three character in a string--
select substring(first_name from 1 for 3) from student ;

--select distinct string and print their length--
select major,length(major) from student group by(major) order by length(major) asc; --or  SELECT DISTINCT MAJOR, LENGTH(MAJOR) FROM Student;--

-- replace 'a' with 'A' in first_name and print it--
select replace(first_name,'a','A') from student;
