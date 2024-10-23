-- Queries using date type--
select * from person;


select * from person where "date of transaction">'2024-10-15';

select * from person where "date of transaction" between '2024-10-16' and '2024-10-17' ;

update person
set "date of transaction"='2024-10-18'
where person_id=4;

--Scalar funcitons--

--date functions--
select extract(month from current_date),age(current_date,'2020-10-23');

--cast function--
SELECT CAST('123' AS INTEGER), '123'::INTEGER;

--window function rank--
select *,
	rank() over(partition by dep order by performance desc) as "Rank of Person"
	from college;

--user defined functions in pgsql--
CREATE FUNCTION function_name(argument1 data_type, argument2 data_type, ...)
RETURNS return_type
AS $$
    -- Function body
$$
LANGUAGE language_name;

--Simple Function--
CREATE FUNCTION greet_user(name TEXT)
RETURNS TEXT
AS $$
    RETURN 'Hello, ' || name || '!';
$$
LANGUAGE sql;

--Tax finder using IF ELSE--
CREATE FUNCTION calculate_tax(salary NUMERIC)
RETURNS NUMERIC
AS $$
    IF salary <= 50000 THEN
        RETURN salary * 0.1;
    ELSE
        RETURN salary * 0.2;
    END IF;
$$
LANGUAGE sql;

--Iterate over array--
CREATE FUNCTION sum_array(numbers INTEGER[])
RETURNS INTEGER
AS $$
DECLARE
    total INTEGER := 0;
BEGIN
    FOR number IN numbers LOOP
        total := total + number;
    END LOOP;
    RETURN total;
END;
$$
LANGUAGE plpgsql;

--factorial funciton--
create function factorial(num int)
returns int 
as $$
	declare res int :=1;
	begin
	while num!=1 loop
		res:=res*num;
		num:=num-1;
	end loop;
	return res;
	end;
$$ language plpgsql;


