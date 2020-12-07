-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema saom
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema saom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `saom` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema saom
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema saom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `saom` DEFAULT CHARACTER SET utf8mb4 ;
USE `saom` ;

-- -----------------------------------------------------
-- Table `saom`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Books` (
  `booksID` INT NOT NULL,
  `bookName` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `yearPublished` YEAR NULL,
  `price` INT NULL,
  `category` VARCHAR(45) NULL,
  `ISBN` VARCHAR(45) NULL,
  `inStock` TINYINT NULL,
  `qty` INT NULL,
  `image` VARCHAR(45) NULL,
  PRIMARY KEY (`booksID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Student` (
  `memberID` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `phone` INT NULL,
  `dateEnrollment` DATE NULL,
  `fName` VARCHAR(45) NULL,
  `lName` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `image` VARCHAR(45) NULL,
  PRIMARY KEY (`memberID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Staffs` (
  `staffID` INT NOT NULL,
  `fName` VARCHAR(45) NULL,
  `lName` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `staffCourse` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `address` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `image` VARCHAR(45) NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Courses` (
  `coursesID` INT NOT NULL,
  `courseName` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `level` VARCHAR(45) NULL,
  `numberOfYears` INT NULL,
  `GroupCategory` VARCHAR(45) NULL,
  `image` VARCHAR(45) NULL,
  `studentID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`coursesID`),
  INDEX `fk_Courses_Student_idx` (`studentID` ASC)    ,
  INDEX `fk_Courses_Staffs1_idx` (`staffID` ASC)    ,
  CONSTRAINT `fk_Courses_Student`
    FOREIGN KEY (`studentID`)
    REFERENCES `saom`.`Student` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_Staffs1`
    FOREIGN KEY (`staffID`)
    REFERENCES `saom`.`Staffs` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Exam Center`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Exam Center` (
  `examCenterID` INT NOT NULL,
  `Location` VARCHAR(45) NULL,
  PRIMARY KEY (`examCenterID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Exams` (
  `examID` INT NOT NULL,
  `examName` VARCHAR(45) NULL,
  `dateOfExam` DATE NULL,
  `price` DECIMAL(6,2) NULL,
  `image` VARCHAR(45) NULL,
  `examCategory` VARCHAR(45) NULL,
  `examTime` TIME NULL,
  `coursesID` INT NOT NULL,
  `examCenterID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`examID`),
  INDEX `fk_Exams_Courses1_idx` (`coursesID` ASC)    ,
  INDEX `fk_Exams_Exam Center1_idx` (`examCenterID` ASC)    ,
  CONSTRAINT `fk_Exams_Courses1`
    FOREIGN KEY (`coursesID`)
    REFERENCES `saom`.`Courses` (`coursesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exams_Exam Center1`
    FOREIGN KEY (`examCenterID`)
    REFERENCES `saom`.`Exam Center` (`examCenterID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Book Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Book Orders` (
  `bookOrdersID` INT NOT NULL,
  `expectedDate` DATE NULL,
  `expectedTime` TIME NULL,
  `dateOrderded` DATE NULL,
  `timeOrdered` TIME NULL,
  `qty` INT NULL,
  `booksID` INT NOT NULL,
  PRIMARY KEY (`bookOrdersID`),
  INDEX `fk_Book Orders_Books1_idx` (`booksID` ASC)    ,
  CONSTRAINT `fk_Book Orders_Books1`
    FOREIGN KEY (`booksID`)
    REFERENCES `saom`.`Books` (`booksID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Book Exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Book Exams` (
  `bookExamID` INT NOT NULL,
  `examID` INT NOT NULL,
  PRIMARY KEY (`bookExamID`),
  INDEX `fk_Book Exams_Exams1_idx` (`examID` ASC)    ,
  CONSTRAINT `fk_Book Exams_Exams1`
    FOREIGN KEY (`examID`)
    REFERENCES `saom`.`Exams` (`examID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Events` (
  `eventID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `dateOfEvent` DATE NULL,
  `price` DECIMAL(6,2) NULL,
  `location` VARCHAR(45) NULL,
  `image` VARCHAR(45) NULL,
  PRIMARY KEY (`eventID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Book Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Book Events` (
  `bookEventID` INT NOT NULL,
  `fullPrice` DECIMAL NULL,
  `qty` INT NULL,
  `eventID` INT NOT NULL,
  PRIMARY KEY (`bookEventID`),
  INDEX `fk_Book Events_Events1_idx` (`eventID` ASC)    ,
  CONSTRAINT `fk_Book Events_Events1`
    FOREIGN KEY (`eventID`)
    REFERENCES `saom`.`Events` (`eventID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Book Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Book Course` (
  `bookCourseID` INT NOT NULL,
  `coursesID` INT NOT NULL,
  PRIMARY KEY (`bookCourseID`),
  INDEX `fk_Book Course_Courses1_idx` (`coursesID` ASC)    ,
  CONSTRAINT `fk_Book Course_Courses1`
    FOREIGN KEY (`coursesID`)
    REFERENCES `saom`.`Courses` (`coursesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Lessons` (
  `lessonID` INT NOT NULL,
  `LessonName` VARCHAR(45) NULL,
  `Location` VARCHAR(45) NULL,
  `time` TIME NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`lessonID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Book Lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Book Lessons` (
  `bookLessonsID` INT NOT NULL,
  `BookTime` TIME NULL,
  `lessonID` INT NOT NULL,
  PRIMARY KEY (`bookLessonsID`),
  INDEX `fk_Book Lessons_Lessons1_idx` (`lessonID` ASC)    ,
  CONSTRAINT `fk_Book Lessons_Lessons1`
    FOREIGN KEY (`lessonID`)
    REFERENCES `saom`.`Lessons` (`lessonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Process Exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Process Exams` (
  `processExamsID` INT NOT NULL,
  `examID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`processExamsID`),
  INDEX `fk_Process Exams_Exams1_idx` (`examID` ASC)    ,
  INDEX `fk_Process Exams_Staffs1_idx` (`staffID` ASC)    ,
  CONSTRAINT `fk_Process Exams_Exams1`
    FOREIGN KEY (`examID`)
    REFERENCES `saom`.`Exams` (`examID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Process Exams_Staffs1`
    FOREIGN KEY (`staffID`)
    REFERENCES `saom`.`Staffs` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Private Tuition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Private Tuition` (
  `privateTuitionID` INT NOT NULL,
  `Room` VARCHAR(45) NULL,
  `studentID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`privateTuitionID`),
  INDEX `fk_Private Tuition_Student1_idx` (`studentID` ASC)    ,
  INDEX `fk_Private Tuition_Staffs1_idx` (`staffID` ASC)    ,
  CONSTRAINT `fk_Private Tuition_Student1`
    FOREIGN KEY (`studentID`)
    REFERENCES `saom`.`Student` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Private Tuition_Staffs1`
    FOREIGN KEY (`staffID`)
    REFERENCES `saom`.`Staffs` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Process Student Timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Process Student Timetable` (
  `processStudentTimetableID` INT NOT NULL,
  `days` VARCHAR(45) NULL,
  `dates` DATE NULL,
  `timeSlots` TIME NULL,
  `studentID` INT NOT NULL,
  PRIMARY KEY (`processStudentTimetableID`),
  INDEX `fk_Process Student Timetable_Student1_idx` (`studentID` ASC)    ,
  CONSTRAINT `fk_Process Student Timetable_Student1`
    FOREIGN KEY (`studentID`)
    REFERENCES `saom`.`Student` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Process Teacher Timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Process Teacher Timetable` (
  `processTeacherTimetableID` INT NOT NULL,
  `days` VARCHAR(45) NULL,
  `dates` DATE NULL,
  `timeSlots` TIME NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`processTeacherTimetableID`),
  INDEX `fk_Process Teacher Timetable_Staffs1_idx` (`staffID` ASC)    ,
  CONSTRAINT `fk_Process Teacher Timetable_Staffs1`
    FOREIGN KEY (`staffID`)
    REFERENCES `saom`.`Staffs` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`View Student Timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`View Student Timetable` (
  `viewStudentTimetableID` INT NOT NULL,
  `timetableLayout` VARCHAR(45) NULL,
  `weeksToView` VARCHAR(45) NULL,
  `studentID` INT NOT NULL,
  PRIMARY KEY (`viewStudentTimetableID`),
  INDEX `fk_View Student Timetable_Student1_idx` (`studentID` ASC)    ,
  CONSTRAINT `fk_View Student Timetable_Student1`
    FOREIGN KEY (`studentID`)
    REFERENCES `saom`.`Student` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`View Teacher Timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`View Teacher Timetable` (
  `viewTeacherTimetableID` INT NOT NULL,
  `timetableLayout` VARCHAR(45) NULL,
  `weeksToView` VARCHAR(45) NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`viewTeacherTimetableID`),
  INDEX `fk_View Teacher Timetable_Staffs1_idx` (`staffID` ASC)    ,
  CONSTRAINT `fk_View Teacher Timetable_Staffs1`
    FOREIGN KEY (`staffID`)
    REFERENCES `saom`.`Staffs` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Generate Reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Generate Reports` (
  `generateReportsID` INT NOT NULL,
  `types` VARCHAR(45) NULL,
  `month` DATE NULL,
  `year` YEAR NULL,
  PRIMARY KEY (`generateReportsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Generate Result Sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Generate Result Sheet` (
  `generateResultSheetID` INT NOT NULL,
  `Result` VARCHAR(45) NULL,
  `studentID` INT NOT NULL,
  `examID` INT NOT NULL,
  PRIMARY KEY (`generateResultSheetID`),
  INDEX `fk_Generate Result Sheet_Student1_idx` (`studentID` ASC)    ,
  INDEX `fk_Generate Result Sheet_Exams1_idx` (`examID` ASC)    ,
  CONSTRAINT `fk_Generate Result Sheet_Student1`
    FOREIGN KEY (`studentID`)
    REFERENCES `saom`.`Student` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Generate Result Sheet_Exams1`
    FOREIGN KEY (`examID`)
    REFERENCES `saom`.`Exams` (`examID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Member` (
  `memberID` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `phone` INT NULL,
  `fName` VARCHAR(45) NULL,
  `lName` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`memberID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Shopping cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Shopping cart` (
  `shoppingCartID` INT NOT NULL,
  `session_id` INT NULL,
  `fullPrice` DECIMAL NULL,
  `dateAdded` DATE NULL,
  `imagePath` VARCHAR(45) NULL,
  `bookEventID` INT NOT NULL,
  `bookOrderID` INT NOT NULL,
  `bookCourseID` INT NOT NULL,
  `bookLessonID` INT NOT NULL,
  `bookExamsID` INT NOT NULL,
  `staffID` INT NOT NULL,
  `memberID` INT NOT NULL,
  `studentID` INT NOT NULL,
  PRIMARY KEY (`shoppingCartID`),
  INDEX `fk_Shopping cart_Book Events1_idx` (`bookEventID` ASC)    ,
  INDEX `fk_Shopping cart_Book Orders1_idx` (`bookOrderID` ASC)    ,
  INDEX `fk_Shopping cart_Book Course1_idx` (`bookCourseID` ASC)    ,
  INDEX `fk_Shopping cart_Book Lessons1_idx` (`bookLessonID` ASC)    ,
  INDEX `fk_Shopping cart_Book Exams1_idx` (`bookExamsID` ASC)    ,
  INDEX `fk_Shopping cart_Staffs1_idx` (`staffID` ASC)    ,
  INDEX `fk_Shopping cart_Member1_idx` (`memberID` ASC)    ,
  INDEX `fk_Shopping cart_Student1_idx` (`studentID` ASC)    ,
  CONSTRAINT `fk_Shopping cart_Book Events1`
    FOREIGN KEY (`bookEventID`)
    REFERENCES `saom`.`Book Events` (`bookEventID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Book Orders1`
    FOREIGN KEY (`bookOrderID`)
    REFERENCES `saom`.`Book Orders` (`bookOrdersID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Book Course1`
    FOREIGN KEY (`bookCourseID`)
    REFERENCES `saom`.`Book Course` (`bookCourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Book Lessons1`
    FOREIGN KEY (`bookLessonID`)
    REFERENCES `saom`.`Book Lessons` (`bookLessonsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Book Exams1`
    FOREIGN KEY (`bookExamsID`)
    REFERENCES `saom`.`Book Exams` (`bookExamID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Staffs1`
    FOREIGN KEY (`staffID`)
    REFERENCES `saom`.`Staffs` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Member1`
    FOREIGN KEY (`memberID`)
    REFERENCES `saom`.`Member` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Student1`
    FOREIGN KEY (`studentID`)
    REFERENCES `saom`.`Student` (`memberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saom`.`Purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`Purchase` (
  `purchaseID` INT NOT NULL,
  `datePurchased` DATE NULL,
  `shoppingCartID` INT NOT NULL,
  PRIMARY KEY (`purchaseID`),
  INDEX `fk_Purchase_Shopping cart1_idx` (`shoppingCartID` ASC)    ,
  CONSTRAINT `fk_Purchase_Shopping cart1`
    FOREIGN KEY (`shoppingCartID`)
    REFERENCES `saom`.`Shopping cart` (`shoppingCartID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `saom` ;

-- -----------------------------------------------------
-- Table `saom`.`book course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`book course` (
  `idBook Course` INT(11) NOT NULL,
  PRIMARY KEY (`idBook Course`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`book events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`book events` (
  `idBook Events` INT(11) NOT NULL,
  `fullPrice` DECIMAL(10,0) NULL DEFAULT NULL,
  `qty` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idBook Events`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`book exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`book exams` (
  `idBook Exams` INT(11) NOT NULL,
  PRIMARY KEY (`idBook Exams`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`book lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`book lessons` (
  `idBook Lessons` INT(11) NOT NULL,
  `Book Time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idBook Lessons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`book orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`book orders` (
  `idBook Orders` INT(11) NOT NULL,
  `expectedDate` DATE NULL DEFAULT NULL,
  `expectedTime` VARCHAR(45) NULL DEFAULT NULL,
  `dateOrderded` DATE NULL DEFAULT NULL,
  `timeOrdered` VARCHAR(45) NULL DEFAULT NULL,
  `qty` INT(11) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idBook Orders`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`books` (
  `idBooks` INT(11) NOT NULL,
  `bookName` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `author` VARCHAR(45) NULL DEFAULT NULL,
  `yearPublished` VARCHAR(45) NULL DEFAULT NULL,
  `price` INT(11) NULL DEFAULT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  `ISBN` VARCHAR(45) NULL DEFAULT NULL,
  `inStock` TINYINT(4) NULL DEFAULT NULL,
  `qty` INT(11) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `Book Orders_idBook Orders` INT(11) NOT NULL,
  PRIMARY KEY (`idBooks`),
  INDEX `fk_Books_Book Orders1_idx` (`Book Orders_idBook Orders` ASC)    ,
  CONSTRAINT `fk_Books_Book Orders1`
    FOREIGN KEY (`Book Orders_idBook Orders`)
    REFERENCES `saom`.`book orders` (`idBook Orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`process student timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`process student timetable` (
  `idProcess Student Timetable` INT(11) NOT NULL,
  `days` VARCHAR(45) NULL DEFAULT NULL,
  `dates` DATE NULL DEFAULT NULL,
  `time slots` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idProcess Student Timetable`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`shopping cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`shopping cart` (
  `idShopping cart` INT(11) NOT NULL,
  `session_id` INT(11) NULL DEFAULT NULL,
  `Fullprice` DECIMAL(10,0) NULL DEFAULT NULL,
  `Date added` DATE NULL DEFAULT NULL,
  `image path` VARCHAR(45) NULL DEFAULT NULL,
  `Book Events_idBook Events` INT(11) NOT NULL,
  `Book Orders_idBook Orders` INT(11) NOT NULL,
  `Book Course_idBook Course` INT(11) NOT NULL,
  `Book Lessons_idBook Lessons` INT(11) NOT NULL,
  `Book Exams_idBook Exams` INT(11) NOT NULL,
  PRIMARY KEY (`idShopping cart`),
  INDEX `fk_Shopping cart_Book Events1_idx` (`Book Events_idBook Events` ASC)    ,
  INDEX `fk_Shopping cart_Book Orders1_idx` (`Book Orders_idBook Orders` ASC)    ,
  INDEX `fk_Shopping cart_Book Course1_idx` (`Book Course_idBook Course` ASC)    ,
  INDEX `fk_Shopping cart_Book Lessons1_idx` (`Book Lessons_idBook Lessons` ASC)    ,
  INDEX `fk_Shopping cart_Book Exams1_idx` (`Book Exams_idBook Exams` ASC)    ,
  CONSTRAINT `fk_Shopping cart_Book Course1`
    FOREIGN KEY (`Book Course_idBook Course`)
    REFERENCES `saom`.`book course` (`idBook Course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Book Events1`
    FOREIGN KEY (`Book Events_idBook Events`)
    REFERENCES `saom`.`book events` (`idBook Events`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Book Exams1`
    FOREIGN KEY (`Book Exams_idBook Exams`)
    REFERENCES `saom`.`book exams` (`idBook Exams`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Book Lessons1`
    FOREIGN KEY (`Book Lessons_idBook Lessons`)
    REFERENCES `saom`.`book lessons` (`idBook Lessons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping cart_Book Orders1`
    FOREIGN KEY (`Book Orders_idBook Orders`)
    REFERENCES `saom`.`book orders` (`idBook Orders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`student` (
  `idMember` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `dateEnrollment` DATE NULL DEFAULT NULL,
  `fName` VARCHAR(45) NULL DEFAULT NULL,
  `lName` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `Shopping cart_idShopping cart` INT(11) NOT NULL,
  `Process Student Timetable_idProcess Student Timetable` INT(11) NOT NULL,
  PRIMARY KEY (`idMember`),
  INDEX `fk_Student_Shopping cart1_idx` (`Shopping cart_idShopping cart` ASC)    ,
  INDEX `fk_Student_Process Student Timetable1_idx` (`Process Student Timetable_idProcess Student Timetable` ASC)    ,
  CONSTRAINT `fk_Student_Process Student Timetable1`
    FOREIGN KEY (`Process Student Timetable_idProcess Student Timetable`)
    REFERENCES `saom`.`process student timetable` (`idProcess Student Timetable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Shopping cart1`
    FOREIGN KEY (`Shopping cart_idShopping cart`)
    REFERENCES `saom`.`shopping cart` (`idShopping cart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`courses` (
  `idCourses` INT(11) NOT NULL,
  `courseName` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `level` VARCHAR(45) NULL DEFAULT NULL,
  `numberOfYears` INT(11) NULL DEFAULT NULL,
  `courseDirector` VARCHAR(45) NULL DEFAULT NULL,
  `GroupCategory` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `Student_idMember` INT(11) NOT NULL,
  `Book Course_idBook Course` INT(11) NOT NULL,
  PRIMARY KEY (`idCourses`),
  INDEX `fk_Courses_Student_idx` (`Student_idMember` ASC)    ,
  INDEX `fk_Courses_Book Course1_idx` (`Book Course_idBook Course` ASC)    ,
  CONSTRAINT `fk_Courses_Book Course1`
    FOREIGN KEY (`Book Course_idBook Course`)
    REFERENCES `saom`.`book course` (`idBook Course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_Student`
    FOREIGN KEY (`Student_idMember`)
    REFERENCES `saom`.`student` (`idMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`events` (
  `idEvents` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `dateOfEvent` DATE NULL DEFAULT NULL,
  `price` DECIMAL(6,2) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `Book Events_idBook Events` INT(11) NOT NULL,
  PRIMARY KEY (`idEvents`),
  INDEX `fk_Events_Book Events1_idx` (`Book Events_idBook Events` ASC)    ,
  CONSTRAINT `fk_Events_Book Events1`
    FOREIGN KEY (`Book Events_idBook Events`)
    REFERENCES `saom`.`book events` (`idBook Events`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`exam center`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`exam center` (
  `idExam Center` INT(11) NOT NULL,
  `Location` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idExam Center`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`exams` (
  `idExams` INT(11) NOT NULL,
  `examName` VARCHAR(45) NULL DEFAULT NULL,
  `dateOfExam` DATE NULL DEFAULT NULL,
  `price` DECIMAL(6,2) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `examCategory` VARCHAR(45) NULL DEFAULT NULL,
  `Book Exams_idBook Exams` INT(11) NOT NULL,
  `staffID` INT(11) NOT NULL,
  PRIMARY KEY (`idExams`),
  INDEX `fk_Exams_Book Exams1_idx` (`Book Exams_idBook Exams` ASC)    ,
  CONSTRAINT `fk_Exams_Book Exams1`
    FOREIGN KEY (`Book Exams_idBook Exams`)
    REFERENCES `saom`.`book exams` (`idBook Exams`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`generate reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`generate reports` (
  `idGenerate Reports` INT(11) NOT NULL,
  `types` VARCHAR(45) NULL DEFAULT NULL,
  `mounth` VARCHAR(45) NULL DEFAULT NULL,
  `year` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idGenerate Reports`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`generate result sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`generate result sheet` (
  `idGenerate Result Sheet` INT(11) NOT NULL,
  `Result` VARCHAR(45) NULL DEFAULT NULL,
  `Student_idMember` INT(11) NOT NULL,
  PRIMARY KEY (`idGenerate Result Sheet`),
  INDEX `fk_Generate Result Sheet_Student1_idx` (`Student_idMember` ASC)    ,
  CONSTRAINT `fk_Generate Result Sheet_Student1`
    FOREIGN KEY (`Student_idMember`)
    REFERENCES `saom`.`student` (`idMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`lessons` (
  `idLessons` INT(11) NOT NULL,
  `LessonName` VARCHAR(45) NULL DEFAULT NULL,
  `Location` VARCHAR(45) NULL DEFAULT NULL,
  `time` VARCHAR(45) NULL DEFAULT NULL,
  `Date` DATE NULL DEFAULT NULL,
  `Book Lessons_idBook Lessons` INT(11) NOT NULL,
  PRIMARY KEY (`idLessons`),
  INDEX `fk_Lessons_Book Lessons1_idx` (`Book Lessons_idBook Lessons` ASC)    ,
  CONSTRAINT `fk_Lessons_Book Lessons1`
    FOREIGN KEY (`Book Lessons_idBook Lessons`)
    REFERENCES `saom`.`book lessons` (`idBook Lessons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`member` (
  `idMember` INT(11) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `fName` VARCHAR(45) NULL DEFAULT NULL,
  `lName` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `Shopping cart_idShopping cart` INT(11) NOT NULL,
  PRIMARY KEY (`idMember`),
  INDEX `fk_Member_Shopping cart1_idx` (`Shopping cart_idShopping cart` ASC)    ,
  CONSTRAINT `fk_Member_Shopping cart1`
    FOREIGN KEY (`Shopping cart_idShopping cart`)
    REFERENCES `saom`.`shopping cart` (`idShopping cart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`staffs` (
  `idStaffs` INT(11) NOT NULL,
  `fName` VARCHAR(45) NULL DEFAULT NULL,
  `lName` VARCHAR(45) NULL DEFAULT NULL,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `staffCourse` VARCHAR(45) NULL DEFAULT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `Shopping cart_idShopping cart` INT(11) NOT NULL,
  PRIMARY KEY (`idStaffs`),
  INDEX `fk_Staffs_Shopping cart1_idx` (`Shopping cart_idShopping cart` ASC)    ,
  CONSTRAINT `fk_Staffs_Shopping cart1`
    FOREIGN KEY (`Shopping cart_idShopping cart`)
    REFERENCES `saom`.`shopping cart` (`idShopping cart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`private tuition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`private tuition` (
  `idPrivate Tuition` INT(11) NOT NULL,
  `Room` VARCHAR(45) NULL DEFAULT NULL,
  `Student_idMember` INT(11) NOT NULL,
  `Staffs_idStaffs` INT(11) NOT NULL,
  PRIMARY KEY (`idPrivate Tuition`),
  INDEX `fk_Private Tuition_Student1_idx` (`Student_idMember` ASC)    ,
  INDEX `fk_Private Tuition_Staffs1_idx` (`Staffs_idStaffs` ASC)    ,
  CONSTRAINT `fk_Private Tuition_Staffs1`
    FOREIGN KEY (`Staffs_idStaffs`)
    REFERENCES `saom`.`staffs` (`idStaffs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Private Tuition_Student1`
    FOREIGN KEY (`Student_idMember`)
    REFERENCES `saom`.`student` (`idMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`process exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`process exams` (
  `idProcess Exams` INT(11) NOT NULL,
  `time` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `Exam Center_idExam Center` INT(11) NOT NULL,
  PRIMARY KEY (`idProcess Exams`),
  INDEX `fk_Process Exams_Exam Center1_idx` (`Exam Center_idExam Center` ASC)    ,
  CONSTRAINT `fk_Process Exams_Exam Center1`
    FOREIGN KEY (`Exam Center_idExam Center`)
    REFERENCES `saom`.`exam center` (`idExam Center`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`process teacher timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`process teacher timetable` (
  `idProcess Teacher Timetable` INT(11) NOT NULL,
  `days` VARCHAR(45) NULL DEFAULT NULL,
  `dates` DATE NULL DEFAULT NULL,
  `time Slots` VARCHAR(45) NULL DEFAULT NULL,
  `Staffs_idStaffs` INT(11) NOT NULL,
  PRIMARY KEY (`idProcess Teacher Timetable`),
  INDEX `fk_Process Teacher Timetable_Staffs1_idx` (`Staffs_idStaffs` ASC)    ,
  CONSTRAINT `fk_Process Teacher Timetable_Staffs1`
    FOREIGN KEY (`Staffs_idStaffs`)
    REFERENCES `saom`.`staffs` (`idStaffs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`purchase` (
  `idPurchase` INT(11) NOT NULL,
  `datePurchased` DATE NULL DEFAULT NULL,
  `Shopping cart_idShopping cart` INT(11) NOT NULL,
  PRIMARY KEY (`idPurchase`),
  INDEX `fk_Purchase_Shopping cart1_idx` (`Shopping cart_idShopping cart` ASC)    ,
  CONSTRAINT `fk_Purchase_Shopping cart1`
    FOREIGN KEY (`Shopping cart_idShopping cart`)
    REFERENCES `saom`.`shopping cart` (`idShopping cart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`view student timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`view student timetable` (
  `idView Student Timetable` INT(11) NOT NULL,
  `timetable Layout` VARCHAR(45) NULL DEFAULT NULL,
  `weeks to view` VARCHAR(45) NULL DEFAULT NULL,
  `Student_idMember` INT(11) NOT NULL,
  PRIMARY KEY (`idView Student Timetable`),
  INDEX `fk_View Student Timetable_Student1_idx` (`Student_idMember` ASC)    ,
  CONSTRAINT `fk_View Student Timetable_Student1`
    FOREIGN KEY (`Student_idMember`)
    REFERENCES `saom`.`student` (`idMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `saom`.`view teacher timetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saom`.`view teacher timetable` (
  `idView Teacher Timetable` INT(11) NOT NULL,
  `timetable layout` VARCHAR(45) NULL DEFAULT NULL,
  `weeks to view` VARCHAR(45) NULL DEFAULT NULL,
  `Staffs_idStaffs` INT(11) NOT NULL,
  PRIMARY KEY (`idView Teacher Timetable`),
  INDEX `fk_View Teacher Timetable_Staffs1_idx` (`Staffs_idStaffs` ASC)    ,
  CONSTRAINT `fk_View Teacher Timetable_Staffs1`
    FOREIGN KEY (`Staffs_idStaffs`)
    REFERENCES `saom`.`staffs` (`idStaffs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

ALTER TABLE exams
ADD FOREIGN KEY (staffID) REFERENCES staffs(staffID);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;