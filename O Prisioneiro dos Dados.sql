-- Inserindo diferentes especialidades médicas
INSERT INTO `hosp_fund`.`Especialidade` (`Nome_Esp`)
VALUES ('Cardiologia'),
       ('Neurologia'),
       ('Ortopedia'),
       ('Pediatria'),
       ('Ginecologia'),
       ('Dermatologia'),
       ('Oftalmologia'),
       ('Psiquiatria'),
       ('Urologia'),
       ('Clínico Geral');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------       
-- Inserindo profissionais médicos com suas respectivas especialidades

INSERT INTO `hosp_fund`.`Médico` (`Nome`, `RG`, `CPF`, `CRM`, `Endereço`, `Email`, `Tipo_Medico`, `Especialidade_idEspecialidade`)
VALUES 
  ('Dr. Lucas Oliveira', '1234567', '12345678901', 'CRM123456', 'Rua das Acácias, 123', 'lucas.oliveira@emailhospital.com', 'Cardiologista', 1),
  ('Dra. Camila Santos', '2345678', '23456789012', 'CRM789012', 'Avenida dos Ipês, 456', 'camila.santos@emailhospital.com', 'Neurologista', 2),
  ('Dr. Gustavo Lima', '3456789', '34567890123', 'CRM234567', 'Praça da Liberdade, 789', 'gustavo.lima@emailhospital.com', 'Ortopedista', 3),
  ('Dra. Larissa Silva', '4567890', '45678901234', 'CRM890123', 'Alameda das Violetas, 012', 'larissa.silva@emailhospital.com', 'Pediatra', 4),
  ('Dr. Marcelo Costa', '5678901', '56789012345', 'CRM345678', 'Travessa das Magnólias, 345', 'marcelo.costa@emailhospital.com', 'Ginecologista', 5),
  ('Dra. Dra. Fernanda Pereira', '6789012', '67890123456', 'CRM901234', 'Rua dos Jasmim, 678', 'fernanda.pereira@emailhospital.com', 'Dermatologista', 6),
  ('Dr. Dr. Ricardo Almeida', '7890123', '78901234567', 'CRM456789', 'Avenida das Palmeiras, 901', 'ricardo.almeida@emailhospital.com', 'Oftalmologista', 7),
  ('Dr. Dra. Isabela Martins', '8901234', '89012345678', 'CRM012345', ',Praça do Bosque 123', 'isabela.martins@emailhospital.com', 'Psiquiatra', 8),
  ('Dr. Dr. Eduardo Oliveira', '9012345', '90123456789', 'CRM567890', 'Alameda das Orquídeas, 456', 'eduardo.oliveira@emailhospital.com', 'Urologista', 9),
  ('Dr. Dra. Juliana Rodrigues', '0123456', '01234567890', 'CRM987654', 'Rua das Azaleias, 789', 'juliana.rodrigues@emailhospital.com', 'Clínico Geral', 10);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Inserindo planos de saúde com períodos de carência

INSERT INTO `hosp_fund`.`Convenio` (`Nome`, `CNPJ`, `Carencia`)
VALUES 
  ('Convenio SaúdeMaster', '58224338000107', '2023-07-14'),
  ('Convenio ProteçãoVital', '56789012345678', '2024-02-08'),
  ('Convenio BemEstarTotal', '90123456789012', '2023-03-28'),
  ('Convenio VidaSaudável', '34567890123456', '2024-11-3');
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserindo enfermeiros

INSERT INTO `hosp_fund`.`Enfermeiro` (`Nome`, `CPF`, `CRE`)
VALUES 
('Enfermeiro João', '25741544010', 'CRE87654321'),
('Enfermeira Maria', '43733299078', 'CRE76543210'),
('Enfermeiro Pedro', '80850028094', 'CRE65432109'),
('Enfermeira Ana', '29854735001', 'CRE54321098'),
('Enfermeiro Lucas', '12289904090', 'CRE43210987'),
('Enfermeira Carla', '61685825095', 'CRE32109876'),
('Enfermeiro André', '51878498088', 'CRE21098765'),
('Enfermeiro Kleber', '46279864234', 'CRE29736403'),
('Enfermeira Beatriz', '12345678901', 'CRE34567890'),
('Enfermeiro Carlos', '98765432109', 'CRE09876543');

 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- Inserindo pacientes
 
 INSERT INTO `hosp_fund`.`Paciente` (`Nome_Pac`, `DataNasc`, `Endereco`, `Telefone`, `Email`, `CPF`, `RG`, `Convenio_idConvenio`, `Médico_idMédico`, `Enfermeiro_idEnfermeiro`)
VALUES 
  ('Ana Silva', '1990-05-15', 'Rua das Flores, 123', '123456789', 'ana.silva@email.com', '12345678901', '987654321', 1, 1, 1),
  ('Carlos Santos', '1985-08-22', 'Avenida dos Pássaros, 456', '987654321', 'carlos.santos@email.com', '23456789012', '876543210', 2, 2, 2),
  ('Juliana Oliveira', '1992-02-10', 'Travessa das Estrelas, 789', '567890123', 'juliana.oliveira@email.com', '34567890123', '765432109', 4, 3, 3),
  ('Roberto Lima', '1988-11-03', 'Alameda das Árvores, 567', '678901234', 'roberto.lima@email.com', '45678901234', '654321098', 1, 4, 4),
  ('Fernanda Pereira', '1995-04-18', 'Rua dos Riachos, 890', '789012345', 'fernanda.pereira@email.com', '56789012345', '543210987', 2, 5, 5),
  ('Lucas Costa', '1980-07-27', 'Avenida das Montanhas, 234', '890123456', 'lucas.costa@email.com', '67890123456', '432109876', 3, 6, 6),
  ('Mariana Rocha', '1998-09-30', 'Praça do Sol, 901', '901234567', 'mariana.rocha@email.com', '78901234567', '321098765', 4, 7, 7),
  ('Ricardo Almeida', '1983-12-12', 'Travessa das Fontes, 345', '012345678', 'ricardo.almeida@email.com', '89012345678', '210987654', 2, 8, 1),
  ('Camila Lima', '1991-06-25', 'Alameda das Pedras, 678', '123456789', 'camila.lima@email.com', '90123456789', '109876543', 3, 9, 2),
  ('Paulo Santos', '1987-03-05', 'Rua das Cachoeiras, 012', '234567890', 'paulo.santos@email.com', '01234567890', '098765432', 1, 10, 3),
  ('Patricia Oliveira', '1993-01-20', 'Avenida das Marés, 123', '345678901', 'patricia.oliveira@email.com', '23456789010', '987654321', 2, 3, 4),
  ('Gustavo Silva', '1986-10-08', 'Travessa das Colinas, 456', '456789012', 'gustavo.silva@email.com', '34567890123', '876543210', 3, 5, 5),
  ('Ana Rodrigues', '1996-07-15', 'Praça das Águas, 789', '567890123', 'ana.rodrigues@email.com', '45678901234', '765432109', 4, 8, 6),
  ('Marcelo Costa', '1989-04-22', 'Rua dos Bosques, 890', '678901234', 'marcelo.costa@email.com', '56789012345', '654321098', 2, 3, 7),
  ('Larissa Santos', '1994-02-28', 'Alameda das Flores, 234', '789012345', 'larissa.santos@email.com', '67890123456', '543210987', 3, 9, 3);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserindo consultas com seus respectivos valores

INSERT INTO `hosp_fund`.`Consulta` (`DataHora`, `Valor`)
VALUES 
  ('2016-03-15 10:00:00', 100),
  ('2017-05-22 14:30:00', 120),
  ('2015-08-10 09:45:00', 90),
  ('2018-12-05 11:20:00', 110),
  ('2019-02-28 15:10:00', 95),
  ('2016-09-14 08:30:00', 105),
  ('2020-07-03 13:45:00', 115),
  ('2015-11-20 10:30:00', 98),
  ('2018-04-12 12:15:00', 112),
  ('2019-10-08 16:00:00', 102),
  ('2015-02-15 11:45:00', 99),
  ('2017-06-30 14:00:00', 118),
  ('2018-08-25 09:15:00', 107),
  ('2019-12-18 10:45:00', 113),
  ('2016-04-05 15:30:00', 97),
  ('2020-09-22 13:00:00', 116),
  ('2015-12-10 12:45:00', 101),
  ('2018-02-28 14:15:00', 114),
  ('2019-06-14 16:30:00', 103),
  ('2017-11-05 10:15:00', 108);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserindo medicamentos com prescrições e instruções

INSERT INTO `hosp_fund`.`Medicamento` (`Nome`, `Quantidade`, `Instrucoes`, `Consulta_idConsulta`)
VALUES
  ('Paracetamol', 1, 'Tomar 1 comprimido a cada 6 horas', 1),
  ('Ibuprofeno', 1, 'Tomar 1 comprimido a cada 8 horas', 1),
  ('Amoxicilina', 1, 'Tomar 1 comprimido a cada 12 horas', 2),
  ('Dipirona', 1, 'Tomar 1 comprimido a cada 6 horas', 2),
  ('Omeprazol', 1, 'Tomar 1 comprimido antes das refeições', 3),
  ('Metformina', 1, 'Tomar 1 comprimido após as refeições', 3),
  ('Ciprofloxacino', 1, 'Tomar 1 comprimido a cada 12 horas', 4),
  ('Loratadina', 1, 'Tomar 1 comprimido por dia', 4),
  ('Atenolol', 1, 'Tomar 1 comprimido por dia', 5),
  ('Hidroclorotiazida', 1, 'Tomar 1 comprimido por dia', 5),
  ('Dipirona', 1, 'Tomar 1 comprimido a cada 6 horas', 6),
  ('Ibuprofeno', 1, 'Tomar 1 comprimido a cada 8 horas', 6),
  ('Paracetamol', 1, 'Tomar 1 comprimido a cada 6 horas', 7),
  ('Amoxicilina', 1, 'Tomar 1 comprimido a cada 12 horas', 7),
  ('Metformina', 1, 'Tomar 1 comprimido após as refeições', 8),
  ('Omeprazol', 1, 'Tomar 1 comprimido antes das refeições', 8),
  ('Loratadina', 1, 'Tomar 1 comprimido por dia', 9),
  ('Ciprofloxacino', 1, 'Tomar 1 comprimido a cada 12 horas', 9),
  ('Hidroclorotiazida', 1, 'Tomar 1 comprimido por dia', 10),
  ('Atenolol', 1, 'Tomar 1 comprimido por dia', 10);
  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- Criando uma tabela para associar médicos às suas especialidades
  
  CREATE TABLE IF NOT EXISTS `hosp_fund`.`Médico_has_Especialidade` (
  `Médico_idMédico` INT NOT NULL,
  `Especialidade_idEspecialidade` INT NOT NULL,
  PRIMARY KEY (`Médico_idMédico`, `Especialidade_idEspecialidade`),
  CONSTRAINT `fk_MédicoEspecialidade_Médico`
    FOREIGN KEY (`Médico_idMédico`)
    REFERENCES `hosp_fund`.`Médico` (`idMédico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MédicoEspecialidade_Especialidade`
    FOREIGN KEY (`Especialidade_idEspecialidade`)
    REFERENCES `hosp_fund`.`Especialidade` (`idEspecialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Criando uma tabela para associar internações a enfermeiros

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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Adicionando uma coluna de chave estrangeira à tabela Convenio

ALTER TABLE `hosp_fund`.`Convenio`
ADD COLUMN `Médico_idMédico` INT NULL,
ADD CONSTRAINT `fk_Convenio_Médico`
  FOREIGN KEY (`Médico_idMédico`)
  REFERENCES `hosp_fund`.`Médico` (`idMédico`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Adicionando colunas de chave estrangeira à tabela Internação
ALTER TABLE `hosp_fund`.`Internação`
ADD COLUMN `Médico_idMédico` INT NULL,
ADD COLUMN `Paciente_idPaciente` INT NULL;

-- Adicionando restrições de chave estrangeira
ALTER TABLE `hosp_fund`.`Internação`
ADD CONSTRAINT `fk_Internação_Médico`
  FOREIGN KEY (`Médico_idMédico`)
  REFERENCES `hosp_fund`.`Médico` (`idMédico`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `hosp_fund`.`Internação`
ADD CONSTRAINT `fk_Internação_Paciente`
  FOREIGN KEY (`Paciente_idPaciente`)
  REFERENCES `hosp_fund`.`Paciente` (`idPaciente`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserindo diferentes tipos de quartos com suas respectivas diárias

INSERT INTO `hosp_fund`.`Quarto` (`Num`, `Tipo`, `Enfermeiro_idEnfermeiro`, `valor_diária`) VALUES
(101, 'Apartamento', 1, 150.00),
(201, 'Quarto Duplo', 2, 100.00),
(301, 'Enfermaria', 3, 75.00);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Inserindo internações com informações relacionadas

INSERT INTO `hosp_fund`.`Internação` (`data_entrada`, `data_prev_alta`, `data_alta`, `procedimento`, `Médico_idMédico`, `Paciente_idPaciente`)
VALUES
('2018-03-15', '2018-03-20', '2018-03-20', 'Cirurgia Cardíaca','1','1'),
('2019-05-10', '2019-05-15', '2019-05-15', 'Tratamento Ortopédico','3','2'),
('2020-07-08', '2020-07-15', '2020-07-15', 'Internação Clínica','10','3'),
('2016-02-22', '2016-02-28', '2016-02-28', 'Exames Laboratoriais','10','4'),
('2017-11-12', '2017-11-18', '2017-11-18', 'Cirurgia Abdominal','1','5'),
('2021-09-05', '2021-09-10', '2021-09-10', 'Tratamento Respiratório','10','6'),
('2015-08-03', '2015-08-10', '2015-08-10', 'Internação Pediátrica','4','7');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Associando enfermeiros a internações

INSERT INTO `hosp_fund`.`Internação_has_enfermeiro` (`Internação_idInternação`, `Enfermeiro_idEnfermeiro`)
VALUES 
('1', '1'), 
('2', '3'), 
('3', '4'), 
('4', '6'), 
('5', '2'), 
('6', '4'), 
('7', '7');

