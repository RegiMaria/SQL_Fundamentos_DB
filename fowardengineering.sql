-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8 ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `veiculo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `placa` VARCHAR(20) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`veiculo` (
  `idveiculo` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `ano` INT NOT NULL,
  `km` INT NOT NULL,
  `cambio` VARCHAR(45) NOT NULL,
  `combustivel` VARCHAR(45) NOT NULL,
  `observacao` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`idveiculo`),
  INDEX `FK_id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `FK_id_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `oficina`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`tecnico` (
  `idtecnico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  `data_contratacao` DATE NOT NULL,
  `salario` DECIMAL(8,2) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtecnico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`orcamento` (
  `idorcamento` INT NOT NULL AUTO_INCREMENT,
  `solicitante` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  `validade` VARCHAR(45) NOT NULL,
  `veiculo` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `tecnico_responsavel` VARCHAR(45) NOT NULL,
  `mao_de_obra` VARCHAR(45) NOT NULL,
  `id_cliente_orcamento` INT NOT NULL,
  `id_veiculo` INT NOT NULL,
  `id_tecnico` INT NOT NULL,
  PRIMARY KEY (`idorcamento`),
  INDEX `FK_id_veiculo_idx` (`id_veiculo` ASC) VISIBLE,
  INDEX `FK_id_tecnico_idx` (`id_tecnico` ASC) VISIBLE,
  INDEX `FK_id_cliente_orcamento_idx` (`id_cliente_orcamento` ASC) VISIBLE,
  CONSTRAINT `FK_id_cliente_orcamento`
    FOREIGN KEY (`id_cliente_orcamento`)
    REFERENCES `oficina`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_veiculo2`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `oficina`.`veiculo` (`idveiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_tecnico3`
    FOREIGN KEY (`id_tecnico`)
    REFERENCES `oficina`.`tecnico` (`idtecnico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`odem_de_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`odem_de_servico` (
  `idordem_servico` INT NOT NULL AUTO_INCREMENT,
  `solicitante` VARCHAR(45) NOT NULL,
  `data_entrada` DATE NOT NULL,
  `data_entrega` DATE NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `materiais` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `id_cliente_os` INT NOT NULL,
  `id_veiculo_os` INT NOT NULL,
  `id_tecnico_os` INT NOT NULL,
  PRIMARY KEY (`idordem_servico`),
  INDEX `FK_id_veiculo2_idx` (`id_veiculo_os` ASC) VISIBLE,
  INDEX `FK_id_tecnico_idx` (`id_tecnico_os` ASC) VISIBLE,
  INDEX `FK_id_cliente_os_idx` (`id_cliente_os` ASC) VISIBLE,
  CONSTRAINT `FK_id_cliente_os`
    FOREIGN KEY (`id_cliente_os`)
    REFERENCES `oficina`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_veiculo_os`
    FOREIGN KEY (`id_veiculo_os`)
    REFERENCES `oficina`.`veiculo` (`idveiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_tecnico_os`
    FOREIGN KEY (`id_tecnico_os`)
    REFERENCES `oficina`.`tecnico` (`idtecnico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `nome_peça` VARCHAR(45) NOT NULL,
  `codigo_peca` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `fornecedor` VARCHAR(45) NOT NULL,
  `preco_unitario` DECIMAL(8,2) NOT NULL,
  `quantidade` INT NOT NULL,
  `localizacao_estoque` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`orcamento_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`orcamento_produto` (
  `idorcamento_produto` INT NOT NULL AUTO_INCREMENT,
  `preco_unitario` VARCHAR(45) NOT NULL,
  `quantidade` VARCHAR(45) NOT NULL,
  `desconto` VARCHAR(45) NOT NULL,
  `total` DECIMAL(8,2) NOT NULL,
  `data` DATE NOT NULL,
  `observacoes` VARCHAR(45) NOT NULL,
  `id_orcamento` INT NOT NULL,
  `id_produto` INT NOT NULL,
  PRIMARY KEY (`idorcamento_produto`),
  INDEX `FK_id_orcamento1_idx` (`id_orcamento` ASC) VISIBLE,
  INDEX `FK_id_produto_idx` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `FK_id_orcamento1`
    FOREIGN KEY (`id_orcamento`)
    REFERENCES `oficina`.`orcamento` (`idorcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_produto`
    FOREIGN KEY (`id_produto`)
    REFERENCES `oficina`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
