SELECT * FROM Departments;

SELECT * FROM Employees;

SELECT EmpName,Salary
FROM Employees
WHERE Salary>50000;

SELECT * 
FROM Employees
WHERE DeptID=2

/*Alter query to display IT dept emp*/

SELECT e.*
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'IT';

SELECT e.EmpName,d.DeptName
FROM Employees e
INNER JOIN Departments d
ON e.DeptID=d.DeptID;

INSERT INTO Employees VALUES(106,'Deva',45000,'2021-06-10',NULL);

SELECT EmpName,DeptId FROM Employees WHERE DeptID IS NULL;

/* Alter Query to display employee with no department*/

SELECT e.EmpName,e.DeptID
FROM Employees e
LEFT JOIN Departments d
ON d.DeptID=e.DeptID
WHERE e.DeptID IS NULL;

SELECT d.DeptName,AVG(e.Salary) AS AvgSalary
FROM Employees e
INNER JOIN Departments d
ON e.DeptID=d.DeptID
GROUP BY d.DeptName;

SELECT DeptID,COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) >1;

SELECT EmpID,EmpName,DeptID,Salary
FROM Employees
ORDER BY DeptID ASC,Salary DESC;

SELECT DeptID,AVG(Salary) AS AvgSal
FROM Employees 
GROUP BY DeptID;

UPDATE Employees 
SET Salary=Salary*1.10
WHERE DeptID=2;

/*Checking if salary is updated or not*/

SELECT * FROM EMPLOYEES 

DELETE e
FROM Employees e
JOIN (
    SELECT EmpID
    FROM Employees
    WHERE Salary IS NULL
) AS temp
ON e.EmpID = temp.EmpID;

/* To check if record is deleted*/

SELECT * FROM Employees;

SELECT * FROM Departments;

SELECT EmpName,Salary,
	   CASE WHEN Salary<30000 THEN 'Low Salary'
            WHEN Salary BETWEEN 30000 and 50000 THEN 'Medium Salary'
		    ELSE 'High Salary'
       END AS Salarycategory
FROM Employees;

SELECT e.EmpName,
       d.DeptName,
       CASE 
           WHEN d.DeptName = 'HR' THEN 'Human Resources'
           WHEN d.DeptName = 'IT' THEN 'Technology'
           WHEN d.DeptName = 'Finance' THEN 'Finance'
           ELSE 'Other Department'
       END AS DeptCategory
FROM Employees e
JOIN Departments d
ON e.DeptID = d.DeptID;
