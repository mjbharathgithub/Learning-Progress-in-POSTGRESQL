-- Create the students table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 5 AND age <= 100)
);

-- Create the courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

-- Create the enrollments table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert sample data into students
INSERT INTO students (name, email, age) VALUES
('Alice', 'alice@example.com', 20),
('Bob', 'bob@example.com', 22),
('Charlie', 'charlie@example.com', 25);

-- Insert sample data into courses
INSERT INTO courses (course_name) VALUES
('Mathematics'),
('Physics'),
('Chemistry');

-- Insert sample data into enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-01-16'),
(3, 3, '2024-01-17');
