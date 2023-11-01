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
    foreign key (iID) references Instructor(iID)
);




























