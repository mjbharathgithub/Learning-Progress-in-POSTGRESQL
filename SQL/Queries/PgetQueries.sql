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


--Subqueries --

SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT customer_name
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

SELECT department_id, employee_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MAX(salary) 
                                  FROM employees 
                                  GROUP BY department_id);

SELECT p.product_name, s.quantity
FROM products p
JOIN sales s ON p.product_id = s.product_id
WHERE s.quantity > (SELECT AVG(s2.quantity)
                    FROM sales s2
                    JOIN products p2 ON s2.product_id = p2.product_id
                    WHERE p2.category_id = p.category_id);




CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    salary DECIMAL(10, 2)
);

CREATE TABLE employee_salary_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_date TIMESTAMP
);

CREATE TRIGGER audit_salary_changes
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary THEN
        INSERT INTO employee_salary_audit (employee_id, old_salary, new_salary, change_date)
        VALUES (OLD.employee_id, OLD.salary, NEW.salary, NOW());
    END IF;
END;