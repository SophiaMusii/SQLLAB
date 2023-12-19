USE Company;
SELECT
   LPAD(employee_id,5,'0') as 'Employee ID',
   CONCAT_WS(" ",last_name, first_name) as 'Full name',
   --  CONCAT_WS(" ",last_name, first_name,position) as 'Full name with Position'
   CONCAT(LOWER(first_name),".",LOWER(last_name),"@company.com") as 'email'
FROM
   employee;


SELECT
   first_name 'First name',
   last_name 'Last name',
   DATE_FORMAT(employment_date, "%d %M %Y") AS 'Date of hiring',
   -- MySQL DATEDIFF() returns the number of days between two dates or datetimes.
   FORMAT(DATEDIFF(CURDATE(),employment_date)/365.22,1) 'Length of service',
   -- MySQL the TIMESTAMPDIFF() returns a value after subtracting a datetime expression from another.
   TIMESTAMPDIFF(YEAR,employment_date,CURDATE()) AS 'Years of service'
FROM
   employee;
   
SELECT
   'Count of All employee'
   AS 'Bonus eligible',
   COUNT(*) 'Count of All employee'
FROM employee
UNION
SELECT
   'Count of employees who received bonus'
   AS 'Bonus eligible',
   COUNT(*) 'Count of employees'
FROM
   employee
WHERE
   bonus IS NOT NULL;
   
   
SELECT
  MIN(rate) 'Lowest salary',
  MAX(rate) 'Highest salary',
  FORMAT(AVG(bonus),2)
  AS 'Average Bonus by Employee',
  FORMAT(SUM(bonus) / COUNT(*),2)
  AS 'Average Bonus by Company'
FROM employee;



SELECT
  COUNT(*) AS
  'Count of Offices',
  COUNT(DISTINCT city) AS
  'Count of representative offices of cities'
FROM department;



SELECT
   position AS
   'position',
   COUNT(*) AS
   'Count Employee by Position'
FROM employee
GROUP BY position;


SELECT
   department_id AS
   'Department id',
   COUNT(*) AS
   'Count of employees by Department'
FROM employee
GROUP BY department_id;

SELECT
   department_id AS
   'Department id',
   position AS
   'position',
   COUNT(*) AS
   'Count employees by Position for each Department'
FROM employee
GROUP BY department_id, position
ORDER BY COUNT(*) DESC;



SELECT
   d.department_name,
   position,
    COUNT(*)'Count Employee by Position'
FROM 
   employee e
JOIN 
   department d
ON 
   e.department_id = d.department_id
WHERE
   city = 'LVIV'
GROUP BY 
   position,d.department_id
HAVING
   COUNT(*) = 1
ORDER BY d.department_name;



SELECT
   d.department_name,
   last_name,
   first_name,
   position,
   COUNT(invoice_id) 'Employee by Sales'
FROM 
   department d
JOIN
   employee e
ON
   d.department_id = e.department_id
JOIN
   invoice i
ON 
   e.employee_id = i.employee_id
GROUP BY 
   i.employee_id
HAVING
   COUNT(invoice_id) > 10
ORDER BY COUNT(invoice_id) DESC;