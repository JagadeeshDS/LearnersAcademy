use LearnersAcademy
select * from login;
select * from Student order by id;
select * from teacher order by id;
select * from subject order by id;
select * from class;
select subject.Name as 'Subject',subject.Time,Student.S_Name as 'Student',teacher.Name as'Teacher' from Student,teacher,subject where subject.Name = teacher.Subject and Student.S_Subject = subject.Name and subject.Name = 'Java';
delete from student where id = 2;
insert into student values('Malli','37','Bangalore','Karnataka','malli@g.com','Java');
select password from login where name = 'admin';
insert into subject values('Java','11 to 12 AM')
delete from teacher where id = 5;
insert into teacher values('Mohan','mo@gmail.com','Java');
CREATE TABLE login(id int,"name" varchar(50),"password" varchar(50));
CREATE TABLE Student(id int primary key identity,"S_Name" varchar(50),"age" int, "S_Location" varchar(30),"S_State" varchar(30),"S_Email" varchar(50),"S_Subject" varchar(30));
CREATE TABLE Teacher(id int primary key identity,"Name" varchar(50),"email" varchar(50),"Subject" varchar(50));
CREATE TABLE Subject(id int primary key identity,"Name" varchar(50),"Time" varchar(50));
CREATE TABLE teacher(id int primary key identity,"classname" varchar(50));