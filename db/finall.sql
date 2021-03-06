ranklist.sql

student(reg_no,name,sem,phone,email,dob)
sem(sem,tot_cred)
course(course_id,course_name,sem,credits)
university_total(sem,reg_no,course_id,marks)
------------------------------------------------
create table student_log(regno int primary key not null,logdate date);

create or replace function std_logentry() returns trigger as
$$
begin

	insert into student_log (regno,logdate) values (old.reg_no,now());
	return old;

end;
$$
language plpgsql;

create trigger student_del_log before delete on student for each row execute procedure std_logentry();
---------------------------------------------------------------------------------------------------------------------
delete from student where name='dff';
---------------------------------------------------------------------------------------------------------------------
CGPA =Σ(Ci×GPi)/ΣCi 
Here, The subject registered by the student in all the semesters are taken into account. The failed subjects are also taken into account. The specific CGPA of each passed subjects will be also given.




FUNCTION TO CALCULATE CGPA
===========================


create or replace function cgpa(reg int)returns float(2) as
$$
declare
sumcred int = 0;
s float(2) =0;
cgpa float(2) =0;
begin
	select sum(c.credits*g.points) into s 
	from grade as g,course as c,sgrade as s where s.course_id=c.course_id and s.grade=g.grade 		and s.reg_no=reg; 
	select tot_cred into sumcred from sem where sem IN(select distinct c.sem from  		sgrade as s,course as c where s.course_id=c.course_id);   
	cgpa = s/sumcred;
	return cgpa;
end;
$$
language plpgsql;

---------------------------------------------------------------------------------------------------------------------------------------

FUNCTION TO CALCULATE SGPA
==========================


create or replace function sgpa(reg int,s_sem varchar(5)) returns real as 
$$
declare 
totcred int =0;
s real=0;
sgpa real=0;
begin
	select sum(c.credits*g.points) into s 
	from grade as g,course as c,sgrade as s where s.course_id=c.course_id and s.grade=g.grade and s.reg_no=reg and c.sem=s_sem;
	select tot_cred from sem into totcred where sem=s_sem;
	sgpa=s/totcred;
	return sgpa;
end;
$$
language plpgsql;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table student(reg_no serial primary key,name varchar(15) not null,sem varchar(5) references sem(sem),phone varchar(12),email varchar(20),dob date);
insert into student(name,sem,phone,email,dob)
values
('dff','S5','1234567896','bnb@gmail.com','1998-07-07'),
('nidhi','S5','1234567890','abc@gmail.com','1998-01-01'),
('muhs','S5','1234567891','hgf@gmail.com','1998-02-02'),
('adish','S5','1234567892','ff@gmail.com','1998-03-03'),
('bala','S5','1234567893','vv@gmail.com','1998-04-04'),
('vg','S5','1234567894','bb@gmail.com','1998-05-05'),
('varsha','S5','1234567895','hb@gmail.com','1998-06-06'),
('reppan','S5','1234567896','bnb@gmail.com','1998-07-07');
------------------------------------------------------------------------------------------------------------------------------------------------

Create table attendance(
reg_no int REFERENCES student(reg_no),
course_id varchar(10) REFERENCES course(course_id),
hr int,
hr_present int,
dat date,
primary key(reg_no,hr,dat)
);
--------------------------------------------------------------------------------------------------------------------------------
Insert into attendance (reg_no,course_id,hr,hr_present,dat)
Values
(1,'MA101',1,1,'2018-11-26'),
(2,'MA101',1,1,'2018-11-26'),
(3,'MA101',1,1,'2018-11-26'),
(4,'MA101',1,1,'2018-11-26'),
(5,'MA101',1,1,'2018-11-26'),
(6,'MA101',1,0,'2018-11-26'),
(7,'MA101',1,1,'2018-11-26'),
(1,'PH100',2,1,'2018-11-26'),
(2,'PH100',2,1,'2018-11-26'),
(3,'PH100',2,1,'2018-11-26'),
(4,'PH100',2,1,'2018-11-26'),
(5,'PH100',2,1,'2018-11-26'),
(6,'PH100',2,1,'2018-11-26'),
(7,'PH100',2,1,'2018-11-26'),
(1,'BE105',3,1,'2018-11-26'),
(2,'BE105',3,1,'2018-11-26'),
(3,'BE105',3,1,'2018-11-26'),
(4,'BE105',3,1,'2018-11-26'),
(5,'BE105',3,0,'2018-11-26'),
(6,'BE105',3,1,'2018-11-26'),
(7,'BE105',3,1,'2018-11-26'),
(1,'BE105',4,1,'2018-11-26'),
(2,'BE103',4,1,'2018-11-26'),
(3,'BE103',4,1,'2018-11-26'),
(4,'BE103',4,1,'2018-11-26'),
(5,'BE103',4,1,'2018-11-26'),
(6,'BE103',4,0,'2018-11-26'),
(7,'BE103',4,1,'2018-11-26'),
(1,'EC100',1,1,'2018-11-27'),
(2,'EC100',1,1,'2018-11-27'),
(3,'EC100',1,1,'2018-11-27'),
(4,'EC100',1,1,'2018-11-27'),
(5,'EC100',1,1,'2018-11-27'),
(6,'EC100',1,1,'2018-11-27'),
(7,'EC100',1,1,'2018-11-27'),
(1,'BE110',2,1,'2018-11-27'),
(2,'BE110',2,1,'2018-11-27'),
(3,'BE110',2,1,'2018-11-27'),
(4,'BE110',2,1,'2018-11-27'),
(5,'BE110',2,1,'2018-11-27'),
(6,'BE110',2,1,'2018-11-27'),
(7,'BE110',2,1,'2018-11-27'),
(1,'MA201',2,1,'2018-11-26'),
(2,'MA201',2,1,'2018-11-26'),
(3,'MA201',2,1,'2018-11-26'),
(4,'MA201',2,1,'2018-11-26'),
(5,'MA201',2,1,'2018-11-26'),
(6,'MA201',2,1,'2018-11-26'),
(7,'MA201',2,1,'2018-11-26'),
(1,'CS202',3,1,'2018-11-26'),
(2,'CS202',3,1,'2018-11-26'),
(3,'CS202',3,1,'2018-11-26'),
(4,'CS202',3,1,'2018-11-26'),
(5,'CS202',3,0,'2018-11-26'),
(6,'CS202',3,1,'2018-11-26'),
(7,'CS202',3,1,'2018-11-26'),
(1,'CS201',4,1,'2018-11-26'),
(2,'CS201',4,1,'2018-11-26'),
(3,'CS201',4,1,'2018-11-26'),
(4,'CS201',4,1,'2018-11-26'),
(5,'CS201',4,1,'2018-11-26'),
(6,'CS201',4,0,'2018-11-26'),
(7,'CS201',4,1,'2018-11-26'),
(1,'HS210',1,1,'2018-11-27'),
(2,'HS210',1,1,'2018-11-27'),
(3,'HS210',1,1,'2018-11-27'),
(4,'HS210',1,1,'2018-11-27'),
(5,'HS210',1,1,'2018-11-27'),
(6,'HS210',1,1,'2018-11-27'),
(7,'HS210',1,1,'2018-11-27'),
(1,'MA202',2,1,'2018-11-27'),
(2,'MA202',2,1,'2018-11-27'),
(3,'MA202',2,1,'2018-11-27'),
(4,'MA202',2,1,'2018-11-27'),
(5,'MA202',2,1,'2018-11-27'),
(6,'MA202',2,1,'2018-11-27'),
(7,'MA202',2,1,'2018-11-27'),
(1,'CS201',3,0,'2018-11-27'),
(2,'CS201',3,1,'2018-11-27'),
(3,'CS201',3,1,'2018-11-27'),
(4,'CS201',3,1,'2018-11-27'),
(5,'CS201',3,1,'2018-11-27'),
(6,'CS201',3,0,'2018-11-27'),
(7,'CS201',3,1,'2018-11-27'),
(1,'CS202',4,1,'2018-11-27'),
(2,'CS202',4,1,'2018-11-27'),
(3,'CS202',4,1,'2018-11-27'),
(4,'CS202',4,1,'2018-11-27'),
(5,'CS202',4,1,'2018-11-27'),
(6,'CS202',4,1,'2018-11-27'),
(7,'CS202',4,1,'2018-11-27'),
(1,'MA101',1,1,'2018-11-28'),
(2,'MA101',1,1,'2018-11-28'),
(3,'MA101',1,1,'2018-11-28'),
(4,'MA101',1,1,'2018-11-28'),
(5,'MA101',1,1,'2018-11-28'),
(6,'MA101',1,1,'2018-11-28'),
(7,'MA101',1,1,'2018-11-28'),
(1,'MA201',2,0,'2018-11-28'),
(2,'MA201',2,1,'2018-11-28'),
(3,'MA201',2,1,'2018-11-28'),
(4,'MA201',2,1,'2018-11-28'),
(5,'MA201',2,1,'2018-11-28'),
(6,'MA201',2,1,'2018-11-28'),
(7,'MA201',2,1,'2018-11-28'),
(1,'MA202',3,1,'2018-11-28'),
(2,'MA202',3,1,'2018-11-28'),
(3,'MA202',3,0,'2018-11-28'),
(4,'MA202',3,1,'2018-11-28'),
(5,'MA202',3,1,'2018-11-28'),
(6,'MA202',3,1,'2018-11-28'),
(7,'MA202',3,1,'2018-11-28')
(1,'HS210',4,1,'2018-11-28'),
(2,'HS210',4,1,'2018-11-28'),
(3,'HS210',4,0,'2018-11-28'),
(4,'HS210',4,1,'2018-11-28'),
(5,'HS210',4,1,'2018-11-28'),
(6,'HS210',4,1,'2018-11-28'),
(7,'HS210',4,1,'2018-11-28');

-------------------------------------------------------------------------------------------------------------------------------------------------
create table grade(grade varchar(5) primary key,points float(2) not null);

insert into grade(grade,points) values ('O',10.00),('A+',9.00),('A',8.50),('B+',8.00),('B',7.00),('C',6.00),('P',5.00),('F',0.00),('FE',0.00);

----------------------------------------------------------------------------------------------------------------------------------------------
create table sgrade(reg_no int references student(reg_no),course_id varchar(20) references course(course_id),grade varchar(5) references grade(grade));

insert into sgrade(reg_no,course_id,grade) values
(1,'MA101','C'),
(2,'MA101','B+'),
(3,'MA101','O'),
(4,'MA101','C'),
(5,'MA101','B+'),
(6,'MA101','O'),
(7,'MA101','C'),
(1,'MA201','B+'),
(2,'MA201','O'),
(3,'MA201','C'),
(4,'MA201','B+'),
(5,'MA201','O'),
(6,'MA201','C'),
(7,'MA201','B+'),
(1,'MA202','O'),
(2,'MA202','C'),
(3,'MA202','B+'),
(4,'MA202','O'),
(5,'MA202','C'),
(6,'MA202','B+'),
(7,'MA202','C'),
(1,'CS202','C'),
(2,'CS202','C'),
(3,'CS202','B+'),
(4,'CS202','B+'),
(5,'CS202','B'),
(6,'CS202','O'),
(7,'CS202','C'),
(1,'CS201','O'),
(2,'CS201','O'),
(3,'CS201','C'),
(4,'CS201','B+'),
(5,'CS201','C'),
(6,'CS201','B+'),
(7,'CS201','O'),
(1,'HS210','B+'),
(2,'HS210','C'),
(3,'HS210','B+'),
(4,'HS210','O'),
(5,'HS210','C'),
(6,'HS210','B+'),
(7,'HS210','O'),
(1,'HS200','O'),
(2,'HS200','B+'),
(3,'HS200','C'),
(4,'HS200','B+'),
(5,'HS200','O'),
(6,'HS200','O'),
(7,'HS200','O'),
(1,'IT201','O'),
(2,'IT201','B+'),
(3,'IT201','B+'),
(4,'IT201','O'),
(5,'IT201','C'),
(6,'IT201','O'),
(7,'IT201','B+'),
(1,'IT203','B+'),
(2,'IT203','C'),
(3,'IT203','O'),
(4,'IT203','B+'),
(5,'IT203','O'),
(6,'IT203','C'),
(7,'IT203','B+'),
(1,'IT202','B+'),
(2,'IT202','C'),
(3,'IT202','O'),
(4,'IT202','B+'),
(5,'IT202','O'),
(6,'IT202','C'),
(7,'IT202','B+'),
(1,'IT204','O'),
(2,'IT204','B+'),
(3,'IT204','B+'),
(4,'IT204','O'),
(5,'IT204','C'),
(6,'IT204','O'),
(7,'IT204','B+'),
(1,'PH100','O'),
(2,'PH100','O'),
(3,'PH100','O'),
(4,'PH100','O'),
(5,'PH100','O'),
(6,'PH100','O'),
(7,'PH100','O'),
(1,'BE102','O'),
(2,'BE102','B+'),
(3,'BE102','C'),
(4,'BE102','B+'),
(5,'BE102','O'),
(6,'BE102','C'),
(7,'BE102','C'),
(1,'EE100','B+'),
(2,'EE100','B+'),
(3,'EE100','C'),
(4,'EE100','O'),
(5,'EE100','O'),
(6,'EE100','B+'),
(7,'EE100','O'),
(1,'BE110','B+'),
(2,'BE110','O'),
(3,'BE110','C'),
(4,'BE110','B+'),
(5,'BE110','O'),
(6,'BE110','O'),
(7,'BE110','B+'),
(1,'BE105','B+'),
(2,'BE105','O'),
(3,'BE105','C'),
(4,'BE105','B+'),
(5,'BE105','O'),
(6,'BE105','O'),
(7,'BE105','B+'),
(1,'BE103','O'),
(2,'BE103','O'),
(3,'BE103','O'),
(4,'BE103','O'),
(5,'BE103','O'),
(6,'BE103','O'),
(7,'BE103','O'),
(1,'EC100','O'),
(2,'EC100','B+'),
(3,'EC100','O'),
(4,'EC100','O'),
(5,'EC100','C'),
(6,'EC100','B+'),
(7,'EC100','B+'),
(1,'MA102','C'),
(2,'MA102','B+'),
(3,'MA102','O'),
(4,'MA102','C'),
(5,'MA102','B+'),
(6,'MA102','O'),
(7,'MA102','C'),
(1,'CY100','O'),
(2,'CY100','B+'),
(3,'CY100','C'),
(4,'CY100','C'),
(5,'CY100','B+'),
(6,'CY100','O'),
(7,'CY100','B+'),
(1,'BE100','B+'),
(2,'BE100','O'),
(3,'BE100','C'),
(4,'BE100','B+'),
(5,'BE100','O'),
(6,'BE100','O'),
(7,'BE100','B+'),
(1,'CS100','B+'),
(2,'CS100','B+'),
(3,'CS100','B+'),
(4,'CS100','O'),
(5,'CS100','O'),
(6,'CS100','O'),
(7,'CS100','B+'),
(1,'CS205','C'),
(2,'CS205','C'),
(3,'CS205','B+'),
(4,'CS205','O'),
(5,'CS205','C'),
(6,'CS205','B+'),
(7,'CS205','B+'),
(1,'CS208','C'),
(2,'CS208','C'),
(3,'CS208','B+'),
(4,'CS208','O'),
(5,'CS208','C'),
(6,'CS208','B+'),
(7,'CS208','B+'),
(1,'IT301','O'),
(2,'IT301','B+'),
(3,'IT301','B+'),
(4,'IT301','O'),
(5,'IT301','C'),
(6,'IT301','O'),
(7,'IT301','B+'),
(1,'IT303','B+'),
(2,'IT303','C'),
(3,'IT303','O'),
(4,'IT303','B+'),
(5,'IT303','O'),
(6,'IT303','C'),
(7,'IT303','B+'),
(1,'IT305','O'),
(2,'IT305','B+'),
(3,'IT305','B+'),
(4,'IT305','O'),
(5,'IT305','C'),
(6,'IT305','O'),
(7,'IT305','B+'),
(1,'IT307','O'),
(2,'IT307','O'),
(3,'IT307','O'),
(4,'IT307','O'),
(5,'IT307','O'),
(6,'IT307','O'),
(7,'IT307','O'),
(1,'CS305','O'),
(2,'CS305','O'),
(3,'CS305','O'),
(4,'CS305','O'),
(5,'CS305','B+'),
(6,'CS305','B+'),
(7,'CS305','C'),
(1,'IT360','C'),
(2,'IT360','B+'),
(3,'IT360','B+'),
(4,'IT360','C'),
(5,'IT360','O'),
(6,'IT360','B+'),
(7,'IT360','B+');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table sem(sem varchar(5) primary key not null,tot_cred int not null);
insert into sem(sem,tot_cred) 
values ('S1',24),
('S2',23),
('S3',24),
('S4',23),
('S5',23),
('S6',23),
('S7',22),
('S8',18);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table course(course_id varchar(20) primary key not null,course_name varchar(50) not null,sem varchar(5) references sem(sem),credits int not null);
insert into course(course_id,course_name,sem,credits) 
values 
('MA101','calculus','S1',4),
('PH100','Engineering Physics','S1',4),
('BE102','design','S2',3),
('EE100','electrical','S2',3),
('BE110','Engineering graphics','S1',3),
('BE105','icps','S1',3),
('BE103','Introduction to Sustainable Engineering','S1',3),
('EC100','Basics of Electronics','S1',3),
('MA102','differential equations','S2',4),
('CY100','Engineering chemistry','S2',4),
('BE100','Engineering Mechanics','S2',4),
('CS100','Basics of computer programming','S2',3),
('MA201','laca','S3',4),
('CS201','DCS','S3',4),
('IT201','DSD','S3',4),
('CS205','DS','S3',4),
('IT203','DC','S3',3),
('HS210','Life skills','S3',3),
('MA202','Probability','S4',4),
('CS202','COA','S4',4),
('IT202','AAD','S4',4),
('IT204','OOT','S4',3),
('CS208','PDBD','S4',3),
('HS200','economics','S4',3),
('IT301','SADP','S5',4),
('IT303','TOC','S5',4),
('CS305','MPC','S5',3),
('IT305','OS','S5',3),
('IT307','CN','S5',3),
('IT360','ELECTIVE','S5',3);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE university_total(reg_no int references student(reg_no),course_id varchar(20) references course(course_id),marks int not null);
insert into university_total(reg_no,course_id,marks)
values
(1,'MA101',124),
(2,'MA101',135),
(3,'MA101',143),
(4,'MA101',124),
(5,'MA101',136),
(6,'MA101',141),
(7,'MA101',127),
(1,'MA201',136),
(2,'MA201',145),
(3,'MA201',125),
(4,'MA201',134),
(5,'MA201',147),
(6,'MA201',125),
(7,'MA201',137),
(1,'MA202',146),
(2,'MA202',124),
(3,'MA202',135),
(4,'MA202',144),
(5,'MA202',123),
(6,'MA202',135),
(7,'MA202',122),
(1,'CS202',126),
(2,'CS202',124),
(3,'CS202',135),
(4,'CS202',134),
(5,'CS202',133),
(6,'CS202',145),
(7,'CS202',142),
(1,'CS201',143),
(2,'CS201',144),
(3,'CS201',125),
(4,'CS201',137),
(5,'CS201',123),
(6,'CS201',135),
(7,'CS201',143),
(1,'HS210',137),
(2,'HS210',125),
(3,'HS210',135),
(4,'HS210',145),
(5,'HS210',123),
(6,'HS210',136),
(7,'HS210',143),
(1,'HS200',143),
(2,'HS200',135),
(3,'HS200',125),
(4,'HS200',135),
(5,'HS200',143),
(6,'HS200',146),
(7,'HS200',141),
(1,'IT201',142),
(2,'IT201',130),
(3,'IT201',134),
(4,'IT201',141),
(5,'IT201',120),
(6,'IT201',140),
(7,'IT201',133),
(1,'IT203',130),
(2,'IT203',122),
(3,'IT203',140),
(4,'IT203',130),
(5,'IT203',140),
(6,'IT203',129),
(7,'IT203',130),
(1,'IT202',130),
(2,'IT202',122),
(3,'IT202',140),
(4,'IT202',130),
(5,'IT202',140),
(6,'IT202',129),
(7,'IT202',130),
(1,'IT204',142),
(2,'IT204',130),
(3,'IT204',134),
(4,'IT204',141),
(5,'IT204',120),
(6,'IT204',140),
(7,'IT204',133),
(1,'PH100',143),
(2,'PH100',145),
(3,'PH100',146),
(4,'PH100',143),
(5,'PH100',144),
(6,'PH100',147),
(7,'PH100',143),
(1,'BE102',140),
(2,'BE102',130),
(3,'BE102',122),
(4,'BE102',133),
(5,'BE102',144),
(6,'BE102',120),
(7,'BE102',122),
(1,'EE100',133),
(2,'EE100',130),
(3,'EE100',129),
(4,'EE100',142),
(5,'EE100',141),
(6,'EE100',130),
(7,'EE100',140),
(1,'BE110',146),
(2,'BE110',139),
(3,'BE110',120),
(4,'BE110',130),
(5,'BE110',148),
(6,'BE110',140),
(7,'BE110',130),
(1,'BE105',146),
(2,'BE105',139),
(3,'BE105',120),
(4,'BE105',130),
(5,'BE105',148),
(6,'BE105',140),
(7,'BE105',130),
(1,'BE103',147),
(2,'BE103',148),
(3,'BE103',149),
(4,'BE103',146),
(5,'BE103',143),
(6,'BE103',144),
(7,'BE103',145),
(1,'EC100',140),
(2,'EC100',132),
(3,'EC100',140),
(4,'EC100',143),
(5,'EC100',124),
(6,'EC100',137),
(7,'EC100',136),
(1,'MA102',124),
(2,'MA102',135),
(3,'MA102',143),
(4,'MA102',124),
(5,'MA102',136),
(6,'MA102',141),
(7,'MA102',127),
(1,'CY100',148),
(2,'CY100',139),
(3,'CY100',120),
(4,'CY100',120),
(5,'CY100',130),
(6,'CY100',140),
(7,'CY100',139),
(1,'BE100',146),
(2,'BE100',139),
(3,'BE100',120),
(4,'BE100',130),
(5,'BE100',148),
(6,'BE100',140),
(7,'BE100',130),
(1,'CS100',132),
(2,'CS100',133),
(3,'CS100',134),
(4,'CS100',143),
(5,'CS100',143),
(6,'CS100',144),
(7,'CS100',130),
(1,'CS205',120),
(2,'CS205',127),
(3,'CS205',130),
(4,'CS205',143),
(5,'CS205',124),
(6,'CS205',134),
(7,'CS205',133),
(1,'CS208',120),
(2,'CS208',127),
(3,'CS208',130),
(4,'CS208',143),
(5,'CS208',124),
(6,'CS208',134),
(7,'CS208',133),
(1,'IT301',142),
(2,'IT301',130),
(3,'IT301',134),
(4,'IT301',141),
(5,'IT301',120),
(6,'IT301',140),
(7,'IT301',133),
(1,'IT303',130),
(2,'IT303',122),
(3,'IT303',140),
(4,'IT303',130),
(5,'IT303',140),
(6,'IT303',129),
(7,'IT303',130),
(1,'IT305',142),
(2,'IT305',130),
(3,'IT305',134),
(4,'IT305',141),
(5,'IT305',120),
(6,'IT305',140),
(7,'IT305',133),
(1,'IT307',142),
(2,'IT307',146),
(3,'IT307',145),
(4,'IT307',149),
(5,'IT307',147),
(6,'IT307',148),
(7,'IT307',145),
(1,'CS305',148),
(2,'CS305',140),
(3,'CS305',142),
(4,'CS305',141),
(5,'CS305',139),
(6,'CS305',138),
(7,'CS305',124),
(1,'IT360',129),
(2,'IT360',130),
(3,'IT360',132),
(4,'IT360',129),
(5,'IT360',140),
(6,'IT360',134),
(7,'IT360',132);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

select distinct(reg_no),sum(marks) from (select s.reg_no,s.fname,c.course_id,d.marks from student s,course c,series_marks d,sem e where s.reg_no=d.reg_no and c.course_id=d.course_id and e.sem=c.sem and c.sem='S1') as foo;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
select reg_no,name,total,dense_RANK() over (order by total desc) as class_rank from (select distinct(foo.reg_no),foo.name,sum(marks) as total from (select s.reg_no,s.name,c.course_id,d.marks from student s,course c,university_total d,sem e where s.reg_no=d.reg_no and c.course_id=d.course_id and e.sem=c.sem and c.sem='S5') as foo group by foo.reg_no,foo.name order by reg_no asc) as list order by 1;




-------------------------------------------------------------------------------------------------------------------------------------------

BACKUP USING CURSOR
--------------------
--------------------

create table attbackup(reg_no int,course_id varchar(20),hr int,hr_present int,dat date);
--------------------------------------------------------------------------------------
create or replace function att_back() returns void as
$$
declare
cur cursor for select *from attendance where dat not in(select distinct dat from attbackup);
rec attendance%rowtype;
begin
	for rec in cur
	loop
	insert into attbackup values(rec.reg_no,rec.course_id,rec.hr,rec.hr_present,rec.dat); 
	end loop;
end;
$$
language plpgsql;        
	
------------------------------------------------------------------------------------------------------------------------------------

