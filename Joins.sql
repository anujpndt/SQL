Create database joins;
use joins;
create table student (
id int primary key,
name varchar(50)
);
 insert into student(id , name) values
 (101,"adam"),
 (102,"bob"),
 (103,"casey");
  drop table student;
 
select * from student;


 create table course (
 id int primary key,
 course varchar(50)
 );
 insert into course (id,course) values
 (102,"english"),
 (105, "maths"),
 (103,"science"),
 (107, "cse");
 
 select * from course;
 
 select * from student as s
 inner join course as c on 
 s.id=c.id;
 
 select * from student as s  left join 
 course as c on c.id = s.id;
 
 select * from student as s 
 right join course as c
 on c.id=s.id; 
 
 
 select * from student as s  left join 
 course as c on c.id = s.id
 union
 select * from student as s 
 right join course as c
 on c.id=s.id;
 
 ### Left Exclusive Join 
 select * from student as s  left join 
 course as c on c.id = s.id
 where c.id is null; 
 
 ### Right Exclusive Join
 
 select * from student as s
 right join course as c 
 on c.id=s.id
 where s.id is  null;
 
 #### SELF JOIN
 
 create table employee(
 id int primary key,
 name varchar(50),
 manager_id int 
 );
 
 insert into employee (id ,name,manager_id) values
 (101,"adam",103),
 (102,"bob",104),
 (103,"casey",null),
 (104,"donald",103);
 
 select * from employee;
 
 select a.name as manager_name ,b.name from employee as a
 join employee as b on a.id=b.manager_id;
 
 
 #### Sub Query 
 
 create table student(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into student (rollno,name,marks,grade,city) values
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","delhi"),
(105,"emanuel",12,"F","delhi"),
(106,"farah",82,"B","delhi");
 
 Select name, marks from student where marks > (select avg(marks) from student);
 
 select rollno,name from student 
 where rollno in
 (select rollno from student where
  rollno%2=0);
  
  select max(marks)
  from (select * from student where city ="delhi") as temp;
  
  
  create view view1 as 
  select rollno,name,marks from student;
  
  select * from view1
  
  
 