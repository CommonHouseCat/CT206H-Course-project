create database StudentManagement;
use StudentManagement;

create table department (
	dID				varchar(10),
    dName			varchar(50)
);

create table course (
	cID				char(5),
    cName			varchar(100),
    credit			int,
    theoryClass		int,
    practiceClass 	int
);

create table student (
	sID				char(5),
    sName 			varchar(50),
    sex				char(1),
    DOB 			date,
    POB				varchar(30),
    sAddress		varchar(100),
    dID				varchar(10)
);

create table grade (
	sID				char(5),
    cID				char(5),
    grade			float
);

-- drop table department;
-- drop table course;
-- drop table grade;
-- drop table student;

insert into department values ('ls', 'Law School');
insert into department values ('ps', 'Pedagogical School');
insert into department values ('ns', 'Natural Science');
insert into department values ('ss', 'Social Science');
insert into department values ('argi', 'Economic');
insert into department values ('poly', 'Polytechnic School');
insert into department values ('tech', 'College of Infomation & Communication Technology');
-- select * from department;

insert into course values ('', '', , , );
