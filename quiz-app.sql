-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quiz_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema quiz_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quiz_db` DEFAULT CHARACTER SET utf8 ;
USE `quiz_db` ;

-- -----------------------------------------------------
-- Table `quiz_db`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_db`.`admin` (
                                                 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                 `username` VARCHAR(25) NOT NULL,
                                                 `email` VARCHAR(255) NOT NULL,
                                                 `password` VARCHAR(50) NOT NULL,
                                                 PRIMARY KEY (`id`),
                                                 UNIQUE INDEX `username_UNIQUE` (`username` ASC),
                                                 UNIQUE INDEX `email_UNIQUE` (`email` ASC));


-- -----------------------------------------------------
-- Table `quiz_db`.`correct_ans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_db`.`correct_ans` (
                                                       `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                       `answer` VARCHAR(255) NULL,
                                                       PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_db`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_db`.`questions` (
                                                     `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                     `question` VARCHAR(255) NOT NULL,
                                                     `admin_id` INT UNSIGNED NOT NULL,
                                                     `correct_ans_id` INT UNSIGNED NOT NULL,
                                                     PRIMARY KEY (`id`),
                                                     INDEX `fk_ques_admin1_idx` (`admin_id` ASC),
                                                     UNIQUE INDEX `question_UNIQUE` (`question` ASC),
                                                     INDEX `fk_ques_correct_ans1_idx` (`correct_ans_id` ASC),
                                                     CONSTRAINT `fk_ques_admin1`
                                                         FOREIGN KEY (`admin_id`)
                                                             REFERENCES `quiz_db`.`admin` (`id`)
                                                             ON DELETE NO ACTION
                                                             ON UPDATE NO ACTION,
                                                     CONSTRAINT `fk_ques_correct_ans1`
                                                         FOREIGN KEY (`correct_ans_id`)
                                                             REFERENCES `quiz_db`.`correct_ans` (`id`)
                                                             ON DELETE NO ACTION
                                                             ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `quiz_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_db`.`user` (
                                                `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                `username` VARCHAR(25) NOT NULL,
                                                `email` VARCHAR(255) NOT NULL,
                                                `password` VARCHAR(50) NOT NULL,
                                                PRIMARY KEY (`id`),
                                                UNIQUE INDEX `username_UNIQUE` (`username` ASC),
                                                UNIQUE INDEX `email_UNIQUE` (`email` ASC))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_db`.`user_ans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_db`.`user_ans` (
                                                    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                    `answer` VARCHAR(255) NULL,
                                                    `user_id` INT UNSIGNED NOT NULL,
                                                    `questions_id` INT UNSIGNED NOT NULL,
                                                    PRIMARY KEY (`id`, `user_id`),
                                                    INDEX `fk_ans_user1_idx` (`user_id` ASC),
                                                    INDEX `fk_user_ans_questions1_idx` (`questions_id` ASC),
                                                    CONSTRAINT `fk_ans_user1`
                                                        FOREIGN KEY (`user_id`)
                                                            REFERENCES `quiz_db`.`user` (`id`)
                                                            ON DELETE NO ACTION
                                                            ON UPDATE NO ACTION,
                                                    CONSTRAINT `fk_user_ans_questions1`
                                                        FOREIGN KEY (`questions_id`)
                                                            REFERENCES `quiz_db`.`questions` (`id`)
                                                            ON DELETE NO ACTION
                                                            ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_db`.`quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_db`.`quiz` (
                                                `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                `admin_id` INT UNSIGNED NOT NULL,
                                                `user_id` INT UNSIGNED NULL,
                                                PRIMARY KEY (`id`),
                                                INDEX `fk_quiz_admin1_idx` (`admin_id` ASC),
                                                INDEX `fk_quiz_user1_idx` (`user_id` ASC),
                                                CONSTRAINT `fk_quiz_admin1`
                                                    FOREIGN KEY (`admin_id`)
                                                        REFERENCES `quiz_db`.`admin` (`id`)
                                                        ON DELETE NO ACTION
                                                        ON UPDATE NO ACTION,
                                                CONSTRAINT `fk_quiz_user1`
                                                    FOREIGN KEY (`user_id`)
                                                        REFERENCES `quiz_db`.`user` (`id`)
                                                        ON DELETE NO ACTION
                                                        ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_db`.`quiz_has_ques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_db`.`quiz_has_ques` (
                                                         `quiz_id` INT UNSIGNED NOT NULL,
                                                         `ques_id` INT UNSIGNED NOT NULL,
                                                         PRIMARY KEY (`quiz_id`, `ques_id`),
                                                         INDEX `fk_quiz_has_ques_ques1_idx` (`ques_id` ASC),
                                                         INDEX `fk_quiz_has_ques_quiz1_idx` (`quiz_id` ASC),
                                                         CONSTRAINT `fk_quiz_has_ques_quiz1`
                                                             FOREIGN KEY (`quiz_id`)
                                                                 REFERENCES `quiz_db`.`quiz` (`id`)
                                                                 ON DELETE NO ACTION
                                                                 ON UPDATE NO ACTION,
                                                         CONSTRAINT `fk_quiz_has_ques_ques1`
                                                             FOREIGN KEY (`ques_id`)
                                                                 REFERENCES `quiz_db`.`questions` (`id`)
                                                                 ON DELETE NO ACTION
                                                                 ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
