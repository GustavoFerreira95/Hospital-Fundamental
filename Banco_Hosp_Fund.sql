SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hosp_fund
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hosp_fund` DEFAULT CHARACTER SET utf8 ;
USE `hosp_fund` ;

-- -----------------------------------------------------
-- Table `hosp_fund`.`Especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Especialidade` (
  `idEspecialidade` INT NOT NULL AUTO_INCREMENT,
  `Nome_Esp` VARCHAR(45) NULL,
  PRIMARY KEY (`idEspecialidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Médico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Médico` (
  `idMédico` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `RG` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `CRM` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Tipo_Medico` VARCHAR(45) NULL,
  `Especialidade_idEspecialidade` INT NOT NULL,
  PRIMARY KEY (`idMédico`),
  CONSTRAINT `fk_Médico_Especialidade1`
    FOREIGN KEY (`Especialidade_idEspecialidade`)
    REFERENCES `hosp_fund`.`Especialidade` (`idEspecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Convenio` (
  `idConvenio` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  `Carencia` DATE NULL,
  PRIMARY KEY (`idConvenio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Enfermeiro` (
  `idEnfermeiro` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `CRE` VARCHAR(45) NULL,
  PRIMARY KEY (`idEnfermeiro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Paciente` (
  `idPaciente` INT NOT NULL AUTO_INCREMENT,
  `Nome_Pac` VARCHAR(45) NULL,
  `DataNasc` DATE NULL,
  `Endereco` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `RG` VARCHAR(45) NULL,
  `Convenio_idConvenio` INT NOT NULL,
  `Médico_idMédico` INT NOT NULL,
  `Enfermeiro_idEnfermeiro` INT NOT NULL,
  PRIMARY KEY (`idPaciente`, `Convenio_idConvenio`, `Médico_idMédico`),
  CONSTRAINT `fk_Paciente_Convenio1`
    FOREIGN KEY (`Convenio_idConvenio`)
    REFERENCES `hosp_fund`.`Convenio` (`idConvenio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Médico1`
    FOREIGN KEY (`Médico_idMédico`)
    REFERENCES `hosp_fund`.`Médico` (`idMédico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Enfermeiro1`
    FOREIGN KEY (`Enfermeiro_idEnfermeiro`)
    REFERENCES `hosp_fund`.`Enfermeiro` (`idEnfermeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Consulta` (
  `idConsulta` INT NOT NULL AUTO_INCREMENT,
  `DataHora` DATETIME(6) NULL,
  `Valor` DECIMAL(5) NULL,
  `Consulta_idConsulta` INT NOT NULL,
  PRIMARY KEY (`idConsulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Medicamento` (
  `idMedicamento` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `Quantidade` INT NULL,
  `Instrucoes` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Receita` (
  `idReceita` INT NOT NULL AUTO_INCREMENT,
  `Medicamento_idMedicamento` INT NOT NULL,
  PRIMARY KEY (`idReceita`),
  CONSTRAINT `fk_Receita_Medicamento`
    FOREIGN KEY (`Medicamento_idMedicamento`)
    REFERENCES `hosp_fund`.`Medicamento` (`idMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Médico_has_Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Médico_has_Consulta` (
  `Médico_idMédico` INT NOT NULL,
  `Consulta_idConsulta` INT NOT NULL,
  PRIMARY KEY (`Médico_idMédico`, `Consulta_idConsulta`),
  CONSTRAINT `fk_Médico_has_Consulta_Médico1`
    FOREIGN KEY (`Médico_idMédico`)
    REFERENCES `hosp_fund`.`Médico` (`idMédico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Médico_has_Consulta_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `hosp_fund`.`Consulta` (`idConsulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Consulta_has_Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Consulta_has_Receita` (
  `Consulta_idConsulta` INT NOT NULL,
  `Receita_idReceita` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Receita_idReceita`),
  CONSTRAINT `fk_Consulta_has_Receita_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `hosp_fund`.`Consulta` (`idConsulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_has_Receita_Receita1`
    FOREIGN KEY (`Receita_idReceita`)
    REFERENCES `hosp_fund`.`Receita` (`idReceita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Consulta_has_Convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Consulta_has_Convenio` (
  `Consulta_idConsulta` INT NOT NULL,
  `Convenio_idConvenio` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Convenio_idConvenio`),
  CONSTRAINT `fk_Consulta_has_Convenio_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `hosp_fund`.`Consulta` (`idConsulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_has_Convenio_Convenio1`
    FOREIGN KEY (`Convenio_idConvenio`)
    REFERENCES `hosp_fund`.`Convenio` (`idConvenio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Consulta_has_Especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Consulta_has_Especialidade` (
  `Consulta_idConsulta` INT NOT NULL,
  `Especialidade_idEspecialidade` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Especialidade_idEspecialidade`),
  CONSTRAINT `fk_Consulta_has_Especialidade_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `hosp_fund`.`Consulta` (`idConsulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_has_Especialidade_Especialidade1`
    FOREIGN KEY (`Especialidade_idEspecialidade`)
    REFERENCES `hosp_fund`.`Especialidade` (`idEspecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Quarto` (
  `idQuarto` INT NOT NULL AUTO_INCREMENT,
  `Num` INT NULL,
  `Tipo` VARCHAR(45) NULL,
  `Enfermeiro_idEnfermeiro` INT NOT NULL,
  PRIMARY KEY (`idQuarto`),
  CONSTRAINT `fk_Quarto_Enfermeiro1`
    FOREIGN KEY (`Enfermeiro_idEnfermeiro`)
    REFERENCES `hosp_fund`.`Enfermeiro` (`idEnfermeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Internação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Internação` (
  `idInternação` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATE NULL,
  `data_prev_alta` DATE NULL,
  `data_alta` DATE NULL,
  `procedimento` VARCHAR(45) NULL,
  PRIMARY KEY (`idInternação`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Tipo_Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Tipo_Quarto` (
  `idQuarto` INT NOT NULL AUTO_INCREMENT,
  `descrição` VARCHAR(45) NULL,
  `valor_diária` INT NULL,
  `Quarto_idQuarto` INT NOT NULL,
  PRIMARY KEY (`idQuarto`),
  CONSTRAINT `fk_Tipo_Quarto_Quarto1`
    FOREIGN KEY (`Quarto_idQuarto`)
    REFERENCES `hosp_fund`.`Quarto` (`idQuarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Internação_has_Enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Internação_has_Enfermeiro` (
  `Internação_idInternação` INT NOT NULL,
  `Enfermeiro_idEnfermeiro` INT NOT NULL,
  PRIMARY KEY (`Internação_idInternação`, `Enfermeiro_idEnfermeiro`),
  CONSTRAINT `fk_Internação_has_Enfermeiro_Internação1`
    FOREIGN KEY (`Internação_idInternação`)
    REFERENCES `hosp_fund`.`Internação` (`idInternação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Internação_has_Enfermeiro_Enfermeiro1`
    FOREIGN KEY (`Enfermeiro_idEnfermeiro`)
    REFERENCES `hosp_fund`.`Enfermeiro` (`idEnfermeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hosp_fund`.`Paciente_has_Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hosp_fund`.`Paciente_has_Quarto` (
  `Paciente_idPaciente` INT NOT NULL,
  `Paciente_Convenio_idConvenio` INT NOT NULL,
  `Paciente_Médico_idMédico` INT NOT NULL,
  `Quarto_idQuarto` INT NOT NULL,
  PRIMARY KEY (`Paciente_idPaciente`, `Paciente_Convenio_idConvenio`, `Paciente_Médico_idMédico`, `Quarto_idQuarto`),
  CONSTRAINT `fk_Paciente_has_Quarto_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente` , `Paciente_Convenio_idConvenio` , `Paciente_Médico_idMédico`)
    REFERENCES `hosp_fund`.`Paciente` (`idPaciente` , `Convenio_idConvenio` , `Médico_idMédico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_has_Quarto_Quarto1`
    FOREIGN KEY (`Quarto_idQuarto`)
    REFERENCES `hosp_fund`.`Quarto` (`idQuarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
