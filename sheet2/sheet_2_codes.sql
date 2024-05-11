--  ssh prayas@10.2.1.49
-- password (nme.nm)
-- mysql -u prayas -p
-- password (Cst@1234)
-- connect prayas
-- show DATABASES

-- for lappy -> start services -> mySql -> run

show databases;

show tables;

drop table crs_regd;
drop table crs_offrd;
drop table faculty;
drop table students;
drop table depts;

-- Creation

create table depts
(
    deptcode varchar(3) primary key,
    deptname varchar(30) not null
);

CREATE TABLE students (
    rollno NUMERIC(8) PRIMARY KEY,
    name varchar(30),
    bdate DATE CHECK (bdate < '1997-01-01'),
    deptcode varchar(3),
    hostel NUMERIC CHECK (hostel < 10),
    parent_inc int,
    FOREIGN KEY (deptcode) REFERENCES depts(deptcode) ON DELETE CASCADE
);

create table faculty
(
    fac_code varchar(8) primary key,
    fac_name varchar(30) not null,
    fac_dept varchar(3) references depts(deptcode) 
);

create table crs_offrd
(
    crs_code varchar(5) primary key,
    crs_name varchar(30) not null,
    crs_credits int,
    crs_fac_cd varchar(8) references faculty(fac_code)
);

create table crs_regd
(
    crs_rollno int references students(rollno),
    crs_cd varchar(5) references crs_offrd(crs_code),
    marks int,
    constraint cons_1 primary key(crs_rollno,crs_cd)
);

-- Insertion

INSERT INTO depts VALUES
    ('CHE', 'Chemistry'),
    ('CSE', 'Computer Science'),
    ('ELE', 'Electrical'),
    ('ETC', 'Electronics'),
    ('IT', 'Information Technology'),
    ('MEC', 'Mechanical'),
    ('PHY', 'Physics');

INSERT INTO students VALUES
    (9200523, 'Sita Bose', '1995-08-05', 'MEC', 6, 78000.0),
    (92005010, 'Trina Ghosh', '1992-11-21', 'CSE', 5, 50000.0),
    (92005021, 'Rajat Das', '1993-04-15', 'ELE', 6, 60000.0),
    (92005030, 'Gita Datta', '1995-07-19', 'ELE', 5, 30000.0),
    (92005045, 'Enakshi Dey', '1995-08-04', 'MEC', 1, 45678.9),
    (92005089, 'Manali Dey', '1996-09-09', 'PHY', 1, 56000.0),
    (92005102, 'Subho Roy', '1994-05-28', 'MEC', 7, 200000.4),
    (92005106, 'Malini Sengupta', '1995-07-30', 'IT', 5, 50000.7),
    (92005128, 'Dhrubo Mukherjee', '1996-03-08', 'CSE', 6, 80000.6);

INSERT INTO faculty VALUES
    ('akd', 'Anil Roy', 'CSE'),
    ('dbp', 'Ranjan Sarkar', 'CSE'),
    ('dkg', 'Diya Ghosal', 'MEC'),
    ('lks', 'Lalit Sharma', 'IT'),
    ('nls', 'Rita Ghosh', 'ETC'),
    ('pkb', 'Pravat Bose', 'ELE'),
    ('pos', 'Sujata Pal', 'ELE'),
    ('rty', 'Mukul Das', 'PHY'),
    ('tsg', 'Sarmistha Dey', 'CHE');

INSERT INTO crs_offrd VALUES
    ('CH103', 'Electrochemistry', 8.5, 'tsg'),
    ('CS101', 'OS', 5.0, 'dbp'),
    ('CS201', 'Software Engg', 6.5, 'akd'),
    ('CS207', 'DBMS', 8.3, 'dbp'),
    ('CS210', 'MIS', 7.0, 'lks'),
    ('EC202', 'Communication System', 4.9, 'nls'),
    ('EC212', 'Control Signal', 6.0, 'nls'),
    ('EE101', 'Electric machines', 4.0, 'pkb'),
    ('EE102', 'Basic Electrical', 6.0, 'pkb'),
    ('IT210', 'Multimedia', 7.5, 'lks'),
    ('ME209', 'Fluid Mechanics', 9.3, 'dkg'),
    ('PH106', 'Quantum Theory', 7.0, 'rty');


INSERT INTO crs_regd VALUES
    (92005010, 'CH103', 100.00),
    (92005010, 'EE101', 92.40),
    (92005010, 'EE102', 56.80),
    (92005010, 'PH106', 98.00),
    (92005021, 'CH103', 100.00),
    (92005021, 'CS101', 74.00),
    (92005021, 'CS201', 78.00),
    (92005021, 'CS207', 48.00),
    (92005021, 'CS210', 78.00),
    (92005021, 'EC202', 78.00),
    (92005021, 'EC212', 50.00),
    (92005021, 'EE101', 78.00),
    (92005021, 'EE102', 56.00),
    (92005021, 'IT210', 78.00),
    (92005021, 'ME209', 78.00),
    (92005021, 'PH106', 78.00),
    (92005030, 'EE102', 89.00),
    (92005030, 'ME209', 45.00),
    (92005045, 'CS101', 78.30),
    (92005045, 'CS207', 100.00),
    (92005045, 'EE102', 98.00),
    (92005089, 'EE102', 89.00),
    (92005102, 'CH103', 90.00),
    (92005102, 'PH106', 83.00),
    (92005106, 'CS210', 78.50),
    (92005128, 'EC202', 56.00),
    (92005128, 'IT210', 87.10);


--  Assignment 1 **************************************************************************************************************************************
-- ********************************************************************************************************************************************************8

delete from depts 
where deptcode = 'CSE';

select * from crs_offrd where crs_fac_cd IN ('dbp', 'nls');

select * from crs_offrd where crs_fac_cd = 'dbp';

select * from crs_offrd where crs_credits BETWEEN 4.0 AND 6.0;

select * from crs_offrd where crs_credits > 6.5;

-- Assignment 2  ***********************************************************************************************************************************************
-- ***************************************************************************************************************************************************************

SELECT COUNT(*) AS num_students FROM students WHERE deptcode = 'CSE';

SELECT crs_cd,
       MIN(marks) AS min_marks,
       MAX(marks) AS max_marks,
       AVG(marks) AS avg_marks
FROM crs_regd
GROUP BY crs_cd;

-- SELECT cr.crs_rollno, SUM(co.crs_credits) AS total_credits
-- FROM crs_regd cr
-- JOIN crs_offrd co ON cr.crs_cd = co.crs_code
-- GROUP BY cr.crs_rollno;

SELECT cr.crs_rollno, SUM(co.crs_credits) AS total_credits
FROM crs_regd cr, crs_offrd co where cr.crs_cd = co.crs_code
GROUP BY cr.crs_rollno;

SELECT s.hostel, COUNT(*) AS num_students
FROM students s -- making students name as s (alias)
WHERE s.deptcode = 'CSE'
GROUP BY s.hostel;

-- SELECT s.hostel, s.rollno, s.parent_inc
-- FROM students s
-- JOIN (
--     SELECT hostel, MAX(parent_inc) AS max_parent_inc
--     FROM students
--     GROUP BY hostel
-- ) max_parent ON s.hostel = max_parent.hostel AND s.parent_inc = max_parent.max_parent_inc;

SELECT s.hostel, s.rollno, s.parent_inc
FROM students s
WHERE s.parent_inc = (
    SELECT MAX(parent_inc) AS max_parent_inc
    FROM students
    WHERE s.hostel = students.hostel
);

SELECT s.name, s.parent_inc
FROM students s
WHERE s.parent_inc > (
    SELECT parent_inc
    FROM students
    WHERE rollno = 92005010
);


SELECT cr.crs_rollno, cr.crs_cd, cr.marks
FROM crs_regd cr
WHERE cr.marks > ALL (
    SELECT marks
    FROM crs_regd
    WHERE crs_rollno = 92005102 AND crs_cd IN ('CH103', 'PH106')
)
AND cr.crs_cd IN ('CH103', 'PH106');

-- Assignment 3  ***************************************************************************************************************************************************
-- ***************************************************************************************************************************************************************


-- SELECT s.rollno, s.name, s.deptcode
-- FROM students s
-- WHERE s.rollno IN (SELECT crs_rollno FROM crs_regd WHERE crs_cd = 'EE101');

SELECT	rollno, name, deptcode
FROM students, crs_regd
WHERE
	crs_rollno = rollno
	AND crs_cd = 'EE101';

    
-- SELECT s.rollno, s.name
-- FROM students s
-- WHERE s.rollno IN (SELECT crs_rollno FROM crs_regd WHERE crs_cd = 'EE101')
-- and s.deptcode = 'ELE' ;

SELECT 	rollno,name
FROM	students, crs_regd
WHERE
	crs_rollno = rollno
	AND deptcode = 'ELE'
	AND crs_cd = 'EE101';


-- SELECT s.rollno, s.name
-- FROM students s
-- WHERE s.deptcode = 'ELE'
-- EXCEPT
-- SELECT s.rollno, s.name
-- FROM students s
-- WHERE s.rollno IN (SELECT crs_rollno FROM crs_regd WHERE crs_cd = 'EE101')
-- AND s.deptcode = 'ELE';

SELECT s.rollno, s.name
FROM students s
WHERE s.deptcode = 'ELE'
AND s.rollno NOT IN (SELECT crs_rollno FROM crs_regd WHERE crs_cd = 'EE101');


select name from students where rollno IN
(
    select distinct crs_rollno from crs_regd
    where crs_cd IN
    (
        select crs_code from crs_offrd 
        where crs_name IN ('OS', 'DBMS')
    )
);

-- select fac_name from faculty 
-- where fac_code IN
--     ( select crs_fac_cd from crs_offrd 
--     where crs_name IN ('MIS', 'Software Engg'));

SELECT fac_name
FROM faculty, crs_offrd
WHERE 
	crs_fac_cd = fac_code 
	AND crs_name = 'MIS'
UNION
SELECT fac_name
FROM faculty, crs_offrd
WHERE
	crs_fac_cd = fac_code
	AND crs_name = 'Software Engg';


SELECT fac_name FROM faculty
WHERE fac_code IN 
(
    SELECT co.crs_fac_cd
    FROM crs_offrd co
    WHERE co.crs_name = 'MIS'
)
AND fac_code NOT IN (
    SELECT co.crs_fac_cd
    FROM crs_offrd co
    WHERE co.crs_name = 'Software Engg'
);

SELECT name, hostel
FROM students
WHERE rollno NOT IN (
    SELECT crs_rollno
    FROM crs_regd
)
ORDER BY hostel;

select rollno, name
from students
where deptcode = 'ELE'
union
select rollno, name
from students,
    (select crs_rollno
    from crs_regd
    where crs_cd='CS101') cr
where rollno = crs_rollno;

SELECT crs_rollno, name, deptcode 
FROM students, crs_regd
WHERE rollno = crs_rollno
GROUP BY crs_rollno, rollno 
HAVING COUNT(*) = (SELECT COUNT(*) FROM crs_offrd);

-- select crs_code
-- from crs_offrd
-- where crs_name = 'DBMS';

update crs_regd
set marks = marks + 5
where crs_cd in
(select crs_code
from crs_offrd
where crs_name = 'DBMS')
and marks<50;

select * from faculty;

select * from crs_offrd;

select * from crs_regd;

select * from students;



-- Assignment 4 --*******************************************************************************************************************************************
-- **********************************************************************************************************************************************************


-- Retrieve the name of the students whose name starts with ‘S’ and contains ‘r’
-- as the second last character
select * from students
WHERE name LIKE 'S%r_';
-- showing NULL means no such student name exists

-- Retrieve the name of the youngest student(s) from the ‘CST’ department
-- along with the total marks obtained by him (them).

SELECT students.name , 
		(SELECT SUM(marks) FROM crs_regd cr WHERE cr.crs_rollno = students.rollno) 
         AS total_marks
FROM  students
WHERE students.deptcode = 'ELE'
		AND students.bdate = 
			(SELECT MAX(bdate) FROM students WHERE deptcode = 'ELE');
 
-- Find the age of all the students.

SELECT name, TIMESTAMPDIFF(YEAR, bdate, CURDATE()) AS age
FROM students;

-- TIMESTAMPDIFF(YEAR, bdate, CURDATE()) calculates the difference 
-- in years between the birthdate (bdate) of each student and the 
-- current date (CURDATE())




-- ASSIGNMENT 5 ***************************************************
-- ****************************************************************

-- Retrieve the name of the student(s) who obtained second highest marks in
-- ‘DBMS’.

SELECT name 
FROM students
WHERE rollno = (
    SELECT crs_rollno
    FROM crs_regd
    -- WHERE crs_name = 'DBMS'
    WHERE crs_cd = (
    SELECT crs_code FROM crs_offrd 
    WHERE crs_name = 'DBMS')
    ORDER BY marks DESC
    LIMIT 1 OFFSET 1
);

-- Find out the differences between highest and lowest marks obtained in each
-- subject.

SELECT crs_cd AS course_code,
       MAX(marks) - MIN(marks) AS mark_difference
FROM crs_regd
GROUP BY crs_cd;

-- Assuming the existance of several interdepartmental courses, retrieve the
-- name of the student(s) who is(are) studying under at least one faculty from
-- each department

SELECT s.name
FROM students AS s	-- unlike previous query , we used alias name 's' 
WHERE EXISTS (
    SELECT d.deptcode
    FROM depts AS d
    WHERE NOT EXISTS (			-- EXISTS keyword search for existance of any record in a subquery
        SELECT fac_code
        FROM faculty AS f
        WHERE d.deptcode = f.fac_dept
          AND NOT EXISTS (
              SELECT crs_code
              FROM crs_offrd AS c
              WHERE f.fac_code = c.crs_fac_cd
                AND c.crs_code IN (
                    SELECT crs_cd
                    FROM crs_regd AS cr
                    WHERE cr.crs_rollno = s.rollno
                )
          )
    )
);



-- Assuming the existance of several interdepartmental courses, retrieve the
-- name of the student(s) who is(are) studing under the faculties only from
-- his(their) own department


SELECT s.name
FROM students AS s
WHERE s.deptcode IN (
    SELECT fac_dept
    FROM faculty AS f
    WHERE f.fac_code IN (
        SELECT crs_fac_cd
        FROM crs_offrd AS c
        WHERE c.crs_code IN (
            SELECT crs_cd
            FROM crs_regd AS cr
            WHERE cr.crs_rollno = s.rollno
        )
    )
);



-- ASSIGNMENT 6 *****************************************************************************************************************************************
-- ******************************************************************************************************************************************************


-- Display the highest parent incomes, in descending order, for each
-- department excluding ‘ARCH’ such that only those highest parent incomes
-- will appear that are below 12,0000.

SELECT deptcode, MAX(parent_inc) AS highest_parent_income -- alias
FROM students
WHERE (deptcode != 'ARCH' 			-- means dept_code != 'ARCH'
		AND parent_inc < 120000)
GROUP BY deptcode
ORDER BY highest_parent_income DESC;


-- Retrieve the fifth highest parent income for hostel number 5.
-- according to the dataset 5th highest datincome is not possible beacuse we
-- have only 2 entries . so it is made OFFSET 1

SELECT name,parent_inc
FROM students
WHERE hostel = 5
ORDER BY parent_inc DESC	-- DESC means in decreasing order ...
LIMIT 1 OFFSET 1;	-- OFFSET 'i' means skips first 'i' lines


-- Find the roll number of the students from each department who obtained
-- highest total marks in their own department

SELECT name , deptcode,s.rollno
FROM students AS s
WHERE s.rollno = (
    SELECT cr.crs_rollno
    FROM crs_regd AS cr
    WHERE s.deptcode = (
        SELECT deptcode
        FROM students
        WHERE rollno = cr.crs_rollno
    )
    GROUP BY cr.crs_rollno
    ORDER BY SUM(cr.marks) DESC
    LIMIT 1
);





-- ASSIGNMENT 7 *********************************************************
-- ***************************************************************************8

-- Insert a new student of CSE.

INSERT INTO students (rollno, name, bdate, deptcode, hostel, parent_inc)
VALUES
    (92005028, 'Sourik Chatterjee', '2000-05-15', 'CSE', 3, 60000),
    (92005071, 'Prayas Stokes', '2001-02-20', 'CSE', 5, 55000),
    (92005069, 'Jos Buttler', '2002-09-10', 'CSE', 2, 62000);
