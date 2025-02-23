Hellow Viewers, While learning SQL, I've tried making queries to do some research and answer to some Questionnaire
	
Please find resource database and tables link used for doing the research: https://www.sqltutorial.org/sql-sample-database/

--1 To find those employees whose salaries are less than 6000. Return full name (first and last name) and salary.
select concat(employees.first_name, ' ',employees.last_name), employees.salary from employees where employees.salary > '6000';

--2 To find those employees whose last name ends with "a". Return first name, last name, and department ID
select
	e.first_name,
	e.last_name,
	e.department_id
from
	employees e
where
	e.last_name like '%a';

--3 To find the details of the ‘IT’ department
select
	*
from
	departments d,
	locations l
where
	d.department_name = 'IT'
	and d.location_id = l.location_id ;

--4 To count the number of employees working in each location. Return the location city and the number of employees
select
	l.city,
	count(e.employee_id) as "Employees_Count"
from
	employees e,
	locations l,
	departments d
where
	e.department_id = d.department_id
	and d.location_id = l.location_id
group by
	l.city;


--5 To find all employees who were hired after January 1st, 1995. Return their first name, last name, hire date, and job title
select
	e.first_name,
	e.last_name,
	e.hire_date,
	j.job_title
from
	employees e,
	jobs j
where
	e.hire_date > '1995-01-01'
	and e.job_id = j.job_id
order by
	e.hire_date;
