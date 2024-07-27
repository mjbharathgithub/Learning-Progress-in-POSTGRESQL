drop table if exists student;
create table student(
 student_id serial,
	first_name text ,
	last_name text ,
	gpa decimal(4,2),
	enrollment_date timestamp,
	major text
);
