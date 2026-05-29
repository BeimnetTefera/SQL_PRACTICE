-- Technique :- Self Join 
SELECT 
  e.employee_id,
  e.name AS employee_name
FROM employee AS e 
JOIN  employee AS m
ON m.employee_id = e.manager_id
WHERE e.salary > m.salary
