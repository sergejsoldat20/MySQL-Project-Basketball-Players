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
-- Table `mydb`.`Drzava`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Drzava` (
  `idDrzava` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDrzava`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Grad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Grad` (
  `idGrad` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `idDrzava` INT NOT NULL,
  PRIMARY KEY (`idGrad`),
  INDEX `fk_Grad_Drzava1_idx` (`idDrzava` ASC) VISIBLE,
  CONSTRAINT `fk_Grad_Drzava1`
    FOREIGN KEY (`idDrzava`)
    REFERENCES `mydb`.`Drzava` (`idDrzava`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Osoba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Osoba` (
  `idOsoba` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(20) NOT NULL,
  `prezime` VARCHAR(20) NOT NULL,
  `idMjestoRodjenja` INT NOT NULL,
  `plata` INT NOT NULL,
  PRIMARY KEY (`idOsoba`),
  INDEX `fk_Osoba_Grad1_idx` (`idMjestoRodjenja` ASC) VISIBLE,
  CONSTRAINT `fk_Osoba_Grad1`
    FOREIGN KEY (`idMjestoRodjenja`)
    REFERENCES `mydb`.`Grad` (`idGrad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Kosarkas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kosarkas` (
  `idOsoba` INT NOT NULL,
  `brojDresa` INT NULL,
  `prosjekPoena` DOUBLE NULL,
  `prosjekAsistencija` DOUBLE NULL,
  `prosjekSkokova` DOUBLE NULL,
  `visina` SMALLINT NULL,
  `tezina` FLOAT NULL,
  PRIMARY KEY (`idOsoba`),
  CONSTRAINT `fk_Kosarkas_Osoba`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Osoba` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Trener`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trener` (
  `idOsoba` INT NOT NULL,
  `datumPocetkaKarijere` DATE NOT NULL,
  PRIMARY KEY (`idOsoba`),
  CONSTRAINT `fk_Trener_Osoba1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Osoba` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dvorana`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dvorana` (
  `idDvorana` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NULL,
  `kapacitet` INT NULL,
  `adresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idDvorana`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Klub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Klub` (
  `idKlub` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NULL,
  `idDvorana` INT NOT NULL,
  `idGrad` INT NOT NULL,
  `brojBodova` INT NULL,
  PRIMARY KEY (`idKlub`),
  INDEX `fk_Klub_Dvorana1_idx` (`idDvorana` ASC) VISIBLE,
  INDEX `fk_Klub_Grad1_idx` (`idGrad` ASC) VISIBLE,
  CONSTRAINT `fk_Klub_Dvorana1`
    FOREIGN KEY (`idDvorana`)
    REFERENCES `mydb`.`Dvorana` (`idDvorana`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Klub_Grad1`
    FOREIGN KEY (`idGrad`)
    REFERENCES `mydb`.`Grad` (`idGrad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Kosarkas_igra_za_klub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kosarkas_igra_za_klub` (
  `idKlub` INT NOT NULL,
  `idOsoba` INT NOT NULL,
  `datumPotpisaUgovora` DATE NULL,
  `datumIstekaUgovora` DATE NULL,
  `brojNaDresu` INT NULL,
  `datumRaskidaUgovora` DATE NULL,
  PRIMARY KEY (`idKlub`, `idOsoba`),
  INDEX `fk_Klub_has_Kosarkas_Kosarkas1_idx` (`idOsoba` ASC) VISIBLE,
  INDEX `fk_Klub_has_Kosarkas_Klub1_idx` (`idKlub` ASC) VISIBLE,
  CONSTRAINT `fk_Klub_has_Kosarkas_Klub1`
    FOREIGN KEY (`idKlub`)
    REFERENCES `mydb`.`Klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Klub_has_Kosarkas_Kosarkas1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Kosarkas` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Trener_trenira_u_klubu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trener_trenira_u_klubu` (
  `idKlub` INT NOT NULL,
  `idOsoba` INT NOT NULL,
  `datumPotpisaUgovora` DATE NULL,
  `datumRaskidaUgovora` DATE NULL,
  `datumIstekaUgovora` DATE NULL,
  PRIMARY KEY (`idKlub`, `idOsoba`),
  INDEX `fk_Klub_has_Trener_Trener1_idx` (`idOsoba` ASC) VISIBLE,
  INDEX `fk_Klub_has_Trener_Klub1_idx` (`idKlub` ASC) VISIBLE,
  CONSTRAINT `fk_Klub_has_Trener_Klub1`
    FOREIGN KEY (`idKlub`)
    REFERENCES `mydb`.`Klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Klub_has_Trener_Trener1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Trener` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Liga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Liga` (
  `idLiga` INT NOT NULL AUTO_INCREMENT,
  `idDrzava` INT NOT NULL,
  `nazivLige` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLiga`),
  INDEX `fk_Liga_Drzava1_idx` (`idDrzava` ASC) VISIBLE,
  CONSTRAINT `fk_Liga_Drzava1`
    FOREIGN KEY (`idDrzava`)
    REFERENCES `mydb`.`Drzava` (`idDrzava`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Utakmica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Utakmica` (
  `idUtakmica` INT NOT NULL,
  `datumVrijeme` DATETIME NOT NULL,
  `idDomaci` INT NOT NULL,
  `idGosti` INT NOT NULL,
  `idLiga` INT NOT NULL,
  PRIMARY KEY (`idUtakmica`),
  INDEX `fk_Utakmica_Klub1_idx` (`idDomaci` ASC) VISIBLE,
  INDEX `fk_Utakmica_Klub2_idx` (`idGosti` ASC) VISIBLE,
  INDEX `fk_Utakmica_Liga1_idx` (`idLiga` ASC) VISIBLE,
  CONSTRAINT `fk_Utakmica_Klub1`
    FOREIGN KEY (`idDomaci`)
    REFERENCES `mydb`.`Klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utakmica_Klub2`
    FOREIGN KEY (`idGosti`)
    REFERENCES `mydb`.`Klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utakmica_Liga1`
    FOREIGN KEY (`idLiga`)
    REFERENCES `mydb`.`Liga` (`idLiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pozicija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pozicija` (
  `idPozicija` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NULL,
  PRIMARY KEY (`idPozicija`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sezona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sezona` (
  `idSezona` INT NOT NULL AUTO_INCREMENT,
  `oznakaSezone` VARCHAR(45) NULL,
  PRIMARY KEY (`idSezona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tabela`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tabela` (
  `idSezona` INT NOT NULL,
  `idLiga` INT NOT NULL,
  PRIMARY KEY (`idSezona`, `idLiga`),
  INDEX `fk_Tabela_Liga1_idx` (`idLiga` ASC) VISIBLE,
  CONSTRAINT `fk_Tabela_Sezona1`
    FOREIGN KEY (`idSezona`)
    REFERENCES `mydb`.`Sezona` (`idSezona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tabela_Liga1`
    FOREIGN KEY (`idLiga`)
    REFERENCES `mydb`.`Liga` (`idLiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Kosarkas_igra_na_poziciji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kosarkas_igra_na_poziciji` (
  `idOsoba` INT NOT NULL,
  `idPozicija` INT NOT NULL,
  PRIMARY KEY (`idOsoba`, `idPozicija`),
  INDEX `fk_Kosarkas_has_Pozicija_Pozicija1_idx` (`idPozicija` ASC) VISIBLE,
  INDEX `fk_Kosarkas_has_Pozicija_Kosarkas1_idx` (`idOsoba` ASC) VISIBLE,
  CONSTRAINT `fk_Kosarkas_has_Pozicija_Kosarkas1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Kosarkas` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kosarkas_has_Pozicija_Pozicija1`
    FOREIGN KEY (`idPozicija`)
    REFERENCES `mydb`.`Pozicija` (`idPozicija`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pozicija_na_tabeli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pozicija_na_tabeli` (
  `idKlub` INT NOT NULL,
  `idSezona` INT NOT NULL,
  `idLiga` INT NOT NULL,
  `pozicija` INT NULL,
  PRIMARY KEY (`idKlub`, `idSezona`, `idLiga`),
  INDEX `fk_Klub_has_Tabela_Tabela1_idx` (`idSezona` ASC, `idLiga` ASC) VISIBLE,
  INDEX `fk_Klub_has_Tabela_Klub1_idx` (`idKlub` ASC) VISIBLE,
  CONSTRAINT `fk_Klub_has_Tabela_Klub1`
    FOREIGN KEY (`idKlub`)
    REFERENCES `mydb`.`Klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Klub_has_Tabela_Tabela1`
    FOREIGN KEY (`idSezona` , `idLiga`)
    REFERENCES `mydb`.`Tabela` (`idSezona` , `idLiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sudija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sudija` (
  `idOsoba` INT NOT NULL,
  `datumIzbora` DATE NULL,
  PRIMARY KEY (`idOsoba`),
  CONSTRAINT `fk_Sudija_Osoba1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Osoba` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sudija_sudi_utakmicu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sudija_sudi_utakmicu` (
  `idUtakmica` INT NOT NULL,
  `idOsoba` INT NOT NULL,
  PRIMARY KEY (`idUtakmica`, `idOsoba`),
  INDEX `fk_Utakmica_has_Sudija_Sudija1_idx` (`idOsoba` ASC) VISIBLE,
  INDEX `fk_Utakmica_has_Sudija_Utakmica1_idx` (`idUtakmica` ASC) VISIBLE,
  CONSTRAINT `fk_Utakmica_has_Sudija_Utakmica1`
    FOREIGN KEY (`idUtakmica`)
    REFERENCES `mydb`.`Utakmica` (`idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utakmica_has_Sudija_Sudija1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Sudija` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transfer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transfer` (
  `idOsoba` INT NOT NULL,
  `idTrenutniKlub` INT NOT NULL,
  `idNoviKlub` INT NOT NULL,
  `iznos` INT NULL,
  `datum` DATE NULL,
  PRIMARY KEY (`idOsoba`, `idTrenutniKlub`, `idNoviKlub`),
  INDEX `fk_Transfer_Klub1_idx` (`idTrenutniKlub` ASC) VISIBLE,
  INDEX `fk_Transfer_Klub2_idx` (`idNoviKlub` ASC) VISIBLE,
  CONSTRAINT `fk_Transfer_Kosarkas1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Kosarkas` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transfer_Klub1`
    FOREIGN KEY (`idTrenutniKlub`)
    REFERENCES `mydb`.`Klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transfer_Klub2`
    FOREIGN KEY (`idNoviKlub`)
    REFERENCES `mydb`.`Klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Izmjena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Izmjena` (
  `idUtakmica` INT NOT NULL,
  `idOsobaUlazi` INT NOT NULL,
  `idOsobaIzlazi` INT NOT NULL,
  PRIMARY KEY (`idUtakmica`, `idOsobaUlazi`, `idOsobaIzlazi`),
  INDEX `fk_Izmjena_Kosarkas1_idx` (`idOsobaUlazi` ASC) VISIBLE,
  INDEX `fk_Izmjena_Kosarkas2_idx` (`idOsobaIzlazi` ASC) VISIBLE,
  CONSTRAINT `fk_Izmjena_Utakmica1`
    FOREIGN KEY (`idUtakmica`)
    REFERENCES `mydb`.`Utakmica` (`idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Izmjena_Kosarkas1`
    FOREIGN KEY (`idOsobaUlazi`)
    REFERENCES `mydb`.`Kosarkas` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Izmjena_Kosarkas2`
    FOREIGN KEY (`idOsobaIzlazi`)
    REFERENCES `mydb`.`Kosarkas` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrator` (
  `korisnickoIme` VARCHAR(20) NOT NULL,
  `lozinka` VARCHAR(45) NULL,
  PRIMARY KEY (`korisnickoIme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Kosarkas_Registrovan_Za_Utakmicu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kosarkas_Registrovan_Za_Utakmicu` (
  `idUtakmica` INT NOT NULL,
  `brojPoena` INT NULL,
  `brojAsistencija` INT NULL,
  `brojSkokova` INT NULL,
  `ukradeneLopte` INT NULL,
  `blokade` INT NULL,
  `idKlub` INT NOT NULL,
  `idOsoba` INT NOT NULL,
  PRIMARY KEY (`idUtakmica`, `idOsoba`),
  INDEX `fk_Kosarkas_Registrovan_Za_Utakmicu_Klub1_idx` (`idKlub` ASC) VISIBLE,
  INDEX `fk_Kosarkas_Registrovan_Za_Utakmicu_Kosarkas_igra_na_pozici_idx` (`idOsoba` ASC) VISIBLE,
  CONSTRAINT `fk_Kosarkas_Registrovan_Za_Utakmicu_Utakmica1`
    FOREIGN KEY (`idUtakmica`)
    REFERENCES `mydb`.`Utakmica` (`idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kosarkas_Registrovan_Za_Utakmicu_Klub1`
    FOREIGN KEY (`idKlub`)
    REFERENCES `mydb`.`Klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kosarkas_Registrovan_Za_Utakmicu_Kosarkas_igra_na_poziciji1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `mydb`.`Kosarkas_igra_na_poziciji` (`idOsoba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
