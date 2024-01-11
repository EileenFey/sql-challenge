CREATE TABLE titles (
    Title_id VARCHAR(10)   NOT NULL,
    Title VARCHAR(50)   NOT NULL,
	PRIMARY KEY (Title_id)
);

CREATE TABLE employees (
    Emp_no INTEGER   NOT NULL,
    Emp_title_id VARCHAR(10)   NOT NULL,
    Birth_date VARCHAR(20)   NOT NULL,
    First_name VARCHAR(100)   NOT NULL,
    Last_name VARCHAR(100)   NOT NULL,
    Sex VARCHAR(10)   NOT NULL,
    Hire_date VARCHAR(20)   NOT NULL,
    PRIMARY KEY (Emp_no),
    FOREIGN KEY (Emp_title_id) REFERENCES Titles(Title_id)
);

CREATE TABLE departments (
    Dept_no VARCHAR(10)   NOT NULL,
    Dept_name VARCHAR(20)   NOT NULL,
	PRIMARY KEY (Dept_no)
);

CREATE TABLE dep_emp (
    Emp_no INTEGER   NOT NULL,
    Dept_no VARCHAR(10)   NOT NULL,
    FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no)
);

CREATE TABLE dep_manager (
    Dept_no VARCHAR(10)   NOT NULL,
    Emp_no INTEGER   NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no)
);

CREATE TABLE salaries (
    Emp_no INTEGER   NOT NULL,
    Salary INTEGER   NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);

SELECT
    E.Emp_no,
    E.First_name,
    E.Last_name,
    E.Sex,
    D.Dept_name
FROM
    Employees E
INNER JOIN
    Dep_emp DE ON E.Emp_no = DE.Emp_no
INNER JOIN
    Departments D ON DE.Dept_no = D.Dept_no;

SELECT
    E.First_name,
    E.Last_name,
    S.Salary,
    T.Title
FROM
    Employees E
INNER JOIN
    Salaries S ON E.Emp_no = S.Emp_no
INNER JOIN
    Titles T ON E.Emp_title_id = T.Title_id;

SELECT
    E.First_name AS Manager_First_name,
    E.Last_name AS Manager_Last_name,
    D.Dept_name
FROM
    Employees E
INNER JOIN
    Dep_manager DM ON E.Emp_no = DM.Emp_no
INNER JOIN
    Departments D ON DM.Dept_no = D.Dept_no;