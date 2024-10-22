-- Queries using date type--
select * from person;


select * from person where "date of transaction">'2024-10-15';

select * from person where "date of transaction" between '2024-10-16' and '2024-10-17' ;

update person
set "date of transaction"='2024-10-18'
where person_id=4;
