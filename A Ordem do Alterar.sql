-- Adiciona a coluna 'em_atividade' à tabela 'Médico'
ALTER TABLE `hosp_fund`.`Médico`
ADD COLUMN `em_atividade` VARCHAR(10) NOT NULL DEFAULT 'ativo';

-- Atualiza o status de dois médicos como desligados
UPDATE `hosp_fund`.`Médico`
SET `em_atividade` = 'desligado'
WHERE `idMédico` IN (1, 3, 4);
