CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

CREATE INDEX idx_lastname ON Employees (LastName);


CREATE VIEW EmployeeView AS
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 50000;


ALTER TABLE Employees
ADD Email VARCHAR(100);

ALTER TABLE Employees
DROP COLUMN Email;


TRUNCATE TABLE Employees;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE INDEX idx_departmentname ON Departments (DepartmentName);

INSERT INTO Employees (EmployeeID, FirstName, LastName, BirthDate, HireDate, Salary)
VALUES 
(2, 'Jane', 'Smith', '1990-07-25', '2019-05-10', 60000.00),
(3, 'Alice', 'Johnson', '1985-10-30', '2018-11-15', 65000.00);


-- Retrieve all columns for employees with a salary greater than 60,000
SELECT * FROM Employees WHERE Salary > 60000;

-- Retrieve first name, last name, and hire date, ordered by hire date
SELECT FirstName, LastName, HireDate FROM Employees ORDER BY HireDate;

-- Count the number of employees in each department
SELECT DepartmentID, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentID;



-- Insert a single row
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'Human Resources');

-- Insert multiple rows
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (2, 'Finance'), (3, 'IT'), (4, 'Marketing');

