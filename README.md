# Task 8 – Stored Procedures and Functions

## 🎯 Objective
To understand modular SQL logic by implementing stored procedures and functions in MySQL.

---

## 🧩 Tables

### Employees
- EmpID (INT, PK)
- EmpName (VARCHAR)
- Salary (INT)
- DeptID (FK → Departments.DeptID)

### Departments
- DeptID (INT, PK)
- DeptName (VARCHAR)

---

## 🛠 Components

### 🔹 Stored Procedure: `GetEmployeesByDept(dept_name)`
- Accepts a department name (e.g., 'IT')
- Returns all employees in that department

### 🔹 Stored Function: `GetBonus(salary)`
- Returns 10% bonus if salary > 60000
- Else returns 5% bonus

---
