drop database if exists cpsc351project;
create database cpsc351project;
use cpsc351project;
create table coursesAvailable
(
    CRN                 int          not null,
    course              varchar(255) null,
    section             varchar(45)  null,
    courseTitle         varchar(45)  null,
    credits             varchar(45)  null,
    areaofLLC           varchar(45)  null,
    type                varchar(45)  null,
    days                varchar(45)  null,
    time                varchar(45)  null,
    location            varchar(45)  null,
    instructor          varchar(45)  null,
    seatsstillavailable varchar(45)  null,
    status              varchar(45)  null,
    year               int          not null,
    term               varchar(255) not null,
    constraint CRN_UNIQUE
        unique (CRN),
    primary key (CRN, year, term)
);

create table degreeRequirements
(
    CouseNumber   int         not null,
    CourseSubject varchar(45) not null,
    courseTitle   varchar(45) null,
    credits       int         null,
    year          int         not null,
    primary key (CouseNumber, CourseSubject, year)
);

create table coursesAvailable_has_degreeRequirements
(
    coursesAvailable_CRN                               int         not null,
    coursesAvailable_courseSchedule_CRN                int         not null,
    coursesAvailable_courseSchedule_Student_student_ID int         not null,
    degreeRequirements_CouseNumber                     int         not null,
    degreeRequirements_CourseSubject                   varchar(45) not null,
    semesterTerm                                       varchar(10) not null,
    year                                               int         not null,
    primary key (coursesAvailable_CRN, coursesAvailable_courseSchedule_CRN,
                 coursesAvailable_courseSchedule_Student_student_ID, degreeRequirements_CouseNumber,
                 degreeRequirements_CourseSubject),
    constraint fk_coursesAvailable_has_degreeRequirements_coursesAvailable1
        foreign key (coursesAvailable_CRN) references coursesAvailable (CRN),
    constraint fk_coursesAvailable_has_degreeRequirements_degreeRequirements1
        foreign key (degreeRequirements_CouseNumber, degreeRequirements_CourseSubject) references degreeRequirements (CouseNumber, CourseSubject)
);

create index fk_coursesAvailable_has_degreeRequirements_coursesAvailable_idx
    on coursesAvailable_has_degreeRequirements (coursesAvailable_CRN, coursesAvailable_courseSchedule_CRN,
                                                coursesAvailable_courseSchedule_Student_student_ID);

create index fk_coursesAvailable_has_degreeRequirements_degreeRequirement_idx
    on coursesAvailable_has_degreeRequirements (degreeRequirements_CouseNumber, degreeRequirements_CourseSubject);

create table departmentHead
(
    facultyID              int         not null
        primary key,
    courseOverrideApproval varchar(45) null,
    constraint facultyID_UNIQUE
        unique (facultyID)
);

create table courseOverride
(
    overrideID               int          not null,
    CRN                      int          null,
    courseNumber             varchar(45)  null,
    courseSubject            varchar(45)  null,
    requestReason            varchar(200) null,
    overrideRequested        varchar(45)  null,
    departmentHead_facultyID int          not null,
    primary key (overrideID, departmentHead_facultyID),
    constraint overrideID_UNIQUE
        unique (overrideID),
    constraint fk_courseOverride_departmentHead1
        foreign key (departmentHead_facultyID) references departmentHead (facultyID)
);

create index fk_courseOverride_departmentHead1_idx
    on courseOverride (departmentHead_facultyID);

create table professor
(
    facultyID        int          not null
        primary key,
    advisorStatus    varchar(45)  null,
    first_name       varchar(45)  not null,
    last_name        varchar(45)  not null,
    email            varchar(45)  not null,
    phoneNumber      varchar(45)  null,
    office           varchar(45)  null,
    biography        varchar(500) null,
    courses_teaching varchar(500) null,
    professor_img    blob         null,
    constraint email_UNIQUE
        unique (email),
    constraint facultyID_UNIQUE
        unique (facultyID),
    constraint phoneNumber_UNIQUE
        unique (phoneNumber)
);

create table Student
(
    student_ID          int          not null
        primary key,
    first_name          varchar(45)  not null,
    last_name           varchar(45)  not null,
    email               varchar(100) not null,
    entry_year          varchar(45)  not null,
    expected_graduation varchar(45)  not null,
    department          varchar(100) null,
    major               varchar(45)  null,
    minor               varchar(45)  null,
    fk_facultyID        int          not null,
    constraint email_UNIQUE
        unique (email),
    constraint student_ID_UNIQUE
        unique (student_ID),
    constraint fk_professor_facultyID
        foreign key (fk_facultyID) references professor (facultyID)
);

create table advisingMeeting
(
    meetDateTIme        datetime    not null,
    meetLocation        varchar(45) null,
    meetSubject         varchar(45) null,
    Student_student_ID  int         not null,
    professor_facultyID int         not null,
    primary key (Student_student_ID, professor_facultyID, meetDateTIme),
    constraint fk_advisingMeeting_Student1
        foreign key (Student_student_ID) references Student (student_ID),
    constraint fk_advisingMeeting_professor1
        foreign key (professor_facultyID) references professor (facultyID)
);

create index fk_advisingMeeting_Student1_idx
    on advisingMeeting (Student_student_ID);

create index fk_advisingMeeting_professor1_idx
    on advisingMeeting (professor_facultyID);

create table advisingNotes
(
    dateAndTime                         datetime     not null,
    meetNotes                           varchar(600) null,
    advisingMeeting_Student_student_ID  int          not null,
    advisingMeeting_professor_facultyID int          not null,
    primary key (dateAndTime, advisingMeeting_Student_student_ID, advisingMeeting_professor_facultyID),
    constraint fk_advisingNotes_advisingMeeting1
        foreign key (advisingMeeting_Student_student_ID,
                     advisingMeeting_professor_facultyID) references advisingMeeting (Student_student_ID, professor_facultyID)
);

create index fk_advisingNotes_advisingMeeting1_idx
    on advisingNotes (advisingMeeting_Student_student_ID, advisingMeeting_professor_facultyID);

create table courseOverrideEvent
(
    Student_student_ID        int      not null,
    courseOverride_overrideID int      not null,
    dateAndTime               datetime null,
    primary key (Student_student_ID, courseOverride_overrideID),
    constraint Student_student_ID_UNIQUE
        unique (Student_student_ID),
    constraint courseOverride_overrideID_UNIQUE
        unique (courseOverride_overrideID),
    constraint fk_Student_has_courseOverride_Student1
        foreign key (Student_student_ID) references Student (student_ID),
    constraint fk_Student_has_courseOverride_courseOverride1
        foreign key (courseOverride_overrideID) references courseOverride (overrideID)
);

create index fk_Student_has_courseOverride_Student1_idx
    on courseOverrideEvent (Student_student_ID);

create index fk_Student_has_courseOverride_courseOverride1_idx
    on courseOverrideEvent (courseOverride_overrideID);

create table registrar
(
    fk_facultyID int         not null
        primary key,
    email        varchar(45) not null,
    password     varchar(45) not null,
    constraint email_UNIQUE
        unique (email),
    constraint fk_facultyID_UNIQUE
        unique (fk_facultyID),
    constraint fk_professor_facultyID_2
        foreign key (fk_facultyID) references professor (facultyID)
);

create table studentPin
(
    pin_number          int         not null,
    advising_semester   varchar(45) not null,
    Student_student_ID  int         not null,
    semester_term       varchar(45) not null,
    professor_facultyID int         null,
    primary key (pin_number, Student_student_ID, semester_term),
    constraint Student_student_ID_UNIQUE
        unique (Student_student_ID),
    constraint pin_number_UNIQUE
        unique (pin_number),
    constraint fk_studentPin_Student
        foreign key (Student_student_ID) references Student (student_ID),
    constraint studentPin_ibfk_1
        foreign key (professor_facultyID) references professor (facultyID)
);

create index fk_studentPin_Student_idx
    on studentPin (Student_student_ID);

create index fk_studentPin_registrar1_idx
    on studentPin (semester_term);

create index professor_facultyID
    on studentPin (professor_facultyID);

create table studentSchedule
(
    CRN                int          not null,
    courseNumber       int          null,
    courseSubject      varchar(45)  null,
    courseTitle        varchar(45)  null,
    professor          varchar(45)  null,
    day                varchar(45)  null,
    time               varchar(45)  null,
    location           varchar(45)  null,
    credits            int          null,
    grade              varchar(2)   null,
    year               int          not null,
    term               varchar(255) not null,
    Student_student_ID int          not null,
    primary key (year, term, CRN, Student_student_ID),
#     constraint fk_courseSchedule_CRN_year_term
#         foreign key (CRN, year, term) references coursesAvailable (CRN, year, term),
    constraint fk_courseSchedule_Student1
        foreign key (Student_student_ID) references Student (student_ID)
);

create index fk_courseSchedule_Student1_idx
    on studentSchedule (Student_student_ID);

-- -----------------------------------------------------
-- Insert Statements
-- -----------------------------------------------------

-- insert into professor table --
insert into professor
values (00123456, 'Yes', 'Michael', 'Lapke', 'michael.lapke@cnu.edu', '(757) 594-8921', 'Luter Hall 331',
        'Michael Lapke has served as a business professor at University of Mary Washington for over 15 years before joining the CNU family.',
        'CPSC 350 and CPSC 351',
        '/Users/abigailcontreras/PhpstormProjects/CPSC-351/images/lapke_cnu_profile_picture.jpeg');
insert into professor
values (101010, 'Yes', 'DBA', 'Admin', 'dbaadmin@cnu.edu', '(111) 111-1111', 'Admin', 'Admin', 'Admin', '');
insert into professor
values (987654, 'Yes', 'Albus', 'Dumbledore', 'albus.dumbledore@cnu.edu', '(234) 456-6789', 'Luter Hall 101',
        'Hogwarts Headmaster.', 'Wizardry 101',
        LOAD_FILE('/Users/abigailcontreras/PhpstormProjects/CPSC-351/images/lapke_cnu_profile_picture.jpeg'));

-- update table professor set professor_img = 'BULK( ' where facultyID='123456';
-- INSERT INTO professor (professor_img)
-- SELECT * FROM OPENROWSET(BULK N 'C:\Users\letha\PhpstormProjects\CPSC-351\images\lapke_cnu_profile_picture.jpeg', SINGLE_BLOB) image;

-- insert into registrar table --
insert into registrar
values (00123456, 'michael.lapke@cnu.edu', 'lapkepass');
insert into registrar
values (101010, 'dbaadmin@cnu.edu', 'admin');
insert into registrar
values (987654, 'albus.dumbledore@cnu.edu', 'wizard');

-- insert into student table --
INSERT INTO Student
VALUES (16239, 'Ron', 'Weasley', 'ron.weasley.19@cnu.edu', 'Fall 2019', 'Spring 2023', 'PCSE', 'Information Science',
        'Computer Science', 987654);
INSERT INTO Student
VALUES (26349, 'Luna', 'Lovegood', 'luna.lovegood.19@cnu.edu', 'Fall 2019', 'Spring 2023', 'PCSE',
        'Information Science', 'Graphic Arts', 987654);
INSERT INTO Student
VALUES (63725, 'Harry', 'Potter', 'harry.potter.19@cnu.edu', 'Fall 2019', 'Spring 2022', 'PCSE', 'Information Science',
        'Spanish', 987654);
INSERT INTO Student
VALUES (293846, 'Hermione', 'Granger', 'hermione.granger.19@cnu.edu', 'Fall 2019', 'Spring 2023', 'PCSE',
        'Information Science', 'Computer Science', 987654);
INSERT INTO Student
VALUES (970886, 'Patrick', 'Tehan', 'patrick.tehan.19@cnu.edu', 'Fall 2019', 'Spring 2023', 'PCSE',
        'Information Science', 'None', 123456);
INSERT INTO Student
VALUES (970887, 'Eleanor', 'Miley', 'elanor.miley.19@cnu.edu', 'Fall 2019', 'Spring 2023', 'PCSE',
        'Information Science', 'Leadership Studies', 123456);
INSERT INTO Student
VALUES (970888, 'Brett', 'Kropinski', 'brett.kropinski.20@cnu.edu', 'Fall 2019', 'Spring 2023', 'PCSE',
        'Information Science', 'None', 123456);
INSERT INTO Student
VALUES (975829, 'Abigail', 'Contreras', 'abigail.contreras.19@cnu.edu', 'Fall 2019', 'Spring 2022', 'PCSE',
        'Information Science', 'Business Administration', 123456);
INSERT INTO Student
VALUES (976980, 'Jack', 'McDonald', 'jack.mcdonald.19@cnu.edu', 'Fall 2019', 'Spring 2023', 'PCSE',
        'Information Science', 'None', 123456);
-- View Meetings

-- insert into advising meeting table --
insert into advisingMeeting
values ('2022-09-23 12:00:00', 'Virtual', 'Advising', 16239, 987654);
insert into advisingMeeting
values ('2022-12-21 01:00:00', 'In Person', 'Advising', 16239, 987654);
insert into advisingMeeting
values ('2022-01-20 01:30:00', 'Virtual', 'Advising', 26349, 987654);
insert into advisingMeeting
values ('2022-04-05 01:00:00', 'Virtual', 'Advising', 26349, 987654);
insert into advisingMeeting
values ('2022-06-27 12:30:00', 'In Person', 'Advising', 26349, 987654);
insert into advisingMeeting
values ('2022-02-01 12:30:00', 'In Person', 'Advising', 63725, 987654);
insert into advisingMeeting
values ('2022-03-12 12:00:00', 'Virtual', 'Advising', 63725, 987654);
insert into advisingMeeting
values ('2022-07-21 12:00:00', 'Virtual', 'Advising', 293846, 987654);
insert into advisingMeeting
values ('2022-07-21 12:30:00', 'In Person', 'Advising', 293846, 987654);
insert into advisingMeeting
values ('2022-11-08 01:00:00', 'Virtual', 'Advising', 293846, 987654);
insert into advisingMeeting
values ('2022-04-21 13:30:00', 'In Person', 'Advising', 970887, 123456);
insert into advisingMeeting
values ('2021-09-14 17:21:04', 'In Person', 'Advising', 970888, 123456);
insert into advisingMeeting
values ('2022-02-21 01:00:00', 'Virtual', 'Advising', 970886, 123456);
insert into advisingMeeting
values ('2022-02-21 01:30:00', 'Virtual', 'Advising', 970886, 123456);
insert into advisingMeeting
values ('2022-02-21 12:00:00', 'Virtual', 'Advising', 970887, 123456);
insert into advisingMeeting
values ('2022-02-21 12:30:00', 'In Person', 'Advising', 970887, 123456);
insert into advisingMeeting
values ('2022-03-21 01:00:00', 'Virtual', 'Advising', 970888, 123456);
insert into advisingMeeting
values ('2022-03-21 12:00:00', 'Virtual', 'Advising', 970888, 123456);
insert into advisingMeeting
values ('2022-03-21 12:30:00', 'In Person', 'Advising', 975829, 123456);
insert into advisingMeeting
values ('2022-04-21 01:00:00', 'In Person', 'Advising', 975829, 123456);
insert into advisingMeeting
values ('2022-04-21 12:00:00', 'Virtual', 'Advising', 976980, 123456);
insert into advisingMeeting
values ('2022-04-21 12:30:00', 'In Person', 'Advising', 976980, 123456);

-- insert into advising notes table --
INSERT INTO advisingNotes
VALUES ('2021-09-14 17:21:04', 'Transferred. Has enough credits but needs to fulfill major reqs.', 970888, 123456);
INSERT INTO advisingNotes
VALUES ('2022-01-20 01:30:00', 'Is doing well, but keep an eye on grades, set up later meetings for help.', 26349,
        987654);
INSERT INTO advisingNotes
VALUES ('2022-02-01 12:30:00', 'On top of everything', 63725, 987654);
INSERT INTO advisingNotes
VALUES ('2022-02-14 17:13:05', 'Struggling with grades.  Check in in a month', 16239, 987654);
INSERT INTO advisingNotes
VALUES ('2022-02-21 01:00:00', 'Concerns about CPSC 351.  Check in later in the semester.', 975829, 123456);
INSERT INTO advisingNotes
VALUES ('2022-03-14 17:13:17', 'Averaging with Bs.  Much improvement grade wise.  ', 16239, 987654);
INSERT INTO advisingNotes
VALUES ('2022-03-21 01:00:00', 'Brought grade up in CPSC 351.', 975829, 123456);
INSERT INTO advisingNotes
VALUES ('2022-04-21 12:00:00', 'Had a few questions concerning graduation approaching.', 975829, 123456);
INSERT INTO advisingNotes
VALUES ('2022-07-21 12:00:00', 'Wanted to ask advice about internships. ', 293846, 987654);

-- insert into studentPin table --
INSERT INTO studentPin
VALUES (123654, 'Spring 2022', 16239, 'Fall 2022', 987654);
INSERT INTO studentPin
VALUES (226098, 'Spring 2022', 970887, 'Fall 2022', 123456);
INSERT INTO studentPin
VALUES (293846, 'Spring 2022', 293846, 'Fall 2022', 987654);
INSERT INTO studentPin
VALUES (432268, 'Spring 2022', 970886, 'Fall 2022', 123456);
INSERT INTO studentPin
VALUES (526713, 'Spring 2022', 63725, 'Fall 2022', 987654);
INSERT INTO studentPin
VALUES (567291, 'Spring 2022', 26349, 'Fall 2022', 987654);
INSERT INTO studentPin
VALUES (632787, 'Spring 2022', 976980, 'Fall 2022', 123456);
INSERT INTO studentPin
VALUES (636727, 'Spring 2022', 975829, 'Fall 2022', 123456);
INSERT INTO studentPin
VALUES (773627, 'Spring 2022', 970888, 'Fall 2022', 123456);

-- insert into studentSchedule table --

insert into studentSchedule
VALUES (8558, 109, 'BIOL', 'General Biology Laboratory', 'Loftis, Jon', 'M', '1800-1950', 'FORBES 1027', 1, null, 2022,
        'Spring', 970886);
insert into studentSchedule
VALUES (8488, 108, 'BIOL', 'General Biology II', 'Waldien, David', 'TR', '1800-1915', 'LUTR 121', 3, null, 2022,
        'Spring', 970886);
insert into studentSchedule
VALUES (8251, 141, 'PHYS', 'How Things Work', 'Cole, Leon', 'TR', '1500-1615', 'LUTR 269', 3, null, 2022, 'Spring',
        970886);
insert into studentSchedule
VALUES (8171, 371, 'CPEN', 'WI: Computer Ethics', 'Valdez, Katherine', 'MW', '1600-1650', 'LUTR 322', 3, null, 2022,
        'Spring', 970886);
insert into studentSchedule
VALUES (8175, 428, 'CYBR', 'Network Security and Cryptography', 'Kreider, Christopher', 'TR', '1100-1215', 'LUTR 258',
        3, null, 2022, 'Spring', 970886);
insert into studentSchedule
VALUES (8238, 351, 'CPSC', 'Info Sys Design/Implementation', 'Lapke, Michael', 'TR', '1630-1745', 'LUTR 258', 3, null,
        2022, 'Spring', 970886);
insert into studentSchedule
VALUES (8874, 204, 'DANC', 'Ballet I', 'Lent, Jennifer', 'MW', '1300-1415', 'FERG T177', 3, null, 2022, 'Spring',
        970887);
insert into studentSchedule
VALUES (8244, 440, 'CPSC', 'Database Management Systems', 'Desphande, Priya', 'MWF', '1300-1350', 'LUTR 258', 3, null,
        2022, 'Spring', 970887);
insert into studentSchedule
VALUES (8238, 351, 'CPSC', 'Info Sys Design/Implementation', 'Lapke, Michael', 'TR', '1630-1745', 'LUTR 258', 3, null,
        2022, 'Spring', 970887);
insert into studentSchedule
VALUES (8236, 335, 'CPSC', 'Data Communication Systems', 'Siasi, Nazli', 'MW', '1800-1915', 'LUTR 121', 3, null, 2022,
        'Spring', 970887);
insert into studentSchedule
VALUES (8040, 231, 'BUSN', 'Applied Business Statistics', 'Sixbey, Shannon', 'TR', '1500-1615', 'LUTR 109', 3, null,
        2022, 'Spring', 970887);
insert into studentSchedule
VALUES (8230, 255, 'CPSC', 'Programming for Applications', 'McElfresh, Scott', 'MWF', '1100-1150', 'LUTR 323', 3, null,
        2022, 'Spring', 970888);
insert into studentSchedule
VALUES (8950, 200, 'AMST', 'Evolution-American Experiment', 'Morrison, Jeffry', 'TR', '1100-1215', 'MCM 257', 3, null,
        2022, 'Spring', 970888);
insert into studentSchedule
VALUES (8238, 351, 'CPSC', 'Info Sys Design/Implementation', 'Lapke, Michael', 'TR', '1630-1745', 'LUTR 258', 3, null,
        2022, 'Spring', 970888);
insert into studentSchedule
VALUES (8216, 216, 'CPSC', 'Multimedia and Web Publishing', 'Baird, Amy', 'MWF', '0900-0950', 'LUTR 109', 3, null, 2022,
        'Spring', 970888);
insert into studentSchedule
VALUES (8065, 303, 'BUSN', 'Fundamentals of Business', 'McGreevy, Priscilla', 'MWF', '1000-1050', 'LUTR 242', 3, null,
        2022, 'Spring', 970888);
insert into studentSchedule
VALUES (8175, 428, 'CYBR', 'Network Security and Cryptography', 'Kreider, Christopher', 'TR', '1100-1215', 'LUTR 258',
        3, null, 2022, 'Spring', 975829);
insert into studentSchedule
VALUES (8238, 351, 'CPSC', 'Info Sys Design/Implementation', 'Lapke, Michael', 'TR', '1630-1745', 'LUTR 258', 3, null,
        2022, 'Spring', 975829);
insert into studentSchedule
VALUES (8247, 445, 'CPSC', 'WI: Information Systems Lab', 'Kreider, Christopher', 'MWF', '1400-1450', 'LUTR 323', 3,
        null, 2022, 'Spring', 975829);
insert into studentSchedule
VALUES (8134, 300, 'FINC', 'Managerial Finance', 'Guha, Sanjib', 'MW', '1600-1715', 'LUTR 123', 3, null, 2022, 'Spring',
        975829);
insert into studentSchedule
VALUES (8106, 448, 'BUSN', 'Enterprise Management', 'Wilson, Robert', 'TR', '0930-1045', 'MCM 110', 3, null, 2022,
        'Spring', 975829);
insert into studentSchedule
VALUES (8074, 305, 'BUSN', 'Introduction to Data Analytics', 'Lamprecht, Donna', 'TR', '1800-1915', 'LUTR 105', 3, null,
        2022, 'Spring', 975829);
insert into studentSchedule
VALUES (8216, 216, 'CPSC', 'Multimedia and Web Publishing', 'Baird, Amy', 'MWF', '0900-0950', 'LUTR 109', 3, null, 2022,
        'Spring', 976980);
insert into studentSchedule
VALUES (8175, 428, 'CYBR', 'Network Security and Cryptography', 'Kreider, Christopher', 'TR', '1100-1215', 'LUTR 258',
        3, null, 2022, 'Spring', 976980);
insert into studentSchedule
VALUES (8238, 351, 'CPSC', 'Info Sys Design/Implementation', 'Lapke, Michael', 'TR', '1630-1745', 'LUTR 258', 3, null,
        2022, 'Spring', 976980);
insert into studentSchedule
VALUES (8169, 371, 'CPEN', 'WI: Computer Ethics', 'Valdez, Katherine', 'MW', '1400-1450', 'LUTR 322', 3, null, 2022,
        'Spring', 976980);
insert into studentSchedule
VALUES (8065, 303, 'BUSN', 'Fundamentals of Business', 'McGreevy, Priscilla', 'MWF', '1000-1050', 'LUTR 242', 3, null,
        2022, 'Spring', 976980);
