create database Exercises;

 use Exercises; 

Create Table Teachers(
TeacherID INT Primary Key IDENTITY(1,1),
FirstName VARCHAR (255),
LastName VARCHAR (255),
Subject VARCHAR (255)
); 
drop table Teachers

Create Table Classes (
ClassID INT Primary Key IDENTITY(1,1),
ClassName VARCHAR (255),
TeacherID INT ,
CONSTRAINT FK_Teachers FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


Create Table Student (
StudentID int Primary Key IDENTITY(1,1),
FirstName VARCHAR (255) not null,
LastName VARCHAR (255) not null,
ClassID INT not null,
BirthDate date not null
CONSTRAINT FK_Classes FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

--2.more data
insert into Teachers (FirstName,LastName,Subject)
values( 'nguyen', 'A', 'Math'),
      ( 'nguyen', 'B', 'Phys'),
	  ( 'nguyen', 'C', 'Chem')

insert into Classes(ClassName,TeacherID)
values( 'A1', '1'),
      ( 'A2', '2'),
	  ( 'A3', '3'),
	  ( 'B1', '1'),
	  ( 'B2', '2'),
	  ( 'B3', '3'),
	  ( 'C1', '1'),
	  ( 'C2', '2'),
	  ( 'C3', '3'),
	  ( 'D1', '1')

insert into Student(FirstName,LastName,ClassID,BirthDate)
values ('Pham','A','2','2005-8-14'),
       ('Pham','B','3','2005-8-14'),
       ('Pham','C','4','2005-8-14'),
       ('Pham','D','5','2005-8-14'),
       ('Pham','E','6','2005-8-14'),
       ('Pham','F','4','2005-8-14'),
       ('Pham','G','2','2005-8-14'),
       ('Pham','H','5','2005-8-14'),
       ('Pham','I','6','2005-8-14'),
       ('Pham','J','3','2005-8-14')
	   

--3.data query
SELECT*FROM Teachers
SELECT*FROM Classes
SELECT*FROM Student

--4.query conditions
select * from Student where year (BirthDate)>2000

--5.JOIN query
Select s.*,c.ClassName,t.Firstname,t.Lastname
From Student s
Join Classes c on c.ClassID=s.ClassID
join Teachers t on t.TeacherID=c.TeacherID
order by s.Lastname asc

--6.UPDATE DATE
update Student
Set Firstname='Jhon',Lastname='Doe'
where StudentID=3

--7.DETELE DATE
delete
from Student
where StudentID=7

--8.procedure
CREATE PROCEDURE GetStudentsByClassAndSubject @p_ClassID int ,@p_Subject varchar(30)
as
    SELECT s.StudentID, s.Firstname, s.Lastname, s.Birthdate, c.ClassName, t.Firstname AS TeacherFirstname, t.Lastname AS TeacherLastname, t.Subject
    FROM Students s
    JOIN Classes c ON s.ClassID = c.ClassID
    JOIN Teachers t ON c.TeacherID = t.TeacherID
    WHERE s.ClassID = @p_ClassID AND t.Subject = @p_Subject

--9.view
CREATE VIEW StudentsWithClassAndTeacher AS
SELECT
    s.StudentID,
    s.Firstname AS StudentFirstname,
    s.Lastname AS StudentLastname,
    s.Birthdate,
    c.ClassName,
    t.Firstname AS TeacherFirstname,
    t.Lastname AS TeacherLastname,
    t.Subject
FROM
    Student s
JOIN
    Classes c ON s.ClassID = c.ClassID
JOIN
    Teachers t ON c.TeacherID = t.TeacherID;

select * from StudentsWithClassAndTeacher