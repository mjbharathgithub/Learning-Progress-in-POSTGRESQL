
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