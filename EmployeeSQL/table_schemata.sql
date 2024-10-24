CREATE TABLE employees (
  emp_no INT PRIMARY KEY,        -- Employee number
  emp_title_id VARCHAR(5),       -- Title ID
  birth_date DATE,               -- Birth date
  first_name VARCHAR(50),        -- First name
  last_name VARCHAR(50),         -- Last name
  sex CHAR(1),                   -- Gender (M/F)
  hire_date DATE                 -- Hire date
);
CREATE TABLE departments (
  dept_no VARCHAR(4) PRIMARY KEY,  -- Department number (unique)
  dept_name VARCHAR(40)            -- Department name
);

CREATE TABLE dept_emp (
  emp_no INT,                      -- Employee number
  dept_no VARCHAR(4),              -- Department number
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),  -- Link to employees table
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)  -- Link to departments table
);
CREATE TABLE dept_manager (
  dept_no VARCHAR(4),              -- Department number
  emp_no INT,                      -- Employee number (who is a manager)
  PRIMARY KEY (dept_no, emp_no),    -- Composite key to uniquely identify each record
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),  -- Link to departments table
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)  -- Link to employees table
);
CREATE TABLE salaries (
  emp_no INT,                      -- Employee number
  salary INT,                      -- Salary amount
  PRIMARY KEY (emp_no),            -- Employee number is the unique identifier
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)  -- Link to employees table
);
CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY,  -- Title ID (unique)
  title VARCHAR(50)                 -- Title name (e.g., Engineer, Manager)
);
ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);


