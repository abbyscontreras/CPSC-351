
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cpsc351
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cpsc351` ;

-- -----------------------------------------------------
-- Schema cpsc351
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cpsc351` DEFAULT CHARACTER SET utf8 ;
USE `cpsc351` ;

-- -----------------------------------------------------
-- Table `cpsc351`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`Student` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`Student` (
    `student_ID` INT(8) NOT NULL,
    `first_name` VARCHAR(45) NOT NULL,
    `last_name` VARCHAR(45) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `entry_year` VARCHAR(45) NOT NULL,
    `expected_graduation` VARCHAR(45) NOT NULL,
    `department` VARCHAR(100) NULL,
    `major` VARCHAR(45) NULL,
    `minor` VARCHAR(45) NULL,
    PRIMARY KEY (`student_ID`),
    UNIQUE INDEX `student_ID_UNIQUE` (`student_ID` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`registrar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`registrar` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`registrar` (
    `fk_facultyID` INT(8) NOT NULL,
    `semester_term` VARCHAR(45) NOT NULL,
    `semester_year` INT(4) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`semester_term`, `semester_year`),
    CONSTRAINT `fk_professor_facultyID`
    FOREIGN KEY (`fk_facultyID`)
        REFERENCES `cpsc351`.`professor` (`facultyID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`studentPin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`studentPin` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`studentPin` (
                                                   `pin_number` INT NOT NULL,
                                                   `advising_semester` VARCHAR(45) NOT NULL,
    `Student_student_ID` INT(8) NOT NULL,
    `registrar_semester_term` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`pin_number`, `Student_student_ID`, `registrar_semester_term`),
    INDEX `fk_studentPin_Student_idx` (`Student_student_ID` ASC) VISIBLE,
    INDEX `fk_studentPin_registrar1_idx` (`registrar_semester_term` ASC) VISIBLE,
    UNIQUE INDEX `pin_number_UNIQUE` (`pin_number` ASC) VISIBLE,
    UNIQUE INDEX `Student_student_ID_UNIQUE` (`Student_student_ID` ASC) VISIBLE,
    CONSTRAINT `fk_studentPin_Student`
    FOREIGN KEY (`Student_student_ID`)
    REFERENCES `cpsc351`.`Student` (`student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_studentPin_registrar1`
    FOREIGN KEY (`registrar_semester_term`)
    REFERENCES `cpsc351`.`registrar` (`semester_term`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`professor` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`professor` (
    `facultyID` INT(8) NOT NULL,
    `advisorStatus` VARCHAR(45) NOT NULL,
    `first_name` VARCHAR(45) NOT NULL,
    `last_name` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `phoneNumber` VARCHAR(45) NOT NULL,
    `office` VARCHAR(45) NOT NULL,
    `biography` VARCHAR(500) NOT NULL,
    `courses_teaching` VARCHAR(500) NOT NULL,
    PRIMARY KEY (`facultyID`),
    UNIQUE INDEX `facultyID_UNIQUE` (`facultyID` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    UNIQUE INDEX `phoneNumber_UNIQUE` (`phoneNumber` ASC) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`advisingMeeting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`advisingMeeting` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`advisingMeeting` (
                                                        `meetDateTIme` DATETIME NOT NULL,
                                                        `meetLocation` VARCHAR(45) NOT NULL,
    `meetSubject` VARCHAR(45) NULL,
    `Student_student_ID` INT(8) NOT NULL,
    `professor_facultyID` INT(8) NOT NULL,
    PRIMARY KEY (`Student_student_ID`, `professor_facultyID`, `meetDateTIme`),
    INDEX `fk_advisingMeeting_Student1_idx` (`Student_student_ID` ASC) VISIBLE,
    INDEX `fk_advisingMeeting_professor1_idx` (`professor_facultyID` ASC) VISIBLE,
    UNIQUE INDEX `Student_student_ID_UNIQUE` (`Student_student_ID` ASC) VISIBLE,
    UNIQUE INDEX `professor_facultyID_UNIQUE` (`professor_facultyID` ASC) VISIBLE,
    UNIQUE INDEX `meetDateAndTIme_UNIQUE` (`meetDateTIme` ASC) VISIBLE,
    CONSTRAINT `fk_advisingMeeting_Student1`
    FOREIGN KEY (`Student_student_ID`)
    REFERENCES `cpsc351`.`Student` (`student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_advisingMeeting_professor1`
    FOREIGN KEY (`professor_facultyID`)
    REFERENCES `cpsc351`.`professor` (`facultyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`advisingNotes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`advisingNotes` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`advisingNotes` (
                                                      `dateAndTime` DATETIME NOT NULL,
                                                      `meetNotes` VARCHAR(600) NULL,
    `advisingMeeting_Student_student_ID` INT(8) NOT NULL,
    `advisingMeeting_professor_facultyID` INT(8) NOT NULL,
    PRIMARY KEY (`dateAndTime`, `advisingMeeting_Student_student_ID`, `advisingMeeting_professor_facultyID`),
    INDEX `fk_advisingNotes_advisingMeeting1_idx` (`advisingMeeting_Student_student_ID` ASC, `advisingMeeting_professor_facultyID` ASC) VISIBLE,
    UNIQUE INDEX `advisingMeeting_Student_student_ID_UNIQUE` (`advisingMeeting_Student_student_ID` ASC) VISIBLE,
    UNIQUE INDEX `advisingMeeting_professor_facultyID_UNIQUE` (`advisingMeeting_professor_facultyID` ASC) VISIBLE,
    CONSTRAINT `fk_advisingNotes_advisingMeeting1`
    FOREIGN KEY (`advisingMeeting_Student_student_ID` , `advisingMeeting_professor_facultyID`)
    REFERENCES `cpsc351`.`advisingMeeting` (`Student_student_ID` , `professor_facultyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`departmentHead`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`departmentHead` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`departmentHead` (
    `facultyID` INT(8) NOT NULL,
    `courseOverrideApproval` VARCHAR(45) NULL,
    PRIMARY KEY (`facultyID`),
    UNIQUE INDEX `facultyID_UNIQUE` (`facultyID` ASC) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`courseOverride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`courseOverride` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`courseOverride` (
                                                       `overrideID` INT NOT NULL,
                                                       `CRN` INT(4) NOT NULL,
    `courseNumber` VARCHAR(45) NOT NULL,
    `courseSubject` VARCHAR(45) NOT NULL,
    `requestReason` VARCHAR(200) NOT NULL,
    `overrideRequested` VARCHAR(45) NOT NULL,
    `departmentHead_facultyID` INT(8) NOT NULL,
    PRIMARY KEY (`overrideID`, `departmentHead_facultyID`),
    INDEX `fk_courseOverride_departmentHead1_idx` (`departmentHead_facultyID` ASC) VISIBLE,
    UNIQUE INDEX `overrideID_UNIQUE` (`overrideID` ASC) VISIBLE,
    UNIQUE INDEX `departmentHead_facultyID_UNIQUE` (`departmentHead_facultyID` ASC) VISIBLE,
    CONSTRAINT `fk_courseOverride_departmentHead1`
    FOREIGN KEY (`departmentHead_facultyID`)
    REFERENCES `cpsc351`.`departmentHead` (`facultyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`courseOverrideEvent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`courseOverrideEvent` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`courseOverrideEvent` (
    `Student_student_ID` INT(8) NOT NULL,
    `courseOverride_overrideID` INT NOT NULL,
    `dateAndTime` DATETIME NULL,
    PRIMARY KEY (`Student_student_ID`, `courseOverride_overrideID`),
    INDEX `fk_Student_has_courseOverride_courseOverride1_idx` (`courseOverride_overrideID` ASC) VISIBLE,
    INDEX `fk_Student_has_courseOverride_Student1_idx` (`Student_student_ID` ASC) VISIBLE,
    UNIQUE INDEX `Student_student_ID_UNIQUE` (`Student_student_ID` ASC) VISIBLE,
    UNIQUE INDEX `courseOverride_overrideID_UNIQUE` (`courseOverride_overrideID` ASC) VISIBLE,
    UNIQUE INDEX `dateAndTime_UNIQUE` (`dateAndTime` ASC) VISIBLE,
    CONSTRAINT `fk_Student_has_courseOverride_Student1`
    FOREIGN KEY (`Student_student_ID`)
    REFERENCES `cpsc351`.`Student` (`student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_Student_has_courseOverride_courseOverride1`
    FOREIGN KEY (`courseOverride_overrideID`)
    REFERENCES `cpsc351`.`courseOverride` (`overrideID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`studentSchedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`studentSchedule` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`studentSchedule` (
    `CRN` INT(4) NOT NULL,
    `courseNumber` INT(4) NOT NULL,
    `courseSubject` VARCHAR(45) NOT NULL,
    `courseTitle` VARCHAR(45) NOT NULL,
    `professor` VARCHAR(45) NULL,
    `dateAndTime` VARCHAR(45) NULL,
    `location` VARCHAR(45) NULL,
    `credits` INT(2) NOT NULL,
    `grade` VARCHAR(2) NULL,
    `Student_student_ID` INT(8) NOT NULL,
    PRIMARY KEY (`CRN`, `Student_student_ID`),
    INDEX `fk_courseSchedule_Student1_idx` (`Student_student_ID` ASC) VISIBLE,
    UNIQUE INDEX `CRN_UNIQUE` (`CRN` ASC) VISIBLE,
    UNIQUE INDEX `Student_student_ID_UNIQUE` (`Student_student_ID` ASC) VISIBLE,
    CONSTRAINT `fk_courseSchedule_Student1`
    FOREIGN KEY (`Student_student_ID`)
    REFERENCES `cpsc351`.`Student` (`student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`coursesAvailable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`coursesAvailable` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`coursesAvailable` (
    `CRN` INT(4) NOT NULL,
    `courseNumber` INT(4) NOT NULL,
    `courseSubject` VARCHAR(45) NOT NULL,
    `courseTitle` VARCHAR(45) NOT NULL,
    `professor` VARCHAR(45) NULL,
    `dateAndTime` VARCHAR(45) NOT NULL,
    `location` VARCHAR(45) NULL,
    `prerequisites` VARCHAR(45) NOT NULL,
    `corequisites` VARCHAR(45) NOT NULL,
    `courseSchedule_CRN` INT(4) NOT NULL,
    `courseSchedule_Student_student_ID` INT(8) NOT NULL,
    PRIMARY KEY (`CRN`, `courseSchedule_CRN`, `courseSchedule_Student_student_ID`),
    INDEX `fk_courseDetails_courseSchedule1_idx` (`courseSchedule_CRN` ASC, `courseSchedule_Student_student_ID` ASC) VISIBLE,
    UNIQUE INDEX `CRN_UNIQUE` (`CRN` ASC) VISIBLE,
    UNIQUE INDEX `courseSchedule_CRN_UNIQUE` (`courseSchedule_CRN` ASC) VISIBLE,
    UNIQUE INDEX `courseSchedule_Student_student_ID_UNIQUE` (`courseSchedule_Student_student_ID` ASC) VISIBLE,
    CONSTRAINT `fk_courseDetails_courseSchedule1`
    FOREIGN KEY (`courseSchedule_CRN` , `courseSchedule_Student_student_ID`)
    REFERENCES `cpsc351`.`studentSchedule` (`CRN` , `Student_student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`degreeRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`degreeRequirements` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`degreeRequirements` (
    `CouseNumber` INT(4) NOT NULL,
    `CourseSubject` VARCHAR(45) NOT NULL,
    `courseTitle` VARCHAR(45) NOT NULL,
    `credits` INT(2) NOT NULL,
    PRIMARY KEY (`CouseNumber`, `CourseSubject`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cpsc351`.`coursesAvailable_has_degreeRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cpsc351`.`coursesAvailable_has_degreeRequirements` ;

CREATE TABLE IF NOT EXISTS `cpsc351`.`coursesAvailable_has_degreeRequirements` (
    `coursesAvailable_CRN` INT(4) NOT NULL,
    `coursesAvailable_courseSchedule_CRN` INT(4) NOT NULL,
    `coursesAvailable_courseSchedule_Student_student_ID` INT(8) NOT NULL,
    `degreeRequirements_CouseNumber` INT(4) NOT NULL,
    `degreeRequirements_CourseSubject` VARCHAR(45) NOT NULL,
    `semesterTerm` VARCHAR(10) NOT NULL,
    `year` VARCHAR(4) NOT NULL,
    PRIMARY KEY (`coursesAvailable_CRN`, `coursesAvailable_courseSchedule_CRN`, `coursesAvailable_courseSchedule_Student_student_ID`, `degreeRequirements_CouseNumber`, `degreeRequirements_CourseSubject`),
    INDEX `fk_coursesAvailable_has_degreeRequirements_degreeRequirement_idx` (`degreeRequirements_CouseNumber` ASC, `degreeRequirements_CourseSubject` ASC) VISIBLE,
    INDEX `fk_coursesAvailable_has_degreeRequirements_coursesAvailable_idx` (`coursesAvailable_CRN` ASC, `coursesAvailable_courseSchedule_CRN` ASC, `coursesAvailable_courseSchedule_Student_student_ID` ASC) VISIBLE,
    CONSTRAINT `fk_coursesAvailable_has_degreeRequirements_coursesAvailable1`
    FOREIGN KEY (`coursesAvailable_CRN` , `coursesAvailable_courseSchedule_CRN` , `coursesAvailable_courseSchedule_Student_student_ID`)
    REFERENCES `cpsc351`.`coursesAvailable` (`CRN` , `courseSchedule_CRN` , `courseSchedule_Student_student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_coursesAvailable_has_degreeRequirements_degreeRequirements1`
    FOREIGN KEY (`degreeRequirements_CouseNumber` , `degreeRequirements_CourseSubject`)
    REFERENCES `cpsc351`.`degreeRequirements` (`CouseNumber` , `CourseSubject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Insert Statements
-- -----------------------------------------------------
insert into professor values (00123456, 'Yes','Michael','Lapke','michael.lapke@cnu.edu','(757) 594-8921','Luter Hall 331', 'Michael Lapke has served as a business professor at University of Mary Washington for over 15 years before joining the CNU family.','CPSC 350 and CPSC 351');
insert into registrar values (00123456, 'Spring', 2021,'michael.lapke@cnu.edu', 'lapkepass');

insert into professor values (101010, 'Yes','DBA','Admin','dbaadmin@cnu.edu','(111) 111-1111','Admin', 'Admin','Admin');
insert into registrar values (101010, 'Spring', 2022,'dbaadmin@cnu.edu', 'admin');
