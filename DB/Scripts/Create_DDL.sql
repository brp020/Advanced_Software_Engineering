-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `age` INT NULL,
  `currentWeight` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FoodNutrition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FoodNutrition` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FoodNutrition` (
  `IDFoodNutrition` VARCHAR(45) NOT NULL,
  `foodName` VARCHAR(128) NOT NULL,
  `upc_code` VARCHAR(45) NULL,
  `total_calories` VARCHAR(45) NULL,
  `serving_size_value` VARCHAR(45) NULL,
  `serving_size_mass` VARCHAR(45) NULL,
  `serving_size_units` VARCHAR(45) NULL,
  `calories_from_fats` VARCHAR(45) NULL,
  `total_fat_grams` VARCHAR(45) NULL,
  `total_fat_dv` VARCHAR(45) NULL,
  `trans_fat_grams` VARCHAR(45) NULL,
  `trans_fat_dv` VARCHAR(45) NULL,
  `saturated_fat_grams` VARCHAR(45) NULL,
  `saturated_fat_dv` VARCHAR(45) NULL,
  `cholesterol_grams` VARCHAR(45) NULL,
  `cholesterol_dv` VARCHAR(45) NULL,
  `sodium_grams` VARCHAR(45) NULL,
  `sodium_dv` VARCHAR(45) NULL,
  `total_carbohydrates_grams` VARCHAR(45) NULL,
  `total_carbohydrates_dv` VARCHAR(45) NULL,
  `dietary_fiber_grams` VARCHAR(45) NULL,
  `dietary_fiber_dv` VARCHAR(45) NULL,
  `sugars_grams` VARCHAR(45) NULL,
  `protein_grams` VARCHAR(45) NULL,
  `vitamin_a_dv` VARCHAR(45) NULL,
  `vitamin_c_dv` VARCHAR(45) NULL,
  `calcium_dv` VARCHAR(45) NULL,
  `iron_dv` VARCHAR(45) NULL,
  UNIQUE INDEX `foodName_UNIQUE` (`foodName` ASC) VISIBLE,
  PRIMARY KEY (`IDFoodNutrition`),
  UNIQUE INDEX `IDFoodNutrition_Identifier_UNIQUE` (`IDFoodNutrition` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FoodLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FoodLog` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FoodLog` (
  `idFoodLog` INT NOT NULL AUTO_INCREMENT,
  `User_idUser` INT NOT NULL,
  `FoodNutrition_IDFoodNutrition` VARCHAR(45) NOT NULL,
  `date_eaten` DATE NULL,
  `TimeStamp` DATETIME NULL,
  `quanity` INT NULL,
  PRIMARY KEY (`idFoodLog`, `User_idUser`, `FoodNutrition_IDFoodNutrition`),
  INDEX `fk_FoodLog_User_idx` (`User_idUser` ASC) VISIBLE,
  INDEX `fk_FoodLog_FoodNutrition1_idx` (`FoodNutrition_IDFoodNutrition` ASC) VISIBLE,
  UNIQUE INDEX `idFoodLog_UNIQUE` (`idFoodLog` ASC) VISIBLE,
  CONSTRAINT `fk_FoodLog_User`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FoodLog_FoodNutrition1`
    FOREIGN KEY (`FoodNutrition_IDFoodNutrition`)
    REFERENCES `mydb`.`FoodNutrition` (`IDFoodNutrition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ExerciseLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ExerciseLog` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ExerciseLog` (
  `idExerciseLog` INT NOT NULL AUTO_INCREMENT,
  `User_idUser` INT NOT NULL,
  `DateTime` DATETIME NULL,
  `Duration` VARCHAR(45) NULL,
  `Activity` VARCHAR(45) NULL,
  `CaloriesBurned` VARCHAR(45) NULL,
  PRIMARY KEY (`idExerciseLog`, `User_idUser`),
  INDEX `fk_ExerciseLog_User1_idx` (`User_idUser` ASC) VISIBLE,
  UNIQUE INDEX `idExerciseLog_UNIQUE` (`idExerciseLog` ASC) VISIBLE,
  CONSTRAINT `fk_ExerciseLog_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TargetGoals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TargetGoals` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TargetGoals` (
  `User_idUser` INT NOT NULL,
  `Weight` VARCHAR(45) NULL,
  `Calorie` VARCHAR(45) NULL,
  `Fat` VARCHAR(45) NULL,
  `carbohydrate` VARCHAR(45) NULL,
  `Protein` VARCHAR(45) NULL,
  PRIMARY KEY (`User_idUser`),
  CONSTRAINT `fk_TargetGoals_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NutritionixSchema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`NutritionixSchema` ;

CREATE TABLE IF NOT EXISTS `mydb`.`NutritionixSchema` (
  `food_name` VARCHAR(45) NOT NULL,
  `brand_name` VARCHAR(45) NULL,
  `serving_qty` VARCHAR(45) NULL,
  `serving_unit` VARCHAR(45) NULL,
  `serving_weight_grams` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `time` VARCHAR(45) NULL,
  `dateAndTime` VARCHAR(45) NULL,
  `is_raw_food` VARCHAR(45) NULL,
  `meal_type` VARCHAR(45) NULL,
  `food_group` VARCHAR(45) NULL,
  `ndb_no` VARCHAR(45) NULL,
  `calories` VARCHAR(45) NULL,
  `protein` VARCHAR(45) NULL,
  `total_fat` VARCHAR(45) NULL,
  `saturated_fat` VARCHAR(45) NULL,
  `total_carbs` VARCHAR(45) NULL,
  `fiber` VARCHAR(45) NULL,
  `sugars` VARCHAR(45) NULL,
  `cholesterol` VARCHAR(45) NULL,
  `potassium` VARCHAR(45) NULL,
  `sodium` VARCHAR(45) NULL,
  `photo` VARCHAR(45) NULL,
  PRIMARY KEY (`food_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DailyNumbers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DailyNumbers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DailyNumbers` (
  `Date` DATETIME NOT NULL,
  `Users_idUser` INT NOT NULL,
  `Calories_consumed` VARCHAR(45) NULL,
  `Calories_burned` VARCHAR(45) NULL,
  PRIMARY KEY (`Date`, `Users_idUser`),
  UNIQUE INDEX `Date_UNIQUE` (`Date` ASC) VISIBLE,
  CONSTRAINT `fk_DailyNumbers_Users1`
    FOREIGN KEY (`Users_idUser`)
    REFERENCES `mydb`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BaseMeal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BaseMeal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`BaseMeal` (
  `idBaseMeal` INT NOT NULL,
  `BaseMeal_name` VARCHAR(45) NULL,
  `can_be_breakfest` VARCHAR(45) NULL,
  `can_be_lunch` VARCHAR(45) NULL,
  `can_be_dinner` VARCHAR(45) NULL,
  PRIMARY KEY (`idBaseMeal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BaseIngredent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`BaseIngredent` ;

CREATE TABLE IF NOT EXISTS `mydb`.`BaseIngredent` (
  `FoodNutrition_IDFoodNutrition` VARCHAR(45) NOT NULL,
  `BaseMeal_idBaseMeal` INT NOT NULL,
  `ingredent_type` VARCHAR(45) NULL,
  `food_group` VARCHAR(45) NULL,
  PRIMARY KEY (`FoodNutrition_IDFoodNutrition`, `BaseMeal_idBaseMeal`),
  INDEX `fk_BaseIngredent_BaseMeal1_idx` (`BaseMeal_idBaseMeal` ASC) VISIBLE,
  INDEX `fk_BaseIngredent_FoodNutrition1_idx` (`FoodNutrition_IDFoodNutrition` ASC) VISIBLE,
  CONSTRAINT `fk_BaseIngredent_BaseMeal1`
    FOREIGN KEY (`BaseMeal_idBaseMeal`)
    REFERENCES `mydb`.`BaseMeal` (`idBaseMeal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BaseIngredent_FoodNutrition1`
    FOREIGN KEY (`FoodNutrition_IDFoodNutrition`)
    REFERENCES `mydb`.`FoodNutrition` (`IDFoodNutrition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MealSchedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MealSchedule` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MealSchedule` (
  `idMealSchedule` INT NOT NULL,
  `Users_idUser` INT NOT NULL,
  PRIMARY KEY (`idMealSchedule`, `Users_idUser`),
  INDEX `fk_MealSchedule_Users1_idx` (`Users_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_MealSchedule_Users1`
    FOREIGN KEY (`Users_idUser`)
    REFERENCES `mydb`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WeeklyMeals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`WeeklyMeals` ;

CREATE TABLE IF NOT EXISTS `mydb`.`WeeklyMeals` (
  `idWeeklyMeals` INT NOT NULL,
  `MealSchedule_idMealSchedule` INT NOT NULL,
  PRIMARY KEY (`idWeeklyMeals`, `MealSchedule_idMealSchedule`),
  INDEX `fk_WeeklyMeals_MealSchedule1_idx` (`MealSchedule_idMealSchedule` ASC) VISIBLE,
  CONSTRAINT `fk_WeeklyMeals_MealSchedule1`
    FOREIGN KEY (`MealSchedule_idMealSchedule`)
    REFERENCES `mydb`.`MealSchedule` (`idMealSchedule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DailyMeals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DailyMeals` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DailyMeals` (
  `idDailyMeals` INT NOT NULL,
  `WeeklyMeals_idWeeklyMeals` INT NOT NULL,
  PRIMARY KEY (`idDailyMeals`, `WeeklyMeals_idWeeklyMeals`),
  INDEX `fk_DailyMeals_WeeklyMeals1_idx` (`WeeklyMeals_idWeeklyMeals` ASC) VISIBLE,
  CONSTRAINT `fk_DailyMeals_WeeklyMeals1`
    FOREIGN KEY (`WeeklyMeals_idWeeklyMeals`)
    REFERENCES `mydb`.`WeeklyMeals` (`idWeeklyMeals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MealContent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MealContent` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MealContent` (
  `BaseMeal_idBaseMeal` INT NOT NULL,
  `DailyMeals_idDailyMeals` INT NOT NULL,
  `meal_type` INT NULL,
  PRIMARY KEY (`BaseMeal_idBaseMeal`, `DailyMeals_idDailyMeals`),
  INDEX `fk_MealContent_DailyMeals1_idx` (`DailyMeals_idDailyMeals` ASC) VISIBLE,
  CONSTRAINT `fk_MealContent_BaseMeal1`
    FOREIGN KEY (`BaseMeal_idBaseMeal`)
    REFERENCES `mydb`.`BaseMeal` (`idBaseMeal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MealContent_DailyMeals1`
    FOREIGN KEY (`DailyMeals_idDailyMeals`)
    REFERENCES `mydb`.`DailyMeals` (`idDailyMeals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MealSummary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MealSummary` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MealSummary` (
  `MealSummaryID` INT NOT NULL,
  `Total Calories` VARCHAR(45) NULL,
  `total_fat` VARCHAR(45) NULL,
  `total_trans_fat` VARCHAR(45) NULL,
  `total_saturated_fat` VARCHAR(45) NULL,
  `total_cholesterol` VARCHAR(45) NULL,
  `total_sodium` VARCHAR(45) NULL,
  `total_carbohydrates` VARCHAR(45) NULL,
  `total_dietary_fiber` VARCHAR(45) NULL,
  `total_sugars` VARCHAR(45) NULL,
  `total_protein` VARCHAR(45) NULL,
  `total_vitamin_a` VARCHAR(45) NULL,
  `total_vitamin_c` VARCHAR(45) NULL,
  `total_calcium` VARCHAR(45) NULL,
  `total_iron` VARCHAR(45) NULL,
  `BaseMeal_idBaseMeal` INT NOT NULL,
  PRIMARY KEY (`MealSummaryID`, `BaseMeal_idBaseMeal`),
  INDEX `fk_MealSummary_BaseMeal1_idx` (`BaseMeal_idBaseMeal` ASC) VISIBLE,
  CONSTRAINT `fk_MealSummary_BaseMeal1`
    FOREIGN KEY (`BaseMeal_idBaseMeal`)
    REFERENCES `mydb`.`BaseMeal` (`idBaseMeal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DailySummary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DailySummary` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DailySummary` (
  `DailySummaryID` INT NOT NULL,
  `Total Calories` VARCHAR(45) NULL,
  `total_fat` VARCHAR(45) NULL,
  `total_trans_fat` VARCHAR(45) NULL,
  `total_saturated_fat` VARCHAR(45) NULL,
  `total_cholesterol` VARCHAR(45) NULL,
  `total_sodium` VARCHAR(45) NULL,
  `total_carbohydrates` VARCHAR(45) NULL,
  `total_dietary_fiber` VARCHAR(45) NULL,
  `total_sugars` VARCHAR(45) NULL,
  `total_protein` VARCHAR(45) NULL,
  `total_vitamin_a` VARCHAR(45) NULL,
  `total_vitamin_c` VARCHAR(45) NULL,
  `total_calcium` VARCHAR(45) NULL,
  `total_iron` VARCHAR(45) NULL,
  `DailyMeals_idDailyMeals` INT NOT NULL,
  `DailyMeals_WeeklyMeals_idWeeklyMeals` INT NOT NULL,
  PRIMARY KEY (`DailySummaryID`, `DailyMeals_idDailyMeals`, `DailyMeals_WeeklyMeals_idWeeklyMeals`),
  INDEX `fk_DailySummary_DailyMeals1_idx` (`DailyMeals_idDailyMeals` ASC, `DailyMeals_WeeklyMeals_idWeeklyMeals` ASC) VISIBLE,
  CONSTRAINT `fk_DailySummary_DailyMeals1`
    FOREIGN KEY (`DailyMeals_idDailyMeals` , `DailyMeals_WeeklyMeals_idWeeklyMeals`)
    REFERENCES `mydb`.`DailyMeals` (`idDailyMeals` , `WeeklyMeals_idWeeklyMeals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WeeklySummary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`WeeklySummary` ;

CREATE TABLE IF NOT EXISTS `mydb`.`WeeklySummary` (
  `WeeklySummaryID` INT NOT NULL,
  `Total Calories` VARCHAR(45) NULL,
  `total_fat` VARCHAR(45) NULL,
  `total_trans_fat` VARCHAR(45) NULL,
  `total_saturated_fat` VARCHAR(45) NULL,
  `total_cholesterol` VARCHAR(45) NULL,
  `total_sodium` VARCHAR(45) NULL,
  `total_carbohydrates` VARCHAR(45) NULL,
  `total_dietary_fiber` VARCHAR(45) NULL,
  `total_sugars` VARCHAR(45) NULL,
  `total_protein` VARCHAR(45) NULL,
  `total_vitamin_a` VARCHAR(45) NULL,
  `total_vitamin_c` VARCHAR(45) NULL,
  `total_calcium` VARCHAR(45) NULL,
  `total_iron` VARCHAR(45) NULL,
  `WeeklyMeals_idWeeklyMeals` INT NOT NULL,
  PRIMARY KEY (`WeeklySummaryID`, `WeeklyMeals_idWeeklyMeals`),
  INDEX `fk_WeeklySummary_WeeklyMeals1_idx` (`WeeklyMeals_idWeeklyMeals` ASC) VISIBLE,
  CONSTRAINT `fk_WeeklySummary_WeeklyMeals1`
    FOREIGN KEY (`WeeklyMeals_idWeeklyMeals`)
    REFERENCES `mydb`.`WeeklyMeals` (`idWeeklyMeals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DailyGoal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DailyGoal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DailyGoal` (
  `idDailyGoal` INT NOT NULL,
  `current_%_calories` VARCHAR(45) NULL,
  `current_%_total_fat` VARCHAR(45) NULL,
  `current_%_trans_fat` VARCHAR(45) NULL,
  `current_%_saturated_fat` VARCHAR(45) NULL,
  `current_%_cholesterol` VARCHAR(45) NULL,
  `current_%_sodium` VARCHAR(45) NULL,
  `current_%_carbohydrates` VARCHAR(45) NULL,
  `current_%_dietary_fiber` VARCHAR(45) NULL,
  `current_g_sugars` VARCHAR(45) NULL,
  `current_g_protein` VARCHAR(45) NULL,
  `current_%_vitamin_a` VARCHAR(45) NULL,
  `current_%_vitamin_c` VARCHAR(45) NULL,
  `current_%_calcium` VARCHAR(45) NULL,
  `current_%_iron` VARCHAR(45) NULL,
  `DailyMeals_idDailyMeals` INT NOT NULL,
  `DailyMeals_WeeklyMeals_idWeeklyMeals` INT NOT NULL,
  PRIMARY KEY (`idDailyGoal`, `DailyMeals_idDailyMeals`, `DailyMeals_WeeklyMeals_idWeeklyMeals`),
  INDEX `fk_Goal_DailyMeals1_idx` (`DailyMeals_idDailyMeals` ASC, `DailyMeals_WeeklyMeals_idWeeklyMeals` ASC) VISIBLE,
  CONSTRAINT `fk_Goal_DailyMeals1`
    FOREIGN KEY (`DailyMeals_idDailyMeals` , `DailyMeals_WeeklyMeals_idWeeklyMeals`)
    REFERENCES `mydb`.`DailyMeals` (`idDailyMeals` , `WeeklyMeals_idWeeklyMeals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WeeklyGoal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`WeeklyGoal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`WeeklyGoal` (
  `idWeeklyGoal` INT NOT NULL,
  `current_%_calories` VARCHAR(45) NULL,
  `current_%_total_fat` VARCHAR(45) NULL,
  `current_%_trans_fat` VARCHAR(45) NULL,
  `current_%_saturated_fat` VARCHAR(45) NULL,
  `current_%_cholesterol` VARCHAR(45) NULL,
  `current_%_sodium` VARCHAR(45) NULL,
  `current_%_carbohydrates` VARCHAR(45) NULL,
  `current_%_dietary_fiber` VARCHAR(45) NULL,
  `current_g_sugars` VARCHAR(45) NULL,
  `current_g_protein` VARCHAR(45) NULL,
  `current_%_vitamin_a` VARCHAR(45) NULL,
  `current_%_vitamin_c` VARCHAR(45) NULL,
  `current_%_calcium` VARCHAR(45) NULL,
  `current_%_iron` VARCHAR(45) NULL,
  `WeeklyMeals_idWeeklyMeals` INT NOT NULL,
  PRIMARY KEY (`idWeeklyGoal`, `WeeklyMeals_idWeeklyMeals`),
  INDEX `fk_WeeklyGoal_WeeklyMeals1_idx` (`WeeklyMeals_idWeeklyMeals` ASC) VISIBLE,
  CONSTRAINT `fk_WeeklyGoal_WeeklyMeals1`
    FOREIGN KEY (`WeeklyMeals_idWeeklyMeals`)
    REFERENCES `mydb`.`WeeklyMeals` (`idWeeklyMeals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_credentals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_credentals` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user_credentals` (
  `Users_idUser` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Alexa_ID` VARCHAR(45) NULL,
  PRIMARY KEY (`Users_idUser`),
  CONSTRAINT `fk_user_Users1`
    FOREIGN KEY (`Users_idUser`)
    REFERENCES `mydb`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`FoodFullLog_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FoodFullLog_view` (`idFoodLog` INT, `User_idUser` INT, `FoodNutrition_IDFoodNutrition` INT, `date_eaten` INT, `TimeStamp` INT, `quanity` INT, `IDFoodNutrition` INT, `foodName` INT, `upc_code` INT, `total_calories` INT, `serving_size_value` INT, `serving_size_mass` INT, `serving_size_units` INT, `calories_from_fats` INT, `total_fat_grams` INT, `total_fat_dv` INT, `trans_fat_grams` INT, `trans_fat_dv` INT, `saturated_fat_grams` INT, `saturated_fat_dv` INT, `cholesterol_grams` INT, `cholesterol_dv` INT, `sodium_grams` INT, `sodium_dv` INT, `total_carbohydrates_grams` INT, `total_carbohydrates_dv` INT, `dietary_fiber_grams` INT, `dietary_fiber_dv` INT, `sugars_grams` INT, `protein_grams` INT, `vitamin_a_dv` INT, `vitamin_c_dv` INT, `calcium_dv` INT, `iron_dv` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`daily_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`daily_view` (`User_idUser` INT, `date_eaten` INT, `sum(total_calories*quanity)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`yearly_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`yearly_view` (`User_idUser` INT, `year(date_eaten)` INT, `sum(total_calories*quanity)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`weekly_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`weekly_view` (`User_idUser` INT, `weekofyear(date_eaten)` INT, `year(date_eaten)` INT, `sum(total_calories*quanity)` INT);

-- -----------------------------------------------------
-- View `mydb`.`FoodFullLog_view`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FoodFullLog_view`;
DROP VIEW IF EXISTS `mydb`.`FoodFullLog_view` ;
USE `mydb`;
CREATE  OR REPLACE VIEW `FoodFullLog_view` AS
    SELECT 
        *
    FROM
        FoodLog
           LEFT JOIN
        FoodNutrition ON FoodLog.FoodNutrition_IDFoodNutrition=FoodNutrition.IDFoodNutrition;

-- -----------------------------------------------------
-- View `mydb`.`daily_view`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`daily_view`;
DROP VIEW IF EXISTS `mydb`.`daily_view` ;
USE `mydb`;
CREATE  OR REPLACE VIEW `daily_view` AS
	Select
		User_idUser, date_eaten, sum(total_calories*quanity)
	from
		FoodFullLog_view
	group by User_idUser, date_eaten;

-- -----------------------------------------------------
-- View `mydb`.`yearly_view`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`yearly_view`;
DROP VIEW IF EXISTS `mydb`.`yearly_view` ;
USE `mydb`;
CREATE  OR REPLACE VIEW `yearly_view` AS
	Select
		User_idUser, year(date_eaten), sum(total_calories*quanity)
	from
		FoodFullLog_view
	group by User_idUser, year(date_eaten);

-- -----------------------------------------------------
-- View `mydb`.`weekly_view`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`weekly_view`;
DROP VIEW IF EXISTS `mydb`.`weekly_view` ;
USE `mydb`;
CREATE  OR REPLACE VIEW `weekly_view` AS
	Select
		User_idUser, weekofyear(date_eaten), year(date_eaten), sum(total_calories*quanity)
	from
		FoodFullLog_view
	group by User_idUser, week(date_eaten);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
