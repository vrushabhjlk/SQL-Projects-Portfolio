Please find resource database and tables link used for doing the research: https://www.sqltutorial.org/sql-sample-database/

--6 to find those employees who work under a manager
select concat(e.first_name, ' ',e.last_name),e.salary,e.manager_id from employees e where e.manager_id is not null;

--7 to calculate the average salary for each department
select d.department_name, avg(e.salary) from employees e,departments d where e.department_id = d.department_id group by d.department_name;

--8  to find all jobs that currently have no employees assigned to them

SELECT distinct j.job_title,j.min_salary,j.max_salary 
FROM employees e
LEFT JOIN employees m ON e.employee_id = m.manager_id
left join jobs j on e.job_id = j.job_id
WHERE m.manager_id IS NULL;


--9 to find the 2nd highest salary from each city
select city,full_name,salary  from ( select l2.city ,
	concat(e.first_name,
	' ',
	e.last_name) full_name,
	e.salary, dense_rank() over (partition by l2.location_id  order by e.salary desc) rank
	from employees e left join departments d on e.department_id = d.department_id left join locations l2 on d.location_id = l2.location_id) where rank = 2;
	

---10 to rank employees within each department by their salary
select d.department_name, concat(e.first_name, ' ',e.last_name) Full_Name ,dense_rank() over (partition by e.department_id order by e.salary desc) Rank from employees e left join departments d on e.department_id = d.department_id;