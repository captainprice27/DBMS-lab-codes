## Assignment 1:
drop table crs_regd;  
drop table crs_offrd;   
drop table faculty;   
drop table students;   
drop table depts;    
create table depts(    
deptcode char(3) primary key,   
deptname char(30) not null);   
create table students(   
rollno number(8) primary key,   
name char(30),    
bdate date check(bdate < '01-JAN-97'),   
deptcode char(3) references depts(deptcode)    
 on delete cascade,    
hostel number check(hostel<10),    
parent_inc number(8,1));    
create table faculty(    
fac_code char(8) primary key,    
fac_name char(30) not null,     
fac_dept char(3) references depts(deptcode));    
create table crs_offrd(    
crs_code char(5) primary key,     
crs_credits number(2,1),     
crs_fac_cd char(8) references faculty(fac_code));     
create table crs_regd(      
crs_rollno number(8) references students(rollno),     
crs_cd char(5) references crs_offrd(crs_code),    
marks number(5,2),     
primary key(crs_rollno,crs_cd));     
Try inserting records which violates the constraints.     
Delete records from dept where deptcode='CSE'.      
(This deletes records from students whose deptcode='CSE')      
Find out the courses offered by the faculty dbp and nls.     
Find out the courses with full details offered by dbp.      
Get the courses the credits of which lies between 4.0 and 6.0.    
Get the courses the credits of which are > 6.5.         

## Assignment 2:
Count the number of students in CSE dept.
Determine the minimum, maximum and average marks of each courses.
Determine the total credits of the courses registered by a student.
Count the number of students in each hostel whose department is CSE.
Display the hostel,rollno,parent_inc of the student
who has the max(parent_inc) in a hostel.
Display the name and parental income of each student greater than 
 the parental income of some rollno 92005010.
Find out marks of students who have marks more than 
rollno 92005102 for course CH103 and PH106.
## Assignment 3:
List students (rollno,name,deptcode) registered for course EE101.
List students (rollno,name) in ELE dept registered for course EE101.
List students (rollno,name) in ELE dept not registered for course EE101.
List the names of the students who have registered for both the courses 'DBMS' and 'OS'.
Find the names of the faculty members who have offered either 'MIS' or 'Software Engg.'
Find the names of the faculty members who have offered 'MIS' but not offered 'Software Engg.'
Find out the students in each hostel who are not registered for any course.
Select the students who are in ELE dept or who have registered for course CS101.
Display the students who have registered to all the courses.
Give Grace Marks 5 in subject ‘DBMS’to the students who have scored less than 50 in that subject.
