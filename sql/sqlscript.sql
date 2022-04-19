SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cpsc351
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cpsc351`;

-- -----------------------------------------------------
-- Schema cpsc351
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cpsc351` DEFAULT CHARACTER SET utf8;
USE `cpsc351`;

-- -----------------------------------------------------
-- Table `cpsc351`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`Student`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`Student`
(
    `student_ID`          INT(8)       NOT NULL,
    `first_name`          VARCHAR(45)  NOT NULL,
    `last_name`           VARCHAR(45)  NOT NULL,
    `email`               VARCHAR(100) NOT NULL,
    `entry_year`          VARCHAR(45)  NOT NULL,
    `expected_graduation` VARCHAR(45)  NOT NULL,
    `department`          VARCHAR(100) NULL,
    `major`               VARCHAR(45)  NULL,
    `minor`               VARCHAR(45)  NULL,
    `fk_facultyID`        INT(8)       NOT NULL,
    PRIMARY KEY (`student_ID`),
    CONSTRAINT `fk_professor_facultyID`
        FOREIGN KEY (`fk_facultyID`)
            REFERENCES `cpsc351`.`professor` (`facultyID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    UNIQUE INDEX `student_ID_UNIQUE` (`student_ID` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`registrar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`registrar`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`registrar`
(
    `fk_facultyID` INT(8)      NOT NULL,
    `email`        VARCHAR(45) NOT NULL,
    `password`     VARCHAR(45) NOT NULL,
    PRIMARY KEY (`fk_facultyID`),
    CONSTRAINT `fk_professor_facultyID_2`
        FOREIGN KEY (`fk_facultyID`)
            REFERENCES `cpsc351`.`professor` (`facultyID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    UNIQUE INDEX `fk_facultyID_UNIQUE` (`fk_facultyID` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`studentPin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`studentPin`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`studentPin`
(
    `pin_number`         INT         NOT NULL,
    `advising_semester`  VARCHAR(45) NOT NULL,
    `Student_student_ID` INT(8)      NOT NULL,
    `semester_term`      VARCHAR(45) NOT NULL,
    PRIMARY KEY (`pin_number`, `Student_student_ID`, `semester_term`),
    INDEX `fk_studentPin_Student_idx` (`Student_student_ID` ASC) VISIBLE,
    INDEX `fk_studentPin_registrar1_idx` (`semester_term` ASC) VISIBLE,
    UNIQUE INDEX `pin_number_UNIQUE` (`pin_number` ASC) VISIBLE,
    UNIQUE INDEX `Student_student_ID_UNIQUE` (`Student_student_ID` ASC) VISIBLE,
    CONSTRAINT `fk_studentPin_Student`
        FOREIGN KEY (`Student_student_ID`)
            REFERENCES `cpsc351`.`Student` (`student_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`professor`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`professor`
(
    `facultyID`        INT(8)       NOT NULL,
    `advisorStatus`    VARCHAR(45)  NULL,
    `first_name`       VARCHAR(45)  NOT NULL,
    `last_name`        VARCHAR(45)  NOT NULL,
    `email`            VARCHAR(45)  NOT NULL,
    `phoneNumber`      VARCHAR(45)  NULL,
    `office`           VARCHAR(45)  NULL,
    `biography`        VARCHAR(500) NULL,
    `courses_teaching` VARCHAR(500) NULL,
    `professor_img`    blob         NULL,
    PRIMARY KEY (`facultyID`),
    UNIQUE INDEX `facultyID_UNIQUE` (`facultyID` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    UNIQUE INDEX `phoneNumber_UNIQUE` (`phoneNumber` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`advisingMeeting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`advisingMeeting`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`advisingMeeting`
(
    `meetDateTIme`        DATETIME    NOT NULL,
    `meetLocation`        VARCHAR(45) NULL,
    `meetSubject`         VARCHAR(45) NULL,
    `Student_student_ID`  INT(8)      NOT NULL,
    `professor_facultyID` INT(8)      NOT NULL,
    PRIMARY KEY (`Student_student_ID`, `professor_facultyID`, `meetDateTIme`),
    INDEX `fk_advisingMeeting_Student1_idx` (`Student_student_ID` ASC) VISIBLE,
    INDEX `fk_advisingMeeting_professor1_idx` (`professor_facultyID` ASC) VISIBLE,
    CONSTRAINT `fk_advisingMeeting_Student1`
        FOREIGN KEY (`Student_student_ID`)
            REFERENCES `cpsc351`.`Student` (`student_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_advisingMeeting_professor1`
        FOREIGN KEY (`professor_facultyID`)
            REFERENCES `cpsc351`.`professor` (`facultyID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`advisingNotes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`advisingNotes`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`advisingNotes`
(
    `dateAndTime`                         DATETIME     NOT NULL,
    `meetNotes`                           VARCHAR(600) NULL,
    `advisingMeeting_Student_student_ID`  INT(8)       NOT NULL,
    `advisingMeeting_professor_facultyID` INT(8)       NOT NULL,
    PRIMARY KEY (`dateAndTime`, `advisingMeeting_Student_student_ID`, `advisingMeeting_professor_facultyID`),
    INDEX `fk_advisingNotes_advisingMeeting1_idx` (`advisingMeeting_Student_student_ID` ASC,
                                                   `advisingMeeting_professor_facultyID` ASC) VISIBLE,
    CONSTRAINT `fk_advisingNotes_advisingMeeting1`
        FOREIGN KEY (`advisingMeeting_Student_student_ID`, `advisingMeeting_professor_facultyID`)
            REFERENCES `cpsc351`.`advisingMeeting` (`Student_student_ID`, `professor_facultyID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`departmentHead`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`departmentHead`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`departmentHead`
(
    `facultyID`              INT(8)      NOT NULL,
    `courseOverrideApproval` VARCHAR(45) NULL,
    PRIMARY KEY (`facultyID`),
    UNIQUE INDEX `facultyID_UNIQUE` (`facultyID` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`courseOverride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`courseOverride`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`courseOverride`
(
    `overrideID`               INT          NOT NULL,
    `CRN`                      INT(4)       NULL,
    `courseNumber`             VARCHAR(45)  NULL,
    `courseSubject`            VARCHAR(45)  NULL,
    `requestReason`            VARCHAR(200) NULL,
    `overrideRequested`        VARCHAR(45)  NULL,
    `departmentHead_facultyID` INT(8)       NOT NULL,
    PRIMARY KEY (`overrideID`, `departmentHead_facultyID`),
    INDEX `fk_courseOverride_departmentHead1_idx` (`departmentHead_facultyID` ASC) VISIBLE,
    UNIQUE INDEX `overrideID_UNIQUE` (`overrideID` ASC) VISIBLE,
    CONSTRAINT `fk_courseOverride_departmentHead1`
        FOREIGN KEY (`departmentHead_facultyID`)
            REFERENCES `cpsc351`.`departmentHead` (`facultyID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`courseOverrideEvent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`courseOverrideEvent`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`courseOverrideEvent`
(
    `Student_student_ID`        INT(8)   NOT NULL,
    `courseOverride_overrideID` INT      NOT NULL,
    `dateAndTime`               DATETIME NULL,
    PRIMARY KEY (`Student_student_ID`, `courseOverride_overrideID`),
    INDEX `fk_Student_has_courseOverride_courseOverride1_idx` (`courseOverride_overrideID` ASC) VISIBLE,
    INDEX `fk_Student_has_courseOverride_Student1_idx` (`Student_student_ID` ASC) VISIBLE,
    UNIQUE INDEX `Student_student_ID_UNIQUE` (`Student_student_ID` ASC) VISIBLE,
    UNIQUE INDEX `courseOverride_overrideID_UNIQUE` (`courseOverride_overrideID` ASC) VISIBLE,
    CONSTRAINT `fk_Student_has_courseOverride_Student1`
        FOREIGN KEY (`Student_student_ID`)
            REFERENCES `cpsc351`.`Student` (`student_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_Student_has_courseOverride_courseOverride1`
        FOREIGN KEY (`courseOverride_overrideID`)
            REFERENCES `cpsc351`.`courseOverride` (`overrideID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`studentSchedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`studentSchedule`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`studentSchedule`
(
    `CRN`                INT(4)       NOT NULL,
    `courseNumber`       INT(4)       NULL,
    `courseSubject`      VARCHAR(45)  NULL,
    `courseTitle`        VARCHAR(45)  NULL,
    `professor`          VARCHAR(45)  NULL,
    `day`                VARCHAR(45)  NULL,
    `time`               VARCHAR(45)  NULL,
    `location`           VARCHAR(45)  NULL,
    `credits`            INT(2)       NULL,
    `grade`              VARCHAR(2)   NULL,
    `year`               INT(8)       NOT NULL,
    `term`               VARCHAR(255) NOT NULL,
    `Student_student_ID` INT(8)       NOT NULL,

    PRIMARY KEY (`year`, `term`, `CRN`, `Student_student_ID`),
    INDEX `fk_courseSchedule_Student1_idx` (`Student_student_ID` ASC) VISIBLE,
    CONSTRAINT `fk_courseSchedule_Student1`
        FOREIGN KEY (`Student_student_ID`)
            REFERENCES `cpsc351`.`Student` (`student_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_courseSchedule_CRN`
        FOREIGN KEY (`CRN`)
            REFERENCES `cpsc351`.`coursesAvailable` (`CRN`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`coursesAvailable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`coursesAvailable`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`coursesAvailable`
(
    `CRN`                 INT(4)       NOT NULL,
    `course`              VARCHAR(255) NULL,
    `section`             VARCHAR(45)  NULL,
    `courseTitle`         VARCHAR(45)  NULL,
    `credits`             VARCHAR(45)  NULL,
    `areaofLLC`           VARCHAR(45)  NULL,
    `type`                VARCHAR(45)  NULL,
    `days`                VARCHAR(45)  NULL,
    `time`                VARCHAR(45)  NULL,
    `location`            VARCHAR(45)  NULL,
    `instructor`          VARCHAR(45)  NULL,
    `seatsstillavailable` VARCHAR(45)  NULL,
    `status`              VARCHAR(45)  NULL,
    PRIMARY KEY (`CRN`),
    UNIQUE INDEX `CRN_UNIQUE` (`CRN` ASC) VISIBLE
#     UNIQUE INDEX `courseSchedule_CRN_UNIQUE` (`courseSchedule_CRN` ASC) VISIBLE,
#     UNIQUE INDEX `courseSchedule_Student_student_ID_UNIQUE` (`courseSchedule_Student_student_ID` ASC) VISIBLE,
#     CONSTRAINT `fk_courseDetails_courseSchedule1`
#         FOREIGN KEY (`year`, `term`,`courseSchedule_Student_student_ID`)
#             REFERENCES `cpsc351`.`studentSchedule` (`year`, `term`,`Student_student_ID`)
#             ON DELETE NO ACTION
#             ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`degreeRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`degreeRequirements`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`degreeRequirements`
(
    `CouseNumber`   INT(4)      NOT NULL,
    `CourseSubject` VARCHAR(45) NOT NULL,
    `courseTitle`   VARCHAR(45) NULL,
    `credits`       INT(2)      NULL,
    `year`                                               INT(8)      NOT NULL,

    PRIMARY KEY (`CouseNumber`, `CourseSubject`,`year`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`coursesAvailable_has_degreeRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`coursesAvailable_has_degreeRequirements`;

CREATE TABLE IF NOT EXISTS `cpsc351`.`coursesAvailable_has_degreeRequirements`
(
    `coursesAvailable_CRN`                               INT(4)      NOT NULL,
    `coursesAvailable_courseSchedule_CRN`                INT(4)      NOT NULL,
    `coursesAvailable_courseSchedule_Student_student_ID` INT(8)      NOT NULL,
    `degreeRequirements_CouseNumber`                     INT(4)      NOT NULL,
    `degreeRequirements_CourseSubject`                   VARCHAR(45) NOT NULL,
    `semesterTerm`                                       VARCHAR(10) NOT NULL,
    `year`                                               INT(8)      NOT NULL,
    PRIMARY KEY (`coursesAvailable_CRN`, `coursesAvailable_courseSchedule_CRN`,
                 `coursesAvailable_courseSchedule_Student_student_ID`, `degreeRequirements_CouseNumber`,
                 `degreeRequirements_CourseSubject`),
    INDEX `fk_coursesAvailable_has_degreeRequirements_degreeRequirement_idx` (`degreeRequirements_CouseNumber` ASC,
                                                                              `degreeRequirements_CourseSubject`
                                                                              ASC) VISIBLE,
    INDEX `fk_coursesAvailable_has_degreeRequirements_coursesAvailable_idx` (`coursesAvailable_CRN` ASC,
                                                                             `coursesAvailable_courseSchedule_CRN` ASC,
                                                                             `coursesAvailable_courseSchedule_Student_student_ID`
                                                                             ASC) VISIBLE,
    CONSTRAINT `fk_coursesAvailable_has_degreeRequirements_coursesAvailable1`
        FOREIGN KEY (`coursesAvailable_CRN`)
            REFERENCES `cpsc351`.`coursesAvailable` (`CRN`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_coursesAvailable_has_degreeRequirements_degreeRequirements1`
        FOREIGN KEY (`degreeRequirements_CouseNumber`, `degreeRequirements_CourseSubject`)
            REFERENCES `cpsc351`.`degreeRequirements` (`CouseNumber`, `CourseSubject`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;


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
values (101010, 'Yes', 'DBA', 'Admin', 'dbaadmin@cnu.edu', '(111) 111-1111', 'Admin', 'Admin', 'Admin', '');studentSchedule
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



select *
from advisingMeeting
where professor_facultyID = '$user'
  and meetDateTIme < CURRENT_TIMESTAMP()
order by meetDateTime DESC;
SELECT advisingMeeting.*, Student.first_name, Student.last_name
FROM advisingMeeting
         INNER JOIN Student ON advisingMeeting.Student_student_ID = Student.student_ID
WHERE advisingMeeting.professor_facultyID = '$user'
  and advisingMeeting.meetDateTIme < CURRENT_TIMESTAMP()
order by advisingMeeting.meetDateTime DESC;


Select distinct advisingNotes.*, Student.first_name, Student.last_name
from advisingNotes
         inner join Student on advisingNotes.advisingMeeting_Student_student_ID
where advisingMeeting_professor_facultyID = '123456';

select *
from advisingNotes;



ALTER TABLE advisingNotes
    DROP FOREIGN KEY advisingMeeting_professor_facultyID_UNIQUE;


select *
from advisingNotes
where advisingMeeting_Student_student_ID = '';

select distinct areaofLLC
from coursesAvailable;

select distinct LEFT(course, 4) as course
from coursesAvailable;

Select *
from coursesAvailable
where areaofLLC = 'AINW'
order by course asc;

Select *
from studentSchedule
where Student_student_ID = '975829'
  and day like 'T%'
order by time ASC;


ALTER TABLE studentPin
    ADD professor_facultyID INT(8) NULL,
    ADD FOREIGN KEY (professor_facultyID) REFERENCES professor (facultyID);

alter table studentSchedule
add foreign key (CRN) references coursesAvailable(CRN);