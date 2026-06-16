# Write your MySQL query statement below
with ranked_empl as 
(select d.name as Department, e.name as Employee, salary, dense_rank() over (partition by departmentId order by salary desc) as salary_rank from Employee e
join Department d
on e.departmentId=d.id)

select Department, Employee, salary from ranked_empl 
where salary_rank<=3;
