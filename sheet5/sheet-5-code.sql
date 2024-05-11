-- procedure to connect to mysql shell
-- \ sql ENTER
-- \ connect root@localhost
-- password (nm@y)

USE assignment_2_DBMS_lab;


DROP TABLE IF EXISTS DEPT;
DROP TABLE IF EXISTS EMP;

-- table creation ***************************************************
-- Create the DEPT table
CREATE TABLE DEPT (
    DEPTNO CHAR(3) CHECK (DEPTNO LIKE 'D%') PRIMARY KEY,
    DNAME VARCHAR(20) CHECK (DNAME IN ('Accounting', 'Sales', 'Research', 'Operations')),
    LOC VARCHAR(20)
);

-- Create the EMP table
CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(30),
    JOB VARCHAR(10) CHECK (JOB IN ('Clerk', 'Salesman', 'Manager', 'Analyst', 'President')),
    MGR INT,
    HIREDATE DATE,
    SAL INT,
    COMM INT DEFAULT 0 CHECK (COMM < 1500),
    DEPTNO CHAR(3) REFERENCES DEPT(DEPTNO)
);


-- Insert values into the DEPT table
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES
('D01', 'Accounting', 'New York'),
('D02', 'Sales', 'Los Angeles'),
('D03', 'Research', 'Chicago'),
('D04', 'Operations', 'Houston'),
('D05', 'Sales', 'New York'),
('D06', 'Accounting', 'Los Angeles'),
('D07', 'Sales', 'Chicago'),
('D08', 'Sales', 'Houston'),
('D09', 'Research', 'New York'),
('D10', 'Sales', 'Los Angeles'),
('D11', 'Research', 'Chicago'),
('D12', 'Research', 'Houston'),
('D13', 'Operations', 'New York'),
('D14', 'Research', 'Los Angeles'),
('D15', 'Operations', 'Chicago'),
('D16', 'Sales', 'Houston'),
('D17', 'Sales', 'New York'),
('D18', 'Operations', 'Los Angeles'),
('D19', 'Research', 'Chicago'),
('D20', 'Research', 'New York'),
('D21', 'Research', 'Bangalore'),
('D22', 'Operations', 'Houston');



-- Insert values into the EMP table
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES

(7001, 'Anish', 'Clerk', 7006, '2023-01-15', 3000, 100, 'D01'),
(7002, 'Devika', 'Salesman', 7006, '2022-11-20', 4000, 500, 'D02'),
(7003, 'Sudip', 'Manager', 7006, '2022-09-05', 6000, 300, 'D03'),
(7004, 'Sagar', 'Analyst', 7024, '2023-02-10', 5500, 1000, 'D04'),
(7005, 'Tanis', 'Clerk', 7003, '2022-12-30', 3200, 200, 'D09'),
(7006, 'Kota', 'Clerk', 7006, '2023-01-15', 3000, 150, 'D10'),
(7007, 'Joyobroto', 'Salesman', 7024, '2022-11-20', 4000, 500, 'D20'),
(7008, 'Vivek', 'Manager', 7006, '2022-09-08', 6000, 0, 'D11'),
(7009, 'Aheli', 'Analyst', 7003, '2023-02-10', 5500, 1000, 'D02'),
(7010, 'Sumeet', 'Clerk', 7003, '2022-12-30', 3200, 600, 'D15'),
(7011, 'Subham', 'Clerk', 7006, '2023-01-15', 3000, 0, 'D16'),
(7012, 'Oishika', 'Salesman', 7024, '2022-11-20', 4000, 500, 'D17'),
(7013, 'Fardeen', 'Manager', 7006, '2022-09-05', 6000, 450, 'D20'),
(7014, 'Devans', 'Analyst', 7003, '2023-02-10', 5500, 1000, 'D10'),
(7015, 'Raksha', 'Clerk', 7003, '2022-12-30', 3200, 120, 'D12'),
(7016, 'Dinesh', 'Clerk', 7006, '2023-01-12', 3000, 240, 'D08'),
(7017, 'Ayush', 'Salesman', 7006, '2022-11-20', 4000, 500, 'D08'),
(7018, 'Priya', 'Manager', 7006, '2022-09-05', 6000, 630, 'D07'),
(7019, 'Dipmay', 'Analyst', 7024, '2023-02-10', 5500, 1000, 'D16'),
(7020, 'Pantho', 'Clerk', 7003, '2022-12-12', 3200, 150, 'D16'),

(7021, 'Raj', 'Clerk', 7006, '2023-01-15', 3000, 180, 'D18'),
(7022, 'Wridhhiraj', 'Salesman', 7006, '2022-11-20', 4000, 500, 'D20'),
(7023, 'Roushan', 'Manager', 7006, '2022-09-05', 6000, 260, 'D18'),
(7024, 'Prayas', 'Analyst', 7024, '2023-02-10', 5500, 1000, 'D19'),
(7025, 'Sourik', 'Clerk', 7024, '2022-12-30', 3200, 140, 'D40'),
(7026, 'Tanuj', 'Clerk', 7006, '2023-01-15', 3000, 580, 'D10'),
(7027, 'Aishika', 'Salesman', 7006, '2022-11-20', 4000, 510, 'D19'),
(7028, 'Rajkumar', 'Manager', 7006, '2022-09-18', 6000, 600, 'D30'),
(7029, 'Ashlesha', 'Analyst', 7003, '2023-02-10', 5500, 1000, 'D17'),
(7030, 'Sayak', 'Clerk', 7003, '2022-12-14', 3200, 230, 'D16'),

(7031, 'Ayan', 'Analyst', 7024, '2023-02-10', 550, 1000, 'D30'),
(7032, 'Jigyas', 'Clerk', 7003, '2022-12-30', 3200, 200, 'D40'),
(7033, 'Ranjan', 'Clerk', 7006, '2023-01-15', 3000, 100, 'D10'),
(7034, 'Suman', 'Salesman', 7006, '2022-11-20', 400, 500, 'D20'),
(7035, 'Hamsa', 'Manager', 7006, '2022-09-05', 6000, 300, 'D30'),
(7036, 'Gnapika', 'Analyst', 7024, '2023-02-10', 5520, 1000, 'D13'),
(7037, 'Ankita', 'Clerk', 7003, '2022-12-30', 3200, 1000, 'D14'),
(7038, 'Aaratrika', 'Clerk', 7006, '2023-01-15', 3000, 780, 'D10'),
(7039, 'Mithoon', 'Salesman', 7006, '2022-11-20', 4050, 710, 'D20'),
(7040, 'Arijit', 'Manager', 7006, '2022-09-01', 6200, 690, 'D12'),
(7041, 'Dipayan', 'Analyst', 7003, '2023-02-10', 5100, 1000, 'D15'),
(7042, 'Himashis', 'Clerk', 7003, '2022-12-30', 3800, 210, 'D11'),

(7043, 'Aritra', 'Analyst', 7003, '2023-02-10', 5700, 1000, 'D06'),
(7044, 'Bipradeep', 'Clerk', 7024, '2022-12-30', 3800, 520, 'D07'),
(7045, 'Prithijit', 'Clerk', 7006, '2023-01-15', 3400, 640, 'D10'),
(7046, 'Ananya', 'Salesman', 7006, '2022-11-20', 4900, 500, 'D08'),
(7047, 'Puyush', 'Manager', 7006, '2022-09-05', 6200, 470, 'D09'),
(7048, 'Anubhab', 'Analyst', 7003, '2023-02-10', 7100, 1000, 'D08'),
(7049, 'Atrayee', 'Clerk', 7003, '2022-12-30', 3200, 170, 'D13'),
(7050, 'Vaishnavi', 'Clerk', 7024, '2023-01-15', 3000, 90, 'D18'),
(7051, 'Yuvraj', 'Salesman', 7006, '2022-11-20', 7800, 500, 'D20'),
(7052, 'Ishan', 'Manager', 7024, '2022-09-05', 6580, 40, 'D19'),
(7053, 'Lasiewdor', 'Analyst', 7003, '2023-02-10', 5500, 1000, 'D14'),
(7054, 'Saankhya', 'Clerk', 7003, '2022-12-04', 3200, 270, 'D18'),
(7055, 'Soutrik', 'Clerk', 7003, '2022-12-30', 3280, 180, 'D17'),
(7056, 'Samridhhi', 'Clerk', 7024, '2022-12-04', 3200, 120, 'D16'),
(7057, 'Neeharika', 'Clerk', 7003, '2022-12-30', 3250, 170, 'D17'),

(7058, 'Bairstow', 'President', NULL, '2022-07-15', 10000, 1000, 'D01'),
(7059, 'Malan', 'President', NULL, '2022-07-15', 10000, 1000, 'D06'),
(7060, 'Root', 'President', NULL, '2022-07-15', 10000, 1000, 'D15'),
(7061, 'Stokes', 'President', NULL, '2022-07-15', 10000, 1000, 'D19'),
(7062, 'Buttler', 'President', NULL, '2022-07-15', 10000, 1000, 'D20');


UPDATE EMP
SET SAL = 9000
WHERE ENAME = 'AYAN';

UPDATE EMP
SET SAL = 4000
WHERE ENAME = 'SUMAN';
-- *******************************************************************************************

-- Display the difference between highest and lowest salary of each department in
-- descending order. Label the column as “Difference”.

SELECT DEPTNO, 
       MAX(SAL) - MIN(SAL) AS Difference
FROM EMP
GROUP BY DEPTNO
ORDER BY Difference DESC;


-- List all the employees’ employee number and name along with their immediate
-- managers’ employee number and name.

SELECT
    e.EMPNO AS "Employee Number",
    e.ENAME AS "Employee Name",
    m.EMPNO AS "Manager Number",
    m.ENAME AS "Manager Name"
FROM EMP AS e
LEFT JOIN EMP AS m 
		  ON e.MGR = m.EMPNO;	-- self join

-- Create a query that will display the total number of employees and the total number
-- of employees who were hired only in 2020. Give the column headings as “TOTAL”
-- and “TOTAL_2020” respectively.

-- SELECT
--     COUNT(*) AS TOTAL,
--     SUM(CASE WHEN YEAR(HIREDATE) = 2020 THEN 1 ELSE 0 END) AS "TOTAL_2020"
-- FROM EMP;

SELECT
    COUNT(*) AS "TOTAL",
    (SELECT COUNT(*) FROM EMP 
					 WHERE YEAR(HIREDATE) = 2020) 
                     AS "TOTAL_2020"
FROM EMP;


-- Display the manager number and the salary of the lowest paid employee under that
-- manager. Exclude anyone whose manager is not known. Exclude any group where the
-- minimum salaryis less than 1000. Sort the output in descending order of salary.


SELECT
    E2.EmpNo AS Manager_Number,
    MIN(E1.SAL) AS Lowest_Salary
FROM EMP AS E1
JOIN EMP AS E2
         ON E2.EmpNo = E1.MGR
WHERE E1.MGR IS NOT NULL
GROUP BY E2.EmpNo
HAVING MIN(E1.SAL) >= 1000
ORDER BY Lowest_Salary DESC;


-- SELECT
--     MGR.MGR AS "Manager Number",
--     MIN(E.SAL) AS "Lowest Salary"
-- FROM EMP E
-- JOIN (SELECT DISTINCT EMPNO AS MGR FROM EMP WHERE MGR IS NOT NULL) MGR
-- ON E.MGR = MGR.MGR
-- GROUP BY MGR.MGR
-- HAVING MIN(E.SAL) >= 1000
-- ORDER BY "Lowest Salary" DESC;


-- select e1.mgr , min(e2.sal) as min_sal 
-- from emp as e1 
-- join emp as e2 
-- on e2.mgr = e1.empno 
-- where e1.mgr is not null 
-- group by e1.mgr 
-- order by min_sal desc
-- ;

SELECT SAL , ENAME , EMPNO FROM emp as e 
WHERE e.MGR = "7024";

-- Assume that there are some departments where no employee is assigned. Now, write
-- a query to display the department name, location name, number of employees, and the
-- average salary for all the employees in that department. Label the columns as
-- “DNAME”, “LOCATION”, “NUMBER OF PEOPLE”, and “AVERAGE SALARY”
-- respectively. Round the averge salary to two decimal places. The outcome of the
-- query must include the details of the departments where no employee is assigned and
-- in that case the “AVERAGE SALARY” for that department is to be displayed as 0
-- (zero).

SELECT
    D.DNAME AS "DNAME",
    D.LOC AS "LOCATION",
    COALESCE(COUNT(E.EMPNO), 0) AS "NUMBER OF PEOPLE",
    COALESCE(ROUND(AVG(E.SAL), 2), 0) AS "AVERAGE SALARY"
FROM DEPT AS D
LEFT JOIN EMP AS E 
	      ON D.DEPTNO = E.DEPTNO	-- condition
GROUP BY D.DNAME, D.LOC
ORDER BY D.DNAME;

-- or 
SELECT
    D.DNAME AS "DNAME",
    D.LOC AS "LOCATION",
    COUNT(E.EMPNO) AS "NUMBER OF PEOPLE",
    IFNULL(ROUND(AVG(E.SAL), 2), 0) AS "AVERAGE SALARY"
FROM DEPT AS D
LEFT JOIN EMP AS E 
              ON D.DEPTNO = E.DEPTNO
GROUP BY D.DNAME, D.LOC
ORDER BY D.DNAME;
