-- MySQL Script generated by MySQL Workbench
-- Mon Mar 21 20:23:01 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`Client` (
  `id_Cl` INT NOT NULL,
  `nom_Cl` VARCHAR(45) NOT NULL,
  `prenom_Cl` VARCHAR(45) NOT NULL,
  `date_naiss_Cl` DATETIME NOT NULL,
  `email_Cl` VARCHAR(45) NOT NULL,
  `genre_Cl` VARCHAR(45) NOT NULL,
  `num_tel_Cl` INT NOT NULL,
  `adresse_Cl` VARCHAR(45) NOT NULL,
  `mdp_Cl` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Cl`))
ENGINE = InnoDB;

INSERT INTO `blog`.`Client` (`id_Cl`, `nom_Cl`, `prenom_Cl`, `date_naiss_Cl`,`email_Cl`,`genre_Cl`,`num_tel_Cl`,`adresse_Cl`,`mdp_Cl`) VALUES
(1, 'Mohamed Aziz','Ouerfelli','DD/MM/YYYY 10/09/2000','ouerfellimohamedaziz@gmail.com','Homme','58753880','mourouj 5 ben arous','ouerfelli109'),
(2, 'Iheb','Benmarzouk','DD/MM/YYYY 26/06/2000','benmarzoukiheb@gmail.com','Homme','27545456','denden manouba','benmarzouk123'),
(3, 'Anas','Kamoun','DD/MM/YYYY 15/08/2002','Kamounanas@gmail.com','Homme','55415151','borj cedreia ben arous','kamounanas147')



-- -----------------------------------------------------
-- Table `blog`.`Propriétaire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`Propriétaire` (
  `id_Prop` INT NOT NULL,
  `nom_Prop` VARCHAR(45) NOT NULL,
  `prenom_Prop` VARCHAR(45) NOT NULL,
  `date_naiss_Prop` DATETIME NOT NULL,
  `email_Prop` VARCHAR(45) NOT NULL,
  `genre_Prop` VARCHAR(45) NOT NULL,
  `num_tel_Prop` VARCHAR(45) NOT NULL,
  `adresse_Prop` VARCHAR(45) NOT NULL,
  `mdp_Prop` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Prop`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`Réservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`Réservation` (
  `id_Rés` INT NOT NULL,
  `nbre_per_jou` INT NOT NULL,
  `date-heur-rés` DATETIME NOT NULL,
  `Client_id_Cl` INT NOT NULL,
  `Propriétaire_id_Prop` INT NOT NULL,
  PRIMARY KEY (`id_Rés`),
  INDEX `fk_Réservation_Client1_idx` (`Client_id_Cl` ASC) VISIBLE,
  INDEX `fk_Réservation_Propriétaire1_idx` (`Propriétaire_id_Prop` ASC) VISIBLE,
  CONSTRAINT `fk_Réservation_Client1`
    FOREIGN KEY (`Client_id_Cl`)
    REFERENCES `blog`.`Client` (`id_Cl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Réservation_Propriétaire1`
    FOREIGN KEY (`Propriétaire_id_Prop`)
    REFERENCES `blog`.`Propriétaire` (`id_Prop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`Terrain`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`Terrain` (
  `id_Terr` INT NOT NULL,
  `nom_Terr` VARCHAR(45) NOT NULL,
  `num_tel_Prop_terr` VARCHAR(45) NOT NULL,
  `adresse_terr` VARCHAR(45) NOT NULL,
  `nbre_pres` INT NOT NULL,
  `Heur_ouv` TIME NOT NULL,
  `Heur_ferm` TIME NOT NULL,
  `img_terr` LONGBLOB NOT NULL,
  `Description_terr` LONGTEXT NULL,
  `Propriétaire_id_Prop` INT NOT NULL,
  `Réservation_id_Rés` INT NOT NULL,
  PRIMARY KEY (`id_Terr`),
  INDEX `fk_Terrain_Propriétaire1_idx` (`Propriétaire_id_Prop` ASC) VISIBLE,
  INDEX `fk_Terrain_Réservation1_idx` (`Réservation_id_Rés` ASC) VISIBLE,
  CONSTRAINT `fk_Terrain_Propriétaire1`
    FOREIGN KEY (`Propriétaire_id_Prop`)
    REFERENCES `blog`.`Propriétaire` (`id_Prop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Terrain_Réservation1`
    FOREIGN KEY (`Réservation_id_Rés`)
    REFERENCES `blog`.`Réservation` (`id_Rés`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;