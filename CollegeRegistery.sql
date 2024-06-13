

create table admi(enrollid int,name varchar(30),
dept varchar(10));

desc admi;

drop table admi;

alter table admi modify enrollid int primary key;

alter table admi add address varchar(30);



insert into admi(enrollid,name,dept,address) values
(1,'Harish','CSE','Tirupur');
insert into admi(enrollid,name,dept,address) values
(2,'Harish','CSE','Tirupur');
truncate table admi;

update admi set name='Sathish' where enrollid=2;

delete from admi where enrollid=2;
select * from admi;


create table student(rollno varchar(12) primary key, 
name varchar(100),dept varchar(30));

create table faculty(id int primary key,name varchar(30));
create table mentor(rollno varchar(30),mentorid int,
foreign key (rollno) references student(rollno),
foreign key (mentorid) references faculty(id));

create table fees(rollno varchar(30),sem1 boolean,
sem2 boolean,sem3 boolean,sem4 boolean,sem5 boolean,
sem6 boolean, sem7 boolean,sem8 boolean);

insert into student values('1','Harish','cse'),
('2','Abijoy','cse'),
('3','Ram','ece'),
('4','Saran','ece'),
('5','Vijay','eee'),
('6','Harish','eee'),
('7','Harish','ad'),
('8','Harish','ad'),
('9','Harish','bme'),
('10','Harish','civil');

insert into faculty values(1,'Kamal'),
(2,'Vijay'),
(3,'Rajini'),
(4,'Suriya'),
(5,'Karthi'),
(6,'Vikaram');

insert into mentor values('1',1),
('2',1),
('3',2),
('4',2),
('5',3),
('6',3),
('7',4),
('8',4),
('9',5),
('10',6);

select * from student;

select * from faculty;

select * from mentor;

select dept,count(dept) from student group by dept
having count(dept)=1
order by dept desc;

select name from student where name like '%a_';

select s.rollno,s.name,dept,m.mentorid,f.name 
from student s 
join mentor m on s.rollno=m.rollno
join faculty f on m.mentorid=f.id;

create table employee(id int, name varchar(30),salary int);


insert into employee values(1,'A',10),
(2,'B',8),
(3,'C',9),
(4,'D',10);
insert into employee values(5,'E',11);

select id,name,salary from employee where
salary=(select max(salary) from employee where 
salary!=(select max(salary) from employee));
