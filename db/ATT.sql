﻿Monday sadp toc mpc os 
Tuesday cn elective os mpc
Wednesday sadp toc elective cn 

Monday MA101 MA201 CS202 CS201 
Tuesday HS210 MA202 CS201 CS202
Wednesday MA101 MA201 MA202 HS210 
------------------------------------------------------------------------------
Create table attendance(
reg_no int,
course_id varchar(10),
hr int,
hr_present int
dat date
);
-------------------------------------------------------------------------------
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
