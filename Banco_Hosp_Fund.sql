-- -----------------------------------------------------
-- Schema Hosp_Fund
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hosp_Fund` DEFAULT CHARACTER SET utf8 ;
USE `Hosp_Fund` ;

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Especialidade` (
  `idEspecialidade` INT NOT NULL,
  `Nome_Esp` VARCHAR(45) NULL,
  PRIMARY KEY (`idEspecialidade`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Medico` (
  `idMedico` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `RG` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `CRM` VARCHAR(45) NULL,
  `Endereco` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Tipo_Medico` VARCHAR(45) NULL,
  `Especialidade_idEspecialidade` INT NOT NULL,
  PRIMARY KEY (`idMedico`),
  INDEX `fk_Medico_Especialidade1_idx` (`Especialidade_idEspecialidade` ASC),
  CONSTRAINT `fk_Medico_Especialidade1`
    FOREIGN KEY (`Especialidade_idEspecialidade`)
    REFERENCES `Hosp_Fund`.`Especialidade` (`idEspecialidade`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Convenio` (
  `idConvenio` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  `Carencia` DATE NULL,
  PRIMARY KEY (`idConvenio`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Enfermeiro` (
  `idEnfermeiro` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `CRE` VARCHAR(45) NULL,
  PRIMARY KEY (`idEnfermeiro`)
);
 
-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Paciente` (
  `idPaciente` INT NOT NULL,
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
  INDEX `fk_Paciente_Convenio1_idx` (`Convenio_idConvenio` ASC),
  INDEX `fk_Paciente_Médico1_idx` (`Médico_idMédico` ASC),
  INDEX `fk_Paciente_Enfermeiro1_idx` (`Enfermeiro_idEnfermeiro` ASC),
  CONSTRAINT `fk_Paciente_Convenio1`
    FOREIGN KEY (`Convenio_idConvenio`)
    REFERENCES `Hosp_Fund`.`Convenio` (`idConvenio`),
  CONSTRAINT `fk_Paciente_Médico1`
    FOREIGN KEY (`Médico_idMédico`)
    REFERENCES `Hosp_Fund`.`Medico` (`idMedico`),
  CONSTRAINT `fk_Paciente_Enfermeiro1`
    FOREIGN KEY (`Enfermeiro_idEnfermeiro`)
    REFERENCES `Hosp_Fund`.`Enfermeiro` (`idEnfermeiro`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Consulta` (
  `idConsulta` INT NOT NULL,
  `DataHora` DATETIME(6) NULL,
  `Valor` DECIMAL(5) NULL,
  PRIMARY KEY (`idConsulta`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Medicamento` (
  `idMedicamento` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Quantidade` INT NULL,
  `Instrucoes` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedicamento`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Receita` (
  `idReceita` INT NOT NULL,
  `Medicamento_idMedicamento` INT NOT NULL,
  PRIMARY KEY (`idReceita`),
  INDEX `fk_Receita_Medicamento_idx` (`Medicamento_idMedicamento` ASC),
  CONSTRAINT `fk_Receita_Medicamento`
    FOREIGN KEY (`Medicamento_idMedicamento`)
    REFERENCES `Hosp_Fund`.`Medicamento` (`idMedicamento`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Médico_has_Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Médico_has_Consulta` (
  `Médico_idMédico` INT NOT NULL,
  `Consulta_idConsulta` INT NOT NULL,
  PRIMARY KEY (`Médico_idMédico`, `Consulta_idConsulta`),
  INDEX `fk_Médico_has_Consulta_Consulta1_idx` (`Consulta_idConsulta` ASC),
  INDEX `fk_Médico_has_Consulta_Médico1_idx` (`Médico_idMédico` ASC),
  CONSTRAINT `fk_Médico_has_Consulta_Médico1`
    FOREIGN KEY (`Médico_idMédico`)
    REFERENCES `Hosp_Fund`.`Medico` (`idMedico`),
  CONSTRAINT `fk_Médico_has_Consulta_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `Hosp_Fund`.`Consulta` (`idConsulta`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Consulta_has_Receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Consulta_has_Receita` (
  `Consulta_idConsulta` INT NOT NULL,
  `Receita_idReceita` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Receita_idReceita`),
  INDEX `fk_Consulta_has_Receita_Receita1_idx` (`Receita_idReceita` ASC),
  INDEX `fk_Consulta_has_Receita_Consulta1_idx` (`Consulta_idConsulta` ASC),
  CONSTRAINT `fk_Consulta_has_Receita_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `Hosp_Fund`.`Consulta` (`idConsulta`),
  CONSTRAINT `fk_Consulta_has_Receita_Receita1`
    FOREIGN KEY (`Receita_idReceita`)
    REFERENCES `Hosp_Fund`.`Receita` (`idReceita`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Consulta_has_Convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Consulta_has_Convenio` (
  `Consulta_idConsulta` INT NOT NULL,
  `Convenio_idConvenio` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Convenio_idConvenio`),
  INDEX `fk_Consulta_has_Convenio_Convenio1_idx` (`Convenio_idConvenio` ASC),
  INDEX `fk_Consulta_has_Convenio_Consulta1_idx` (`Consulta_idConsulta` ASC),
  CONSTRAINT `fk_Consulta_has_Convenio_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `Hosp_Fund`.`Consulta` (`idConsulta`),
  CONSTRAINT `fk_Consulta_has_Convenio_Convenio1`
    FOREIGN KEY (`Convenio_idConvenio`)
    REFERENCES `Hosp_Fund`.`Convenio` (`idConvenio`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Consulta_has_Especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Consulta_has_Especialidade` (
  `Consulta_idConsulta` INT NOT NULL,
  `Especialidade_idEspecialidade` INT NOT NULL,
  PRIMARY KEY (`Consulta_idConsulta`, `Especialidade_idEspecialidade`),
  INDEX `fk_Consulta_has_Especialidade_Especialidade1_idx` (`Especialidade_idEspecialidade` ASC),
  INDEX `fk_Consulta_has_Especialidade_Consulta1_idx` (`Consulta_idConsulta` ASC),
  CONSTRAINT `fk_Consulta_has_Especialidade_Consulta1`
    FOREIGN KEY (`Consulta_idConsulta`)
    REFERENCES `Hosp_Fund`.`Consulta` (`idConsulta`),
  CONSTRAINT `fk_Consulta_has_Especialidade_Especialidade1`
    FOREIGN KEY (`Especialidade_idEspecialidade`)
    REFERENCES `Hosp_Fund`.`Especialidade` (`idEspecialidade`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Quarto` (
  `idQuarto` INT NOT NULL,
  `Num` INT NULL,
  `Tipo` VARCHAR(45) NULL,
  `Enfermeiro_idEnfermeiro` INT NOT NULL,
  PRIMARY KEY (`idQuarto`),
  INDEX `fk_Quarto_Enfermeiro1_idx` (`Enfermeiro_idEnfermeiro` ASC),
  CONSTRAINT `fk_Quarto_Enfermeiro1`
    FOREIGN KEY (`Enfermeiro_idEnfermeiro`)
    REFERENCES `Hosp_Fund`.`Enfermeiro` (`idEnfermeiro`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Internacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Internacao` (
  `idInternacao` INT NOT NULL,
  `data_entrada` DATE NULL,
  `data_prev_alta` DATE NULL,
  `data_alta` DATE NULL,
  `procedimento` VARCHAR(45) NULL,
  PRIMARY KEY (`idInternacao`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Tipo_Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Tipo_Quarto` (
  `idTipoQuarto` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `valor_diaria` INT NULL,
  `Quarto_idQuarto` INT NOT NULL,
  PRIMARY KEY (`idTipoQuarto`),
  INDEX `fk_Tipo_Quarto_Quarto1_idx` (`Quarto_idQuarto` ASC),
  CONSTRAINT `fk_Tipo_Quarto_Quarto1`
    FOREIGN KEY (`Quarto_idQuarto`)
    REFERENCES `Hosp_Fund`.`Quarto` (`idQuarto`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Internacao_has_Enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Internacao_has_Enfermeiro` (
  `Internacao_idInternacao` INT NOT NULL,
  `Enfermeiro_idEnfermeiro` INT NOT NULL,
  PRIMARY KEY (`Internacao_idInternacao`, `Enfermeiro_idEnfermeiro`),
  INDEX `fk_Internacao_has_Enfermeiro_Enfermeiro1_idx` (`Enfermeiro_idEnfermeiro` ASC),
  INDEX `fk_Internacao_has_Enfermeiro_Internacao1_idx` (`Internacao_idInternacao` ASC),
  CONSTRAINT `fk_Internacao_has_Enfermeiro_Internacao1`
    FOREIGN KEY (`Internacao_idInternacao`)
    REFERENCES `Hosp_Fund`.`Internacao` (`idInternacao`),
  CONSTRAINT `fk_Internacao_has_Enfermeiro_Enfermeiro1`
    FOREIGN KEY (`Enfermeiro_idEnfermeiro`)
    REFERENCES `Hosp_Fund`.`Enfermeiro` (`idEnfermeiro`)
);

-- -----------------------------------------------------
-- Table `Hosp_Fund`.`Paciente_has_Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hosp_Fund`.`Paciente_has_Quarto` (
  `Paciente_idPaciente` INT NOT NULL,
  `Paciente_Convenio_idConvenio` INT NOT NULL,
  `Paciente_Medico_idMedico` INT NOT NULL,
  `Quarto_idQuarto` INT NOT NULL,
  PRIMARY KEY (`Paciente_idPaciente`, `Paciente_Convenio_idConvenio`, `Paciente_Medico_idMedico`, `Quarto_idQuarto`),
  INDEX `fk_Paciente_has_Quarto_Quarto1_idx` (`Quarto_idQuarto` ASC),
  INDEX `fk_Paciente_has_Quarto_Paciente1_idx` (`Paciente_idPaciente` ASC, `Paciente_Convenio_idConvenio` ASC, `Paciente_Medico_idMedico` ASC),
  CONSTRAINT `fk_Paciente_has_Quarto_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente`, `Paciente_Convenio_idConvenio`, `Paciente_Medico_idMedico`)
    REFERENCES `Hosp_Fund`.`Paciente` (`idPaciente`, `Convenio_idConvenio`, `Médico_idMédico`),
  CONSTRAINT `fk_Paciente_has_Quarto_Quarto1`
    FOREIGN KEY (`Quarto_idQuarto`)
    REFERENCES `Hosp_Fund`.`Quarto` (`idQuarto`)
);
