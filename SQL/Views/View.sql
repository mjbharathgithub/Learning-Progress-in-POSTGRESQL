--creating a view--
create view excellentStudents as
select studentname,dep
from college
where performance>=85;

select * from excellentStudents;

--deleting a view--
DROP VIEW view_name;

--Inorder to update the view you should drop it and create it again--
drop view if exists excellentStudents;
--updating a view--
create view excellentStudents as
select studentname,performance,dep
from college
where performance>=85;

--update the record in the view--
update excellentStudents
set performance =93
where studentname='KEN';