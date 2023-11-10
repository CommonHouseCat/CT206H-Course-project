This is a course project that for CT206H, implementing Connector/J with MySQL. Below is the schema for the database:

*Department:
	dID				varchar(10)		primary key
	dName 			varchar(50)		not null
	
*Course:
	cID				char(5)			primary key
	cName 			varchar(50)		not null
	credit			int				check (x >= 1)
	theoryClass		int				default 0
	practiceClass	int				default 0

*Instructor:	
	iID				char(7)			primary key, check (iID regexp '^[I][0-9]{6}$')
	iName			varchar(50)		not null
	dID				varchar(10) 	foreign key
	salary			float			not null

*Teaches:
	iID				char(7)			primary key, foreign key
	cID				char(5)			primary key, foreign key
	semester		int				primary key
	year			int 			primary key

*Student:
	sID				char(6)			primary key, check (sID regexp '^[S][0-9]{5}$')
	sName			varchar(50)		not null
	sex				char(1)			check sex in ('M', 'F')
	dID				varchar(10)		foreign key
	address			varchar(100)	

*Grade:
	sID				char(6)			primary key, foreign key
	cID				char(5)			primary key, foreign key
	iID				char(7)			primary key, foreign key
	semester		int 			primary key
	year			int				primary key			
	grade			float			check (grade between 0 and 10)

-Functions:
+ ADD_STUDENT
+ ADD_GRADE
+ CALCULATE_GPA
+ YEARLY_TUITION
+ REPORT_CARD
+ INSTRUCTOR_SCHEDULE
+ STUDENT_BY_DEPARTMENT
