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

SELECT d.DeptName,e.EmpName
FROM Departments d
LEFT JOIN Employees e
ON d.DeptID=e.DeptID
WHERE e.EmpID IS NULL;

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

SELECT EmpName,Salary
FROM Employees 
WHERE Salary>
(SELECT AVG(Salary) FROM Employees);

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

