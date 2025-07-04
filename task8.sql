-- Step 1: Drop existing procedure and function if they exist
DROP PROCEDURE IF EXISTS GetEmployeesByDept;
DROP FUNCTION IF EXISTS GetBonus;

-- Step 2: Create sample tables
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Step 3: Insert sample data
INSERT INTO Departments VALUES
(1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO Employees VALUES
(101, 'Alice', 60000, 1),
(102, 'Bob', 50000, 2),
(103, 'Charlie', 45000, 2),
(104, 'David', 70000, 3),
(105, 'Eva', 30000, 1);

-- Step 4: Create a Stored Procedure
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT E.EmpName, E.Salary, D.DeptName
    FROM Employees E
    JOIN Departments D ON E.DeptID = D.DeptID
    WHERE D.DeptName = dept_name;
END //
DELIMITER ;

-- Step 5: Call the Procedure
CALL GetEmployeesByDept('IT');

-- Step 6: Create a Stored Function
DELIMITER //
CREATE FUNCTION GetBonus(salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE bonus INT;
    IF salary > 60000 THEN
        SET bonus = salary * 0.10;
    ELSE
        SET bonus = salary * 0.05;
    END IF;
    RETURN bonus;
END //
DELIMITER ;

-- Step 7: Use the Function in a SELECT query
SELECT EmpName, Salary, GetBonus(Salary) AS Bonus FROM Employees;
