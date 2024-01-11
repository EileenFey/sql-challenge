-- List the employee number, last name, first name, sex, and salary of each employee
SELECT
    E.Emp_no,
    E.Last_name,
    E.First_name,
    E.Sex,
    S.Salary
FROM
    Employees E
INNER JOIN
    Salaries S ON E.Emp_no = S.Emp_no;
--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
    E.First_name,
    E.Last_name,
    E.Hire_date
FROM
    Employees E
WHERE
    EXTRACT(YEAR FROM TO_DATE(E.Hire_date, 'MM/DD/YYYY')) = 1986;
--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
    DM.Dept_no AS Department_Number,
    D.Dept_name AS Department_Name,
    DM.Emp_no AS Manager_Employee_Number,
    E.Last_name AS Manager_Last_Name,
    E.First_name AS Manager_First_Name
FROM
    Dep_manager DM
INNER JOIN
    Departments D ON DM.Dept_no = D.Dept_no
INNER JOIN
    Employees E ON DM.Emp_no = E.Emp_no;
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT
    E.Emp_no AS Employee_Number,
    E.Last_name AS Last_Name,
    E.First_name AS First_Name,
    DE.Dept_no AS Department_Number,
    D.Dept_name AS Department_Name
FROM
    Employees E
INNER JOIN
    Dep_emp DE ON E.Emp_no = DE.Emp_no
INNER JOIN
    Departments D ON DE.Dept_no = D.Dept_no;
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
    First_name,
    Last_name,
    Sex
FROM
    Employees
WHERE
    First_name = 'Hercules' AND Last_name LIKE 'B%';
--List each employee in the Sales department, including their employee number, last name, and first name
SELECT
    E.Emp_no,
    E.Last_name,
    E.First_name
FROM
    Employees E
INNER JOIN
    Dep_emp DE ON E.Emp_no = DE.Emp_no
INNER JOIN
    Departments D ON DE.Dept_no = D.Dept_no
WHERE
    D.Dept_name = 'Sales';
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
    E.Emp_no,
    E.Last_name,
    E.First_name,
    D.Dept_name
FROM
    Employees E
INNER JOIN
    Dep_emp DE ON E.Emp_no = DE.Emp_no
INNER JOIN
    Departments D ON DE.Dept_no = D.Dept_no
WHERE
    D.Dept_name IN ('Sales', 'Development');
--List the frequency counts, in descending order, of all the employee last names
SELECT
    Last_name,
    COUNT(*) AS Frequency
FROM
    Employees
GROUP BY
    Last_name
ORDER BY
    Frequency DESC;