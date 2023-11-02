create database StudentManagement;
use StudentManagement;

create table Department (
	dID				varchar(10)			primary key,
    dName 			varchar(50)			not null
);

create table Course (
	cID				char(5)				primary key,
    cName			varchar(50)			not null,
    credit 			int 				check(credit >= 1),
    theoryClass 	int 				default 0,
    practiceClass 	int					default 0
);

create table Instructor (
	iID				char(7)				primary key, 
    iName			varchar(50)			not null,
    dID				varchar(10),
    salary			float				not null,
    check (iID regexp '^[I][0-9]{6}$'),
    foreign key (dID) references Department(dID)
);

create table Teaches (
	iID				char(7),
    cID				char(5),
    semester		int,
    year			int,
    primary key (iID, cID, semester, year),
    foreign key (iID) references Instructor(iID),
    foreign key (cID) references Course(cID)
);

create table Student (
	sID				char(6)				primary key,
    sName			varchar(50)			not null,
    sex 			char(1)				check(sex in ('M', 'F')),
    dID				varchar(10),
    address			varchar(100),
    check (sID regexp '^[S][0-9]{5}$'),
    foreign key (dID) references Department(dID)
);

create table Grade (
	sID				char(6),
    cID				char(5),
    iID				char(7),
    semester		int,
    year			int,
    grade			float				check(grade between 0 and 10),
    primary key (sID, cID, iID, semester, year),
	foreign key (sID) references Student(sID),
    foreign key (cID) references Course(cID),
    foreign key (iID) references Teaches(iID)
);

-- Drop table Department
-- Drop table Course
-- Drop table Instructor
-- Drop table Teaches
-- Drop table Student
-- Drop table Grade

-- select * from Department;
insert into Department values ('law', 'Law School');
insert into Department values ('peda', 'Pedagogical School');
insert into Department values ('econ', 'College of Economic');
insert into Department values ('natsci', 'College of Natural Science');
insert into Department values ('tech', 'College of Infomation & Communication Technology');


-- select * from Course;
insert into Course values ('LN101', 'General Law', 2, 30, 0); 
insert into Course values ('SP101', 'Linear Algebra', 4, 60, 0); 
insert into Course values ('SP179', 'Public Speaking', 3, 30, 30); 
insert into Course values ('EC101', 'Economic 101', 2, 0, 30);  
insert into Course values ('TN001', 'Calculus 101', 3, 60, 0); 
insert into Course values ('TN004', 'Statistics', 3, 60, 0); 
insert into Course values ('CT102', 'Introduction to Programming', 4, 30, 60);
insert into Course values ('CT101', 'Basic Infomatic', 4, 30, 60);


-- select * from Instructor; 
insert into Instructor values ('I001001', 'John Doe', 'law', 65000); 
insert into Instructor values ('I002001', 'Michael Johnson', 'peda', 60000); 
insert into Instructor values ('I002002', 'Emily Williams', 'peda', 58000); 
insert into Instructor values ('I003001', 'Daniel Brown', 'econ', 58000); 
insert into Instructor values ('I004001', 'Samantha Martinez', 'natsci', 67000);
insert into Instructor values ('I004002', 'Jane Smith', 'natsci', 70000);
insert into Instructor values ('I005001', 'Joe Generic', 'tech', 64000);
insert into Instructor values ('I005002', 'Olivia Davis', 'tech', 60000);


-- select * from Teaches;
insert into Teaches values ('I001001', 'LN101', 1, 2016);
insert into Teaches values ('I002002', 'SP101', 1, 2016);
insert into Teaches values ('I005001', 'CT101', 1, 2016);
insert into Teaches values ('I003001', 'EC101', 2, 2016);
insert into Teaches values ('I004002', 'TN004', 2, 2016);
insert into Teaches values ('I005002', 'CT102', 2, 2016);
insert into Teaches values ('I002001', 'SP179', 3, 2016);
insert into Teaches values ('I004001', 'TN001', 3, 2016);

insert into Teaches values ('I002002', 'SP179', 1, 2017);
insert into Teaches values ('I003001', 'EC101', 1, 2017);
insert into Teaches values ('I005002', 'CT101', 2, 2017);
insert into Teaches values ('I004002', 'TN001', 2, 2017);
insert into Teaches values ('I001001', 'LN101', 2, 2017);
insert into Teaches values ('I002001', 'SP101', 3, 2017);
insert into Teaches values ('I004001', 'TN004', 3, 2017);
insert into Teaches values ('I005001', 'CT102', 3, 2017);

insert into Teaches values ('I004001', 'TN001', 1, 2018);
insert into Teaches values ('I004002', 'TN004', 1, 2018);
insert into Teaches values ('I002002', 'SP101', 2, 2018);
insert into Teaches values ('I002001', 'SP179', 2, 2018);
insert into Teaches values ('I003001', 'EC101', 2, 2018);
insert into Teaches values ('I001001', 'LN101', 3, 2018);
insert into Teaches values ('I005001', 'CT101', 3, 2018);
insert into Teaches values ('I005002', 'CT102', 1, 2018);

-- select * from Student;
insert into Student values ('S01001', 'Horus Nguyen', 'M', 'law', 'Condo Building A, room 101');
insert into Student values ('S01002', 'Leman Russ', 'M', 'law', 'Condo Building A, room 102');
insert into Student values ('S01003', 'Fulgrim Le', 'F', 'law', 'Condo Building A, room 103');
insert into Student values ('S01004', 'Vulkan Pham', 'M', 'law', 'Condo Building A, room 104');

insert into Student values ('S02001', 'Erda Huynh', 'F', 'peda', 'Condo Building A, room 105');
insert into Student values ('S02002', 'Konrad Curze', 'M', 'peda', 'Condo Building A, room 106');
insert into Student values ('S02003', 'Sanguinius Ngo', 'F', 'peda', 'Condo Building A, room 107');
insert into Student values ('S02004', 'Henry Do', 'M', 'peda', 'Condo Building A, room 108');

insert into Student values ('S03001', 'Isabella Vo', 'F', 'econ', 'Condo Building A, room 109');
insert into Student values ('S03002', 'Jaghatai Khan', 'M', 'econ', 'Condo Building A, room 110');
insert into Student values ('S03003', 'Rogal Dorn', 'M', 'econ', 'Condo Building A, room 111');
insert into Student values ('S03004', 'Lily Nguyen', 'F', 'econ', 'Condo Building A, room 112');

insert into Student values ('S04001', 'Lion El Jonson', 'M', 'natsci', 'Condo Building A, room 113');
insert into Student values ('S04002', 'Lotara Sarrin', 'F', 'natsci', 'Condo Building A, room 114');
insert into Student values ('S04003', 'Corvus Corax', 'M', 'natsci', 'Condo Building A, room 115');
insert into Student values ('S04004', 'Penelope Bui', 'F', 'natsci', 'Condo Building A, room 116');

insert into Student values ('S05001', 'Constantin Valdor', 'M', 'tech', 'Condo Building A, room 117');
insert into Student values ('S05002', 'Roboute Guilliman', 'M', 'tech', 'Condo Building A, room 118');
insert into Student values ('S05003', 'Perturabo Le', 'M', 'tech', 'Condo Building A, room 119');
insert into Student values ('S05004', 'Angron Vo', 'M', 'tech', 'Condo Building A, room 120');

-- select * from Grade;
insert into Grade values ('S05004', 'LN101', 'I001001', 1, 2016, 8.8);
insert into Grade values ('S01001', 'LN101', 'I001001', 1, 2016, 8.0);
insert into Grade values ('S01002', 'LN101', 'I001001', 1, 2016, 7.8);
insert into Grade values ('S01003', 'CT101', 'I005001', 1, 2016, 8.3);
insert into Grade values ('S01004', 'LN101', 'I001001', 1, 2016, 8.5);
insert into Grade values ('S02001', 'CT101', 'I005001', 1, 2016, 7.5);
insert into Grade values ('S02004', 'SP101', 'I002002', 1, 2016, 7.8);
insert into Grade values ('S04003', 'LN101', 'I001001', 1, 2016, 8.9);
insert into Grade values ('S03002', 'LN101', 'I001001', 1, 2016, 8.7);
insert into Grade values ('S03003', 'LN101', 'I001001', 1, 2016, 7.8);
insert into Grade values ('S04001', 'SP101', 'I002002', 1, 2016, 8.7);
insert into Grade values ('S02003', 'LN101', 'I001001', 1, 2016, 8.0);

insert into Grade values ('S05003', 'EC101', 'I003001', 2, 2016, 7.7);
insert into Grade values ('S04003', 'EC101', 'I003001', 2, 2016, 8.3);
insert into Grade values ('S05001', 'CT102', 'I005002', 2, 2016, 8.5);
insert into Grade values ('S04002', 'CT102', 'I005002', 2, 2016, 8.5);
insert into Grade values ('S03003', 'TN004', 'I004002', 2, 2016, 8.5);
insert into Grade values ('S03001', 'EC101', 'I003001', 2, 2016, 7.5);

insert into Grade values ('S02003', 'TN001', 'I004001', 3, 2016, 8.7);
insert into Grade values ('S03004', 'SP179', 'I002001', 3, 2016, 8.2);



insert into Grade values ('S01001', 'SP179', 'I002002', 1, 2017, 7.5);
insert into Grade values ('S01003', 'EC101', 'I003001', 1, 2017, 7.5);
insert into Grade values ('S01004', 'SP179', 'I002002', 1, 2017, 7.0);
insert into Grade values ('S02002', 'SP179', 'I002002', 1, 2017, 9.0);
insert into Grade values ('S04003', 'SP179', 'I002002', 1, 2017, 9.0);
insert into Grade values ('S05002', 'LN101', 'I001001', 2, 2017, 8.3);

insert into Grade values ('S03003', 'CT101', 'I005002', 2, 2017, 9.1);
insert into Grade values ('S01001', 'CT101', 'I005002', 2, 2017, 9.0);
insert into Grade values ('S02003', 'CT101', 'I005002', 2, 2017, 9.5);

insert into Grade values ('S02002', 'SP101', 'I002001', 3, 2017, 8.8);
insert into Grade values ('S03002', 'CT102', 'I005001', 3, 2017, 7.9);
insert into Grade values ('S04002', 'TN004', 'I004001', 3, 2017, 7.8);



insert into Grade values ('S01004', 'TN004', 'I004002', 1, 2018, 9.2);
insert into Grade values ('S03004', 'TN001', 'I004001', 1, 2018, 9.3);
insert into Grade values ('S04004', 'TN001', 'I004001', 1, 2018, 9.1);
insert into Grade values ('S05003', 'TN004', 'I004001', 1, 2018, 9.0);
insert into Grade values ('S05002', 'CT102', 'I005002', 1, 2018, 9.1);

insert into Grade values ('S01002', 'SP179', 'I002001', 2, 2018, 8.5);
insert into Grade values ('S02003', 'SP179', 'I002001', 2, 2018, 7.8);
insert into Grade values ('S02004', 'LN101', 'I001001', 2, 2017, 8.5);
insert into Grade values ('S05004', 'SP179', 'I002001', 2, 2018, 7.5);
insert into Grade values ('S05002', 'SP101', 'I002002', 2, 2018, 7.9);
insert into Grade values ('S05003', 'SP179', 'I002001', 2, 2018, 8.6);
insert into Grade values ('S03002', 'SP179', 'I002001', 2, 2018, 9.2);
insert into Grade values ('S03003', 'SP101', 'I002002', 2, 2018, 8.0);

insert into Grade values ('S01003', 'SP179', 'I002001', 3, 2018, 9.0);
insert into Grade values ('S01003', 'LN101', 'I001001', 3, 2018, 8.0);
insert into Grade values ('S02002', 'CT101', 'I005001', 3, 2018, 7.2);
insert into Grade values ('S04002', 'LN101', 'I001001', 3, 2018, 9.2);
insert into Grade values ('S04003', 'CT101', 'I005001', 3, 2018, 7.7);
insert into Grade values ('S04004', 'CT101', 'I005001', 3, 2018, 8.6);
insert into Grade values ('S05003', 'SP101', 'I002001', 3, 2017, 8.9);
-- -------------------------------------------------------------------------------------------------------------------------









