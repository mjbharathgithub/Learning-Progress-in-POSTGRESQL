-- Create a table that violates 1NF by having non-atomic values
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    courses VARCHAR(100) -- Storing multiple courses in a single column
);

-- Insert data into the table
INSERT INTO students (name, courses) VALUES 
('John Doe', 'Math,Science'),
('Jane Smith', 'English,Art');

-- Fix the table to comply with 1NF by splitting the courses into separate rows
CREATE TABLE students_1nf (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE student_courses (
    student_id INT,
    course VARCHAR(50),
    PRIMARY KEY (student_id, course),
    FOREIGN KEY (student_id) REFERENCES students_1nf(student_id)
);

-- Insert normalized data
INSERT INTO students_1nf (name) VALUES ('John Doe'), ('Jane Smith');
INSERT INTO student_courses (student_id, course) VALUES 
(1, 'Math'), (1, 'Science'), 
(2, 'English'), (2, 'Art');






-- Create a table that violates 2NF with partial dependency
CREATE TABLE enrollment (
    student_id INT,
    course_id INT,
    student_name VARCHAR(100),
    course_name VARCHAR(100),
    PRIMARY KEY (student_id, course_id)
);

-- Insert data into the table
INSERT INTO enrollment (student_id, course_id, student_name, course_name) VALUES 
(1, 101, 'John Doe', 'Math'),
(1, 102, 'John Doe', 'Science'),
(2, 103, 'Jane Smith', 'English');

-- Fix the table to comply with 2NF by removing partial dependencies
CREATE TABLE students_2nf (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students_2nf(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert normalized data
INSERT INTO students_2nf (name) VALUES ('John Doe'), ('Jane Smith');
INSERT INTO courses (course_name) VALUES ('Math'), ('Science'), ('English');
INSERT INTO enrollments (student_id, course_id) VALUES 
(1, 1), (1, 2), 
(2, 3);


-- Create a table that violates 3NF with transitive dependency
CREATE TABLE student_info (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    course_id INT,
    course_name VARCHAR(100),
    instructor_name VARCHAR(100)
);

-- Insert data into the table
INSERT INTO student_info (student_name, course_id, course_name, instructor_name) VALUES 
('John Doe', 101, 'Math', 'Prof. Smith'),
('John Doe', 102, 'Science', 'Dr. Brown'),
('Jane Smith', 103, 'English', 'Prof. Clark');

-- Fix the table to comply with 3NF by removing transitive dependencies
CREATE TABLE students_3nf (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE courses_3nf (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    instructor_name VARCHAR(100)
);

CREATE TABLE enrollments_3nf (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students_3nf(student_id),
    FOREIGN KEY (course_id) REFERENCES courses_3nf(course_id)
);

-- Insert normalized data
INSERT INTO students_3nf (student_name) VALUES ('John Doe'), ('Jane Smith');
INSERT INTO courses_3nf (course_name, instructor_name) VALUES 
('Math', 'Prof. Smith'), 
('Science', 'Dr. Brown'), 
('English', 'Prof. Clark');
INSERT INTO enrollments_3nf (student_id, course_id) VALUES 
(1, 1), (1, 2), 
(2, 3);
