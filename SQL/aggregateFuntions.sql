
-- Aggregate funtions used as subqueries--
--find max score in the college--
SELECT studentname, dep, performance as "Student with Maximum Score"
FROM college
WHERE performance = (SELECT MAX(performance) FROM college);

--get the max performance of students from each department--
WITH MaxPerformance AS (
    SELECT dep, MAX(performance) AS max_performance
    FROM college
    GROUP BY dep
)
SELECT c.studentname, c.dep, c.performance
FROM college c
JOIN MaxPerformance mp
ON c.dep = mp.dep AND c.performance = mp.max_performance
ORDER BY c.dep, c.performance DESC;

--find avg--
select avg(performance) as "Average performance of Students" from college;


--Make all these operations--
select
dep as "Department",
count(studentname) as "Number Of Students",
max(performance) as "Max Performance",
avg(performance) as "Average Performance"
from college

group by dep

order by count(studentname) desc;


--finding nth highest score--
select * from college
order by performance desc
limit 1 offset 0 ;

--distinct nth highest score--
SELECT DISTINCT ON (performance) studentname, performance, dep
FROM college
ORDER BY performance DESC
LIMIT 2 OFFSET 0;

--display the duplicate along with their frequencies--
--In the example retuned the dep which have more than one student--
select dep,count(dep)
from college
group by(dep)
having count(dep)>=2
order by count(dep) desc;

--pattern matching NOTE: ITS CASE SENSITIVE ar is not same as Ar or AR or aR --

--return the names having 'ar' in their name--
select studentname 
from college
where studentname like '%ar%'

--names without ar--
select studentname 
from college
where studentname not like '%ar%'

--return name with length exactly 5--
select studentname 
from college
where studentname like '_____'

--return name with 3rd letter a--
select studentname 
from college
where studentname like '__a%'

--return the students joined collge during june--
--eventhough the joinDate field is in date type since its string the pattern can be matched--
select studentname
from college
where joinDate like '%june%'

--display the studentname with exactly two aa any where in the name--
select studentname 
from college
where studentname like '%a%a%'

--display the studentname with exactly two ee any consequtively in the name--
select studentname 
from college
where studentname like '%ee%'

--display studentname whose name starts with J and ends with h--
select studentname 
from college
where studentname like 'J%h'

