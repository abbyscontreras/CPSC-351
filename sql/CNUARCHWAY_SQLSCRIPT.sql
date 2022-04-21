drop database if exists cnuarchway;
create database cnuarchway;
use cnuarchway;
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
    constraint fk_courseSchedule_CRN_year_term
        foreign key (CRN, year, term) references coursesAvailable (CRN, year, term),
    constraint fk_courseSchedule_Student1
        foreign key (Student_student_ID) references Student (student_ID)
);

create index fk_courseSchedule_Student1_idx
    on studentSchedule (Student_student_ID);
