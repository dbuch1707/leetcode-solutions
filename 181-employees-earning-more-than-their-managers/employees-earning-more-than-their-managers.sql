# Write your MySQL query statement below
select e.name as Employee from Employee e
join Employee mgr 
on e.managerId = mgr.id
where e.salary>mgr.salary;