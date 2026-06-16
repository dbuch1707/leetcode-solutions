# Write your MySQL query statement below
with rankedEmployees as (select d.name as Department, e.name as Employee, salary, max(salary) over (partition by departmentId) as max_salary from Employee e
left join Department d
on e.departmentId=d.id
)

select Department, Employee, max_salary as salary from rankedEmployees where salary=max_salary