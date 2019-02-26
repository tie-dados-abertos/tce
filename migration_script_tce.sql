-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: tcepe
-- Source Schemata: tcepe
-- Created: Tue Feb 12 13:52:12 2019
-- Workbench Version: 8.0.13
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema tcepe
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `tcepe` ;
CREATE SCHEMA IF NOT EXISTS `tcepe` ;

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_ObrasDadosAuditoria
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_ObrasDadosAuditoria` (
  `Obra` INT NOT NULL,
  `DataUltimaAuditoria` DATETIME NULL,
  `ValorInicialContratado` DECIMAL(13,2) NULL,
  `ValorAditado` DECIMAL(13,2) NULL,
  `DespesaPaga` DECIMAL(13,2) NULL,
  `ValorTotal` DECIMAL(14,2) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.CARGO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`CARGO` (
  `ID_CARGO` INT NOT NULL,
  `DT_ANOREFERENCIA` INT NOT NULL,
  `NU_CARGAHORARIA` INT NOT NULL,
  `DT_MESREFERENCIA` INT NOT NULL,
  `NO_CARGO` VARCHAR(255) NOT NULL,
  `NU_CODIGO` VARCHAR(30) NOT NULL,
  `ID_PRESTACAO_CONTA` BIGINT NOT NULL,
  `ID_TIPOESCOLARIDADE` INT NOT NULL,
  `ID_UGESTORA` BIGINT NOT NULL,
  `DE_TIPOESCOLARIDADE` VARCHAR(50) NULL,
  `DE_UGGESTORA` VARCHAR(255) NULL,
  `CBOCodigo` VARCHAR(6) NULL,
  `LeiCriacao` VARCHAR(255) NULL,
  PRIMARY KEY (`ID_CARGO`, `DT_ANOREFERENCIA`),
  INDEX `IX_CARGO_DE_UGGESTORA` (`DE_UGGESTORA` ASC, `ID_CARGO` ASC, `DT_ANOREFERENCIA` ASC, `NU_CARGAHORARIA` ASC, `DT_MESREFERENCIA` ASC, `NO_CARGO` ASC, `DE_TIPOESCOLARIDADE` ASC),
  INDEX `IX_CARGO_NU_CARGAHORARIA` (`NU_CARGAHORARIA` ASC, `ID_CARGO` ASC, `DT_ANOREFERENCIA` ASC, `DT_MESREFERENCIA` ASC, `NO_CARGO` ASC, `DE_TIPOESCOLARIDADE` ASC, `DE_UGGESTORA` ASC));

-- ----------------------------------------------------------------------------
-- Table tcepe.LOTACAO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`LOTACAO` (
  `ID_LOTACAO` INT NOT NULL,
  `DT_ANOREFERENCIA` SMALLINT NOT NULL,
  `NU_CODIGO` VARCHAR(15) NOT NULL,
  `DT_MESREFERENCIA` SMALLINT NOT NULL,
  `ID_PRESTACAO_CONTA` BIGINT NOT NULL,
  `DE_LOTACAO` VARCHAR(50) NOT NULL,
  `ID_UGESTORA` BIGINT NOT NULL,
  `ID_UGESTORAADM` INT NOT NULL,
  `DE_UGGESTORA` VARCHAR(200) NULL,
  `DE_UGGESTORAADM` VARCHAR(200) NULL,
  PRIMARY KEY (`ID_LOTACAO`, `DT_ANOREFERENCIA`, `DT_MESREFERENCIA`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TermoAditivo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TermoAditivo` (
  `UnidadeGestora` VARCHAR(200) NOT NULL,
  `Esfera` CHAR(2) NOT NULL,
  `Municipio` VARCHAR(40) NOT NULL,
  `NumeroTermoAditivo` VARCHAR(10) NULL,
  `AnoTermoAditivo` INT NOT NULL,
  `Vigencia` VARCHAR(63) NULL,
  `NumeroContrato` VARCHAR(10) NULL,
  `AnoContrato` INT NOT NULL,
  `CPF_CNPJ` VARCHAR(18) NOT NULL,
  `TipoDocumento` VARCHAR(5) NULL,
  `NumeroDocumento` VARCHAR(18) NULL,
  `NumeroDocumentoAjustado` VARCHAR(30) NULL,
  `RazaoSocial` VARCHAR(255) NOT NULL,
  `ObjetoAditivo` VARCHAR(106) NOT NULL,
  `JustificativaTermoAditivo` VARCHAR(1000) NULL,
  `ValorAcrescimo` DECIMAL(26,4) NULL,
  `ValorReducao` DECIMAL(26,4) NULL,
  `ValorTermoAditivo` DECIMAL(26,4) NULL,
  `EstagioContrato` VARCHAR(15) NOT NULL,
  `SituacaoContrato` VARCHAR(50) NOT NULL,
  `SiglaUG` VARCHAR(20) NULL,
  `CodigoUG` INT NULL,
  `CodigoEfiscoUG` CHAR(6) NULL,
  `CodigoAudinUG` VARCHAR(20) NULL,
  `LinkArquivo` VARCHAR(500) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.Contratos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`Contratos` (
  `UnidadeGestora` VARCHAR(200) NOT NULL,
  `Esfera` CHAR(2) NOT NULL,
  `Municipio` VARCHAR(40) NOT NULL,
  `NumeroContrato` VARCHAR(10) NULL,
  `AnoContrato` INT NOT NULL,
  `TipoProcesso` VARCHAR(100) NULL,
  `NumeroProcesso` INT NULL,
  `AnoProcesso` INT NULL,
  `CPF_CNPJ` VARCHAR(18) NOT NULL,
  `TipoDocumento` VARCHAR(5) NULL,
  `NumeroDocumento` VARCHAR(20) NULL,
  `NumeroDocumentoAjustado` VARCHAR(20) NULL,
  `RazaoSocial` VARCHAR(255) NOT NULL,
  `Vigencia` VARCHAR(63) NULL,
  `Objeto` VARCHAR(106) NOT NULL,
  `ValorContrato` DECIMAL(19,4) NULL,
  `EstagioContrato` VARCHAR(15) NOT NULL,
  `SituacaoContrato` VARCHAR(50) NOT NULL,
  `SiglaUG` VARCHAR(20) NULL,
  `CodigoUG` INT NULL,
  `CodigoEfiscoUG` CHAR(6) NULL,
  `CodigoAudinUG` VARCHAR(20) NULL,
  `PortariaComissaoLicitacao` VARCHAR(100) NULL,
  `LinkArquivo` VARCHAR(500) NULL,
  `UnidadeOrcamentaria` VARCHAR(200) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.PORTAL_LISTASERVIDORES
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`PORTAL_LISTASERVIDORES` (
  `ID_HISTORICOFUNCIONAL` INT NOT NULL,
  `ENTRADA_ID_TIPOMOVIMENTACAO` INT NULL,
  `DT_MOVIMENTACAO` DATETIME NOT NULL,
  `SAIDA_ID_TIPOMOVIMENTACAO` INT NULL,
  `ID_SERVIDOR` INT NOT NULL,
  `DE_ESFERA` VARCHAR(30) NULL,
  `UG_NATUREZA_ORGAO` VARCHAR(50) NULL,
  `DT_ANOREFERENCIA` SMALLINT NOT NULL,
  `DT_MESREFERENCIA` SMALLINT NOT NULL,
  `MATRICULA` VARCHAR(15) NOT NULL,
  `NU_CPF` VARCHAR(69) NULL,
  `NO_SERVIDOR` VARCHAR(80) NOT NULL,
  `DE_UGGESTORA` VARCHAR(200) NOT NULL,
  `DE_TIPOVINCULO` VARCHAR(50) NOT NULL,
  `DE_TIPOESCOLARIDADE` VARCHAR(40) NOT NULL,
  `NO_CARGO` VARCHAR(200) NOT NULL,
  `DE_LOTACAO` VARCHAR(50) NOT NULL,
  `DT_ENTRADA` DATETIME NOT NULL,
  `DT_SAIDA` DATETIME NULL,
  `DE_TIPOATOPESSOAL` VARCHAR(100) NOT NULL,
  `NOME_MUNICIPIO` VARCHAR(100) NOT NULL,
  `VINCULOS` INT NULL,
  INDEX `IX_PORTAL_ListaServidores` (`NU_CPF` ASC));

-- ----------------------------------------------------------------------------
-- Table tcepe.PORTAL_MOVIMENTACAOPESSOAL
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`PORTAL_MOVIMENTACAOPESSOAL` (
  `ID_HISTORICOFUNCIONAL` INT NOT NULL,
  `DT_ANOREFERENCIA` SMALLINT NOT NULL,
  `DT_MOVIMENTACAO` DATETIME NOT NULL,
  `DT_ANOMOVIMENTACAO` INT NULL,
  `DT_MESMOVIMENTACAO` INT NULL,
  `DT_MESREFERENCIA` SMALLINT NOT NULL,
  `INGRESSO` INT NOT NULL,
  `AFASTAMENTO` INT NOT NULL,
  `AFASTAMENTO_SUJEITO_REGISTRO_TCE` INT NOT NULL,
  `NU_TIPOATOPESSOAL` INT NOT NULL,
  `ID_SERVIDOR` INT NULL,
  `MATRICULA` VARCHAR(15) NOT NULL,
  `NU_CPF` VARCHAR(69) NULL,
  `NO_SERVIDOR` VARCHAR(80) NOT NULL,
  `DE_ESFERA` VARCHAR(30) NULL,
  `UG_NATUREZA_ORGAO` VARCHAR(50) NULL,
  `NOME_MUNICIPIO` VARCHAR(100) NOT NULL,
  `DE_UGGESTORA` VARCHAR(200) NOT NULL,
  `DE_TIPOMOTIVOINATIVACAO` VARCHAR(40) NULL,
  `DE_TIPOREGIMEPREVIDENCIARIO` VARCHAR(40) NOT NULL,
  `DE_TIPOREGIMETRABALHO` VARCHAR(40) NOT NULL,
  `DE_TIPOATOPESSOAL` VARCHAR(100) NOT NULL,
  `NO_CARGO` VARCHAR(200) NOT NULL,
  `DT_ANOREFERENCIA_CARGO` SMALLINT NOT NULL,
  `DT_MESREFERENCIA_CARGO` SMALLINT NOT NULL,
  `DE_LOTACAO` VARCHAR(50) NOT NULL,
  `DE_TIPOVINCULO` VARCHAR(50) NOT NULL,
  `DE_TIPOESCOLARIDADE` VARCHAR(40) NOT NULL,
  `ID_TIPOMOVIMENTACAO` INT NOT NULL,
  `DE_TIPOMOVIMENTACAO` VARCHAR(20) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_ATOPESSOAL
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_ATOPESSOAL` (
  `ID_TIPOATOPESSOAL` INT NOT NULL,
  `DE_TIPOATOPESSOAL` VARCHAR(100) NOT NULL,
  `NU_TIPOATOPESSOAL` INT NOT NULL,
  `ID_TIPOMOVIMENTACAO` INT NOT NULL,
  `DT_ANOREFERENCIA` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOATOPESSOAL`, `DT_ANOREFERENCIA`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_ESCOLARIDADE
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_ESCOLARIDADE` (
  `ID_TIPOESCOLARIDADE` INT NOT NULL,
  `DE_TIPOESCOLARIDADE` VARCHAR(40) NOT NULL,
  `NU_TIPOESCOLARIDADE` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOESCOLARIDADE`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_FOLHA
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_FOLHA` (
  `ID_TIPOFOLHA` INT NOT NULL,
  `DE_TIPOFOLHA` VARCHAR(40) NOT NULL,
  `NU_TIPOFOLHA` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOFOLHA`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_FONTERECURSO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_FONTERECURSO` (
  `ID_TIPOFONTERECURSO` INT NOT NULL,
  `DE_TIPOFONTERECURSO` VARCHAR(40) NOT NULL,
  `NU_TIPOFONTERECURSO` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOFONTERECURSO`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_MOTIVOINATIVACAO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_MOTIVOINATIVACAO` (
  `ID_TIPOMOTIVOINATIVACAO` INT NOT NULL,
  `DE_TIPOMOTIVOINATIVACAO` VARCHAR(40) NOT NULL,
  `NU_TIPOMOTIVOINATIVACAO` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOMOTIVOINATIVACAO`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_MOVIMENTACAO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_MOVIMENTACAO` (
  `ID_TIPOMOVIMENTACAO` INT NOT NULL,
  `DE_TIPOMOVIMENTACAO` VARCHAR(20) NOT NULL,
  `NU_TIPOMOVIMENTACAO` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOMOVIMENTACAO`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_REGIMEPREVIDENCIARIO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_REGIMEPREVIDENCIARIO` (
  `ID_TIPOREGIMEPREVIDENCIARIO` INT NOT NULL,
  `DE_TIPOREGIMEPREVIDENCIARIO` VARCHAR(40) NOT NULL,
  `NU_TIPOREGIMEPREVIDENCIARIO` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOREGIMEPREVIDENCIARIO`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_REGIMETRABALHO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_REGIMETRABALHO` (
  `ID_TIPOREGIMETRABALHO` INT NOT NULL,
  `DE_TIPOREGIMETRABALHO` VARCHAR(40) NOT NULL,
  `NU_TIPOREGIMETRABALHO` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOREGIMETRABALHO`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_SITUACAOFUNCIONAL
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_SITUACAOFUNCIONAL` (
  `ID_TIPOSITUACAOFUNCIONAL` INT NOT NULL,
  `DE_TIPOSITUACAOFUNCIONAL` VARCHAR(40) NOT NULL,
  `NU_TIPOSITUACAOFUNCIONAL` INT NOT NULL,
  PRIMARY KEY (`ID_TIPOSITUACAOFUNCIONAL`));

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_VINCULO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_VINCULO` (
  `ID_TIPOVINCULO` INT NOT NULL,
  `DE_TIPOVINCULO` VARCHAR(50) NOT NULL,
  `ST_VENCIMENTOBASE` TINYINT UNSIGNED NOT NULL,
  `NU_TIPOVINCULO` INT NOT NULL,
  `ID_TIPOSITUACAOFUNCIONAL` INT NULL,
  `de_TIPOSITUACAOFUNCIONAL` VARCHAR(50) NULL,
  PRIMARY KEY (`ID_TIPOVINCULO`));

-- ----------------------------------------------------------------------------
-- Table tcepe.MUNICIPIO
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`MUNICIPIO` (
  `CODIGO` CHAR(4) NOT NULL,
  `NOME` VARCHAR(40) NOT NULL,
  `CUNIFED` CHAR(2) NOT NULL,
  `CodigoSagres` INT NOT NULL,
  `CodigoIBGE` INT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.UG
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`UG` (
  `ID_UNIDADE_GESTORA` INT NOT NULL,
  `CODIGOTCE` VARCHAR(6) NULL,
  `ESFERA` VARCHAR(10) NULL,
  `CODIGOMUNICIPIO` CHAR(4) NOT NULL,
  `MUNICIPIO` VARCHAR(40) NOT NULL,
  `ORGAO` VARCHAR(200) NOT NULL,
  `SIGLA` VARCHAR(20) NULL,
  `SITUACAO` VARCHAR(40) NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `PODER` VARCHAR(30) NULL,
  `UNIFED` CHAR(2) NOT NULL,
  `TipoPessoaJuridicaPublica` VARCHAR(25) NULL,
  `NATUREZA` VARCHAR(50) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.sysdiagrams
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`sysdiagrams` (
  `name` VARCHAR(160) NOT NULL,
  `principal_id` INT NOT NULL,
  `diagram_id` INT NOT NULL AUTO_INCREMENT,
  `version` INT NULL,
  `definition` LONGBLOB NULL,
  PRIMARY KEY (`diagram_id`),
  UNIQUE INDEX `UK_principal_name` (`principal_id` ASC, `name` ASC));

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_Despesas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_Despesas` (
  `ID_EMPENHO` CHAR(12) NOT NULL,
  `ANO_REFERENCIA` INT NOT NULL,
  `ID_UNIDADE_GESTORA` INT NULL,
  `NUMERO_EMPENHO` VARCHAR(8) NULL,
  `HISTORICO` VARCHAR(510) NULL,
  `CODIGO_UNIDADE_ORCAMENTARIA` INT NULL,
  `UNIDADE_ORCAMENTARIA` VARCHAR(50) NULL,
  `CODIGO_FONTE_RECURSO` INT NULL,
  `FONTE_RECURSO` VARCHAR(80) NULL,
  `CODIGO_FUNCAO` BIGINT NULL,
  `FUNCAO` VARCHAR(25) NULL,
  `CODIGO_SUBFUNCAO` BIGINT NULL,
  `SUBFUNCAO` VARCHAR(255) NULL,
  `CODIGO_PROGRAMA` INT NULL,
  `PROGRAMA` VARCHAR(70) NULL,
  `CODIGO_ACAO` INT NULL,
  `ACAO` VARCHAR(70) NULL,
  `CODIGO_CATEGORIA` BIGINT NULL,
  `CATEGORIA` VARCHAR(25) NULL,
  `CODIGO_NATUREZA` BIGINT NULL,
  `NATUREZA` VARCHAR(30) NULL,
  `CODIGO_MODALIDADE` BIGINT NULL,
  `MODALIDADE` VARCHAR(160) NULL,
  `CODIGO_ELEMENTO_DESPESA` BIGINT NULL,
  `ELEMENTO_DESPESA` VARCHAR(70) NULL,
  `CODIGO_SUBELEMENTO` BIGINT NULL,
  `SUBELEMENTO_DESPESA` VARCHAR(255) NULL,
  `CPF_CNPJ` VARCHAR(14) NULL,
  `NOME_FORNECEDOR` VARCHAR(150) NULL,
  `VALOR_EMPENHADO` DECIMAL(38,2) NULL,
  `VALOR_LIQUIDADO` DECIMAL(38,2) NULL,
  `VALOR_PAGO` DECIMAL(38,2) NULL,
  `DATA_EMPENHO` DATETIME NULL,
  `ESFERA` VARCHAR(1) NULL,
  `CODIGO_MUNICIPIO` CHAR(4) NULL,
  `TIPO_CREDOR` BIGINT NULL,
  `NOME_UNIDADE_GESTORA` VARCHAR(500) NULL,
  `ID_UNIDADE_GESTORA_ORIG` BIGINT NULL,
  `CODIGO_TIPO_EMPENHO` BIGINT NULL,
  `TIPO_EMPENHO` VARCHAR(20) NULL,
  `CODIGO_TIPO_ACAO` BIGINT NULL,
  `TIPO_ACAO` VARCHAR(50) NULL,
  `CODIGO_TIPO_MODALIDADE_LICITACAO` BIGINT NULL,
  `TIPO_MODALIDADE_LICITACAO` VARCHAR(40) NULL,
  `NUMERO_ANO_PROCESSO_LICITATORIO` VARCHAR(15) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_DespesasEstaduais
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_DespesasEstaduais` (
  `ID_EMPENHO` CHAR(12) NOT NULL,
  `ANO_REFERENCIA` CHAR(4) NOT NULL,
  `ID_UNIDADE_GESTORA` INT NULL,
  `NUMERO_EMPENHO` CHAR(12) NOT NULL,
  `HISTORICO` VARCHAR(8000) NULL,
  `CODIGO_UNIDADE_ORCAMENTARIA` CHAR(5) NULL,
  `UNIDADE_ORCAMENTARIA` VARCHAR(200) NULL,
  `CODIGO_FONTE_RECURSO` CHAR(10) NULL,
  `FONTE_RECURSO` VARCHAR(100) NULL,
  `CODIGO_FUNCAO` CHAR(2) NULL,
  `FUNCAO` VARCHAR(100) NULL,
  `CODIGO_SUBFUNCAO` CHAR(3) NULL,
  `SUBFUNCAO` VARCHAR(100) NULL,
  `CODIGO_PROGRAMA` CHAR(4) NULL,
  `PROGRAMA` VARCHAR(500) NULL,
  `CODIGO_ACAO` CHAR(17) NULL,
  `ACAO` VARCHAR(200) NULL,
  `CODIGO_CATEGORIA` CHAR(8) NULL,
  `CATEGORIA` VARCHAR(200) NULL,
  `CODIGO_NATUREZA` CHAR(8) NULL,
  `NATUREZA` VARCHAR(200) NULL,
  `CODIGO_MODALIDADE` CHAR(8) NULL,
  `MODALIDADE` VARCHAR(200) NULL,
  `CODIGO_ELEMENTO_DESPESA` CHAR(8) NULL,
  `ELEMENTO_DESPESA` VARCHAR(200) NULL,
  `CODIGO_SUBELEMENTO` INT NULL,
  `SUBELEMENTO_DESPESA` INT NULL,
  `CPF_CNPJ` CHAR(14) NULL,
  `NOME_FORNECEDOR` VARCHAR(200) NULL,
  `VALOR_EMPENHADO` DECIMAL(17,2) NULL,
  `VALOR_LIQUIDADO` DECIMAL(17,2) NULL,
  `VALOR_PAGO` DECIMAL(38,2) NULL,
  `DATA_EMPENHO` DATETIME NOT NULL,
  `NOME_UNIDADE_GESTORA` VARCHAR(100) NULL,
  `TIPO_CREDOR` CHAR(1) NULL,
  `ESFERA` VARCHAR(1) NULL,
  `CODIGO_MUNICIPIO` CHAR(4) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_EmpenhoLiquidacao
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_EmpenhoLiquidacao` (
  `ID_LIQUIDACAO` VARCHAR(12) NULL,
  `TIPO` VARCHAR(50) NOT NULL,
  `DATA` DATETIME NULL,
  `NUMERO` VARCHAR(12) NULL,
  `VALOR` DECIMAL(23,2) NULL,
  `ID_EMPENHO` VARCHAR(12) NULL,
  `NUMERO_EMPENHO` VARCHAR(12) NULL,
  `ANO_REFERENCIA` INT NOT NULL,
  `ID_UNIDADE_GESTORA` INT NULL,
  `ESFERA` VARCHAR(1) NOT NULL,
  INDEX `IX_SCA_EmpenhoLiquidacao_Empenho_UG` (`NUMERO_EMPENHO` ASC, `ID_UNIDADE_GESTORA` ASC),
  INDEX `IX_SCAEmpenhoLiquidacao_ID_EMPENHO_UG_ANO` (`ID_EMPENHO` ASC, `ID_UNIDADE_GESTORA` ASC, `ANO_REFERENCIA` ASC));

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_EmpenhoPagamento
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_EmpenhoPagamento` (
  `ID_PAGAMENTO` VARCHAR(12) NULL,
  `TIPO` VARCHAR(50) NOT NULL,
  `DATA` DATETIME NULL,
  `VALOR` DECIMAL(23,2) NULL,
  `NUMERO_BANCO` VARCHAR(3) NULL,
  `NUMERO_AGENCIA` VARCHAR(6) NULL,
  `NUMERO_CONTA` VARCHAR(12) NULL,
  `NUMERO_CHEQUE` VARCHAR(6) NULL,
  `ID_EMPENHO` VARCHAR(12) NULL,
  `NUMERO_EMPENHO` VARCHAR(12) NULL,
  `ANO_REFERENCIA` INT NOT NULL,
  `ID_UNIDADE_GESTORA` INT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_EmpenhoResumo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_EmpenhoResumo` (
  `ID` VARCHAR(12) NULL,
  `TIPO` VARCHAR(18) NOT NULL,
  `DATA` DATETIME NOT NULL,
  `VALOR` DECIMAL(23,2) NULL,
  `ID_EMPENHO` VARCHAR(12) NULL,
  `NUMERO_EMPENHO` VARCHAR(12) NULL,
  `ANO_REFERENCIA` INT NOT NULL,
  `ID_UNIDADE_GESTORA` INT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_LicitacoesDetalhes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_LicitacoesDetalhes` (
  `NumeroDocumentoAjustado` CHAR(30) NULL,
  `RazaoSocial` VARCHAR(255) NULL,
  `codigoPL` INT NULL,
  `codigoUG` INT NULL,
  `UG` VARCHAR(200) NULL,
  `NomeNatureza` VARCHAR(25) NULL,
  `NomeModalidade` VARCHAR(100) NULL,
  `NumeroModalidade` INT NULL,
  `AnoModalidade` INT NULL,
  `DescricaoObjeto` VARCHAR(100) NULL,
  `EspecificacaoObjeto` VARCHAR(2000) NULL,
  `SituacaoLicitacao` VARCHAR(50) NULL,
  `EstagioLicitacao` VARCHAR(60) NULL,
  `DataPublicacaoHomologacao` DATETIME NULL,
  `TotalAdjudicadoLicitacao` DECIMAL(19,4) NULL,
  `TotalAdjudicadoLicitante` DECIMAL(19,4) NULL,
  `ResultadoHabilitacao` VARCHAR(50) NULL,
  `Adjudicada` VARCHAR(14) NOT NULL,
  `QtdeLicitantes` INT NULL,
  `CodigoModalidade` INT NULL,
  `NumeroProcesso` INT NULL,
  `AnoProcesso` INT NULL,
  `DataEmissaoEdital` DATETIME NULL,
  `DataPublicacaoHabilitacao` DATETIME NULL,
  `DataPublicacaoJulgamento` DATETIME NULL,
  `CaracteristicaObjeto` VARCHAR(60) NULL,
  `ObjetoConformeEdital` VARCHAR(1000) NULL,
  `LinkArquivo` VARCHAR(500) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_ParticipantesComuns
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_ParticipantesComuns` (
  `Id` BIGINT NULL,
  `NumeroDocumentoAjustado` CHAR(30) NULL,
  `Total` INT NULL,
  `plCodigo` INT NULL,
  `RazaoSocial` VARCHAR(255) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.TIPO_CREDOR
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`TIPO_CREDOR` (
  `ID_TIPO_CREDOR` INT NOT NULL,
  `NUMERO` INT NOT NULL,
  `DESCRICAO` VARCHAR(40) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_Pessoa
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_Pessoa` (
  `CPFCNPJ` CHAR(14) NOT NULL,
  `Nome` VARCHAR(255) NULL,
  `TipoCredor` INT NOT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_Receitas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_Receitas` (
  `ID_RECEITA_ORCAMENTARIA` INT NOT NULL,
  `ID_UNIDADE_GESTORA` INT NOT NULL,
  `NUMERO_RECEITA_ORCAMENTARIA_UG` VARCHAR(11) NULL,
  `DEDUCAO_RECEITA` INT NOT NULL,
  `CATEGORIA_RECEITA` VARCHAR(100) NULL,
  `ORIGEM_RECEITA` VARCHAR(100) NULL,
  `ESPECIE_RECEITA` VARCHAR(255) NULL,
  `DESCRICAO` VARCHAR(255) NULL,
  `ANO_REFERENCIA` INT NOT NULL,
  `VALOR_LANCAMENTO` DECIMAL(23,2) NULL,
  `ESFERA` VARCHAR(1) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_ReceitasEstaduais
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_ReceitasEstaduais` (
  `ID_RECEITA_ORCAMENTARIA` INT NULL,
  `ID_UNIDADE_GESTORA` INT NULL,
  `NUMERO_RECEITA_ORCAMENTARIA_UG` INT NULL,
  `DEDUCAO_RECEITA` INT NULL,
  `CATEGORIA_RECEITA` VARCHAR(100) NULL,
  `ORIGEM_RECEITA` VARCHAR(100) NULL,
  `ESPECIE_RECEITA` VARCHAR(100) NULL,
  `DESCRICAO` VARCHAR(200) NULL,
  `ANO_REFERENCIA` INT NOT NULL,
  `MES` INT NOT NULL,
  `VALOR_PREVISTO` INT NOT NULL,
  `VALOR_LANCAMENTO` DECIMAL(18,2) NULL,
  `ESFERA` VARCHAR(1) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_ReceitasPrevistas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_ReceitasPrevistas` (
  `ID_RECEITA_ORCAMENTARIA` INT NULL,
  `ID_UNIDADE_GESTORA` INT NOT NULL,
  `ANO_REFERENCIA` INT NOT NULL,
  `Categoria` VARCHAR(100) NULL,
  `Origem` VARCHAR(100) NULL,
  `Especie` VARCHAR(100) NULL,
  `VALOR_PREVISTO` DECIMAL(23,2) NULL,
  `ESFERA` CHAR(1) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_UJsEstaduais
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_UJsEstaduais` (
  `ID_UNIDADEGESTORA` CHAR(6) NOT NULL,
  `NOME_UNIDADE_GESTORA` VARCHAR(200) NOT NULL,
  `CODIGO_TCE` INT NULL,
  PRIMARY KEY (`ID_UNIDADEGESTORA`));

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_UJsMunicipais
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_UJsMunicipais` (
  `ID_UNIDADE_GESTORA` INT NOT NULL,
  `NOME_UNIDADE_GESTORA` VARCHAR(200) NOT NULL,
  `CODIGO_MUNICIPIO_UNIDADE_GESTORA` CHAR(4) NOT NULL,
  `NATUREZA_ORGAO` INT NOT NULL,
  `EXERCICIO` INT NOT NULL,
  `ULTIMA_ATUALIZACAO` DATETIME NULL,
  PRIMARY KEY (`ID_UNIDADE_GESTORA`, `EXERCICIO`));

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_Doacoes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_Doacoes` (
  `Id` INT NOT NULL,
  `Municipio` VARCHAR(40) NULL,
  `Destino` VARCHAR(513) CHARACTER SET 'utf8mb4' NULL,
  `Partido` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL,
  `CPFCNPJ` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL,
  `NomeDoador` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL,
  `SetorEconomicoDoador` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL,
  `DataDoacao` DATETIME NULL,
  `ValorDoacao` FLOAT(24,0) NULL,
  `Ano` INT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_TransporteEscolar
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_TransporteEscolar` (
  `Codigo` INT NOT NULL,
  `Municipio` VARCHAR(40) NULL,
  `UG` VARCHAR(200) NULL,
  `Titulo` VARCHAR(500) NULL,
  `DataUltimaAuditoria` DATETIME NULL,
  `CodigoMunicipio` CHAR(4) NULL,
  `CodigoUG` INT NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.INET_ContasPrefeito
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`INET_ContasPrefeito` (
  `Processo` CHAR(8) NULL,
  `Prefeito` VARCHAR(80) NULL,
  `Municipio` CHAR(4) NOT NULL,
  `NomeMunicipio` VARCHAR(40) NOT NULL,
  `Ano` VARCHAR(4) NOT NULL,
  `Descricao` VARCHAR(60) NULL,
  `ParecerTCE` VARCHAR(50) NULL,
  `StatusCamara` VARCHAR(50) NULL,
  `Descricao2` VARCHAR(60) NULL,
  `ParecerTCE2` VARCHAR(50) NULL,
  `StatusCamara2` VARCHAR(50) NULL,
  `Inspetoria` CHAR(6) NULL,
  `CodigoTipoParecer` INT NOT NULL,
  `CodigoTipoParecer2` INT NULL,
  `SiglaTipoParecer` VARCHAR(6) NOT NULL,
  `SiglaTipoParecer2` VARCHAR(6) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_Obras
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_Obras` (
  `Codigo` INT NOT NULL,
  `Municipio` VARCHAR(40) NULL,
  `UG` VARCHAR(200) NULL,
  `Titulo` VARCHAR(500) NULL,
  `DataUltimaAuditoria` DATETIME NULL,
  `CodigoMunicipio` CHAR(4) NULL,
  `CodigoUG` INT NULL,
  `LocalExecucao` VARCHAR(300) NULL,
  `DataInicial` DATETIME NULL,
  `AnoInicial` INT NULL,
  `Prazo` INT NULL,
  `PrazoAditado` INT NULL,
  `PrazoParalizacao` INT NULL,
  `NaturezaIntervencao` VARCHAR(100) NULL);

-- ----------------------------------------------------------------------------
-- Table tcepe.SCA_ObrasDadosContratacao
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcepe`.`SCA_ObrasDadosContratacao` (
  `Obra` INT NOT NULL,
  `Pessoa` VARCHAR(150) NULL,
  `Logradouro` VARCHAR(100) NULL,
  `Numero` VARCHAR(40) NULL,
  `Complemento` VARCHAR(150) NULL,
  `Bairro` VARCHAR(40) NULL,
  `CEP` VARCHAR(20) NULL,
  `CPFCNPJ` VARCHAR(14) NULL);

-- ----------------------------------------------------------------------------
-- Routine tcepe.sp_upgraddiagrams
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- 

-- 	CREATE PROCEDURE dbo.sp_upgraddiagrams

-- 	AS

-- 	BEGIN

-- 		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL

-- 			return 0;

-- 	

-- 		CREATE TABLE dbo.sysdiagrams

-- 		(

-- 			name sysname NOT NULL,

-- 			principal_id int NOT NULL,	-- we may change it to varbinary(85)

-- 			diagram_id int PRIMARY KEY IDENTITY,

-- 			version int,

-- 	

-- 			definition varbinary(max)

-- 			CONSTRAINT UK_principal_name UNIQUE

-- 			(

-- 				principal_id,

-- 				name

-- 			)

-- 		);

-- 

-- 

-- 		/* Add this if we need to have some form of extended properties for diagrams */

-- 		/*

-- 		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL

-- 		BEGIN

-- 			CREATE TABLE dbo.sysdiagram_properties

-- 			(

-- 				diagram_id int,

-- 				name sysname,

-- 				value varbinary(max) NOT NULL

-- 			)

-- 		END

-- 		*/

-- 

-- 		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL

-- 		begin

-- 			insert into dbo.sysdiagrams

-- 			(

-- 				[name],

-- 				[principal_id],

-- 				[version],

-- 				[definition]

-- 			)

-- 			select	 

-- 				convert(sysname, dgnm.[uvalue]),

-- 				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa

-- 				0,							-- zero for old format, dgdef.[version],

-- 				dgdef.[lvalue]

-- 			from dbo.[dtproperties] dgnm

-- 				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	

-- 				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]

-- 				

-- 			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 

-- 			return 2;

-- 		end

-- 		return 1;

-- 	END

-- 	$$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Routine tcepe.sp_helpdiagrams
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- 

-- 	CREATE PROCEDURE dbo.sp_helpdiagrams

-- 	(

-- 		@diagramname sysname = NULL,

-- 		@owner_id int = NULL

-- 	)

-- 	WITH EXECUTE AS N'dbo'

-- 	AS

-- 	BEGIN

-- 		DECLARE @user sysname

-- 		DECLARE @dboLogin bit

-- 		EXECUTE AS CALLER;

-- 			SET @user = USER_NAME();

-- 			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));

-- 		REVERT;

-- 		SELECT

-- 			[Database] = DB_NAME(),

-- 			[Name] = name,

-- 			[ID] = diagram_id,

-- 			[Owner] = USER_NAME(principal_id),

-- 			[OwnerID] = principal_id

-- 		FROM

-- 			sysdiagrams

-- 		WHERE

-- 			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND

-- 			(@diagramname IS NULL OR name = @diagramname) AND

-- 			(@owner_id IS NULL OR principal_id = @owner_id)

-- 		ORDER BY

-- 			4, 5, 1

-- 	END

-- 	$$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Routine tcepe.sp_helpdiagramdefinition
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- 

-- 	CREATE PROCEDURE dbo.sp_helpdiagramdefinition

-- 	(

-- 		@diagramname 	sysname,

-- 		@owner_id	int	= null 		

-- 	)

-- 	WITH EXECUTE AS N'dbo'

-- 	AS

-- 	BEGIN

-- 		set nocount on

-- 

-- 		declare @theId 		int

-- 		declare @IsDbo 		int

-- 		declare @DiagId		int

-- 		declare @UIDFound	int

-- 	

-- 		if(@diagramname is null)

-- 		begin

-- 			RAISERROR (N'E_INVALIDARG', 16, 1);

-- 			return -1

-- 		end

-- 	

-- 		execute as caller;

-- 		select @theId = DATABASE_PRINCIPAL_ID();

-- 		select @IsDbo = IS_MEMBER(N'db_owner');

-- 		if(@owner_id is null)

-- 			select @owner_id = @theId;

-- 		revert; 

-- 	

-- 		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;

-- 		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))

-- 		begin

-- 			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);

-- 			return -3

-- 		end

-- 

-- 		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 

-- 		return 0

-- 	END

-- 	$$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Routine tcepe.sp_creatediagram
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- 

-- 	CREATE PROCEDURE dbo.sp_creatediagram

-- 	(

-- 		@diagramname 	sysname,

-- 		@owner_id		int	= null, 	

-- 		@version 		int,

-- 		@definition 	varbinary(max)

-- 	)

-- 	WITH EXECUTE AS 'dbo'

-- 	AS

-- 	BEGIN

-- 		set nocount on

-- 	

-- 		declare @theId int

-- 		declare @retval int

-- 		declare @IsDbo	int

-- 		declare @userName sysname

-- 		if(@version is null or @diagramname is null)

-- 		begin

-- 			RAISERROR (N'E_INVALIDARG', 16, 1);

-- 			return -1

-- 		end

-- 	

-- 		execute as caller;

-- 		select @theId = DATABASE_PRINCIPAL_ID(); 

-- 		select @IsDbo = IS_MEMBER(N'db_owner');

-- 		revert; 

-- 		

-- 		if @owner_id is null

-- 		begin

-- 			select @owner_id = @theId;

-- 		end

-- 		else

-- 		begin

-- 			if @theId <> @owner_id

-- 			begin

-- 				if @IsDbo = 0

-- 				begin

-- 					RAISERROR (N'E_INVALIDARG', 16, 1);

-- 					return -1

-- 				end

-- 				select @theId = @owner_id

-- 			end

-- 		end

-- 		-- next 2 line only for test, will be removed after define name unique

-- 		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)

-- 		begin

-- 			RAISERROR ('The name is already used.', 16, 1);

-- 			return -2

-- 		end

-- 	

-- 		insert into dbo.sysdiagrams(name, principal_id , version, definition)

-- 				VALUES(@diagramname, @theId, @version, @definition) ;

-- 		

-- 		select @retval = @@IDENTITY 

-- 		return @retval

-- 	END

-- 	$$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Routine tcepe.sp_renamediagram
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- 

-- 	CREATE PROCEDURE dbo.sp_renamediagram

-- 	(

-- 		@diagramname 		sysname,

-- 		@owner_id		int	= null,

-- 		@new_diagramname	sysname

-- 	

-- 	)

-- 	WITH EXECUTE AS 'dbo'

-- 	AS

-- 	BEGIN

-- 		set nocount on

-- 		declare @theId 			int

-- 		declare @IsDbo 			int

-- 		

-- 		declare @UIDFound 		int

-- 		declare @DiagId			int

-- 		declare @DiagIdTarg		int

-- 		declare @u_name			sysname

-- 		if((@diagramname is null) or (@new_diagramname is null))

-- 		begin

-- 			RAISERROR ('Invalid value', 16, 1);

-- 			return -1

-- 		end

-- 	

-- 		EXECUTE AS CALLER;

-- 		select @theId = DATABASE_PRINCIPAL_ID();

-- 		select @IsDbo = IS_MEMBER(N'db_owner'); 

-- 		if(@owner_id is null)

-- 			select @owner_id = @theId;

-- 		REVERT;

-- 	

-- 		select @u_name = USER_NAME(@owner_id)

-- 	

-- 		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 

-- 		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))

-- 		begin

-- 			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)

-- 			return -3

-- 		end

-- 	

-- 		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change

-- 		--	return 0;

-- 	

-- 		if(@u_name is null)

-- 			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname

-- 		else

-- 			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname

-- 	

-- 		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)

-- 		begin

-- 			RAISERROR ('The name is already used.', 16, 1);

-- 			return -2

-- 		end		

-- 	

-- 		if(@u_name is null)

-- 			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId

-- 		else

-- 			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId

-- 		return 0

-- 	END

-- 	$$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Routine tcepe.sp_EscreveArquivo
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- CREATE PROCEDURE [dbo].[sp_EscreveArquivo] (

--     @String VARCHAR(MAX),

--     @Ds_Arquivo VARCHAR(1501)

-- )

-- AS

-- BEGIN

--  

--     DECLARE

--         @objFileSystem INT,

--         @objTextStream INT,

--         @objErrorObject INT,

--         @strErrorMessage VARCHAR(1000),

--         @Command VARCHAR(1000),

--         @hr INT

--  

--     SET NOCOUNT ON

--  

--     SELECT

--         @strErrorMessage = 'opening the File System Object'

--     

--     EXECUTE @hr = sp_OACreate

--         'Scripting.FileSystemObject',

--         @objFileSystem OUT

--  

--     

--     IF @HR = 0

--         SELECT

--             @objErrorObject = @objFileSystem,

--             @strErrorMessage = 'Creating file "' + @Ds_Arquivo + '"'

--     

--     

--     IF @HR = 0

--         EXECUTE @hr = sp_OAMethod

--             @objFileSystem,

--             'CreateTextFile',

--             @objTextStream OUT,

--             @Ds_Arquivo,

--             2,

--             True

--  

--     IF @HR = 0

--         SELECT

--             @objErrorObject = @objTextStream,

--             @strErrorMessage = 'writing to the file "' + @Ds_Arquivo + '"'

--     

--     

--     IF @HR = 0

--         EXECUTE @hr = sp_OAMethod

--             @objTextStream,

--             'Write',

--             NULL,

--             @String

--  

--     

--     IF @HR = 0

--         SELECT

--             @objErrorObject = @objTextStream,

--             @strErrorMessage = 'closing the file "' + @Ds_Arquivo + '"'

--     

--     

--     IF @HR = 0

--         EXECUTE @hr = sp_OAMethod

--             @objTextStream,

--             'Close'

--  

--     

--     IF @hr <> 0

--     BEGIN

--     

--         DECLARE

--             @Source VARCHAR(255),

--             @Description VARCHAR(255),

--             @Helpfile VARCHAR(255),

--             @HelpID INT

--     

--         EXECUTE sp_OAGetErrorInfo

--             @objErrorObject,

--             @source OUTPUT,

--             @Description OUTPUT,

--             @Helpfile OUTPUT,

--             @HelpID OUTPUT

--         

--         

--         SELECT

--             @strErrorMessage = 'Error whilst ' + COALESCE(@strErrorMessage, 'doing something') + ', ' + COALESCE(@Description, '')

--         

--         

--         RAISERROR (@strErrorMessage,16,1)

--         

--     END

--     

--     

--     EXECUTE sp_OADestroy

--         @objTextStream

--     

--     EXECUTE sp_OADestroy

--         @objTextStream

--         

-- END$$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Routine tcepe.sp_alterdiagram
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- 

-- 	CREATE PROCEDURE dbo.sp_alterdiagram

-- 	(

-- 		@diagramname 	sysname,

-- 		@owner_id	int	= null,

-- 		@version 	int,

-- 		@definition 	varbinary(max)

-- 	)

-- 	WITH EXECUTE AS 'dbo'

-- 	AS

-- 	BEGIN

-- 		set nocount on

-- 	

-- 		declare @theId 			int

-- 		declare @retval 		int

-- 		declare @IsDbo 			int

-- 		

-- 		declare @UIDFound 		int

-- 		declare @DiagId			int

-- 		declare @ShouldChangeUID	int

-- 	

-- 		if(@diagramname is null)

-- 		begin

-- 			RAISERROR ('Invalid ARG', 16, 1)

-- 			return -1

-- 		end

-- 	

-- 		execute as caller;

-- 		select @theId = DATABASE_PRINCIPAL_ID();	 

-- 		select @IsDbo = IS_MEMBER(N'db_owner'); 

-- 		if(@owner_id is null)

-- 			select @owner_id = @theId;

-- 		revert;

-- 	

-- 		select @ShouldChangeUID = 0

-- 		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 

-- 		

-- 		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))

-- 		begin

-- 			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);

-- 			return -3

-- 		end

-- 	

-- 		if(@IsDbo <> 0)

-- 		begin

-- 			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id

-- 			begin

-- 				select @ShouldChangeUID = 1 ;

-- 			end

-- 		end

-- 

-- 		-- update dds data			

-- 		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

-- 

-- 		-- change owner

-- 		if(@ShouldChangeUID = 1)

-- 			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

-- 

-- 		-- update dds version

-- 		if(@version is not null)

-- 			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

-- 

-- 		return 0

-- 	END

-- 	$$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Routine tcepe.sp_dropdiagram
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- 

-- 	CREATE PROCEDURE dbo.sp_dropdiagram

-- 	(

-- 		@diagramname 	sysname,

-- 		@owner_id	int	= null

-- 	)

-- 	WITH EXECUTE AS 'dbo'

-- 	AS

-- 	BEGIN

-- 		set nocount on

-- 		declare @theId 			int

-- 		declare @IsDbo 			int

-- 		

-- 		declare @UIDFound 		int

-- 		declare @DiagId			int

-- 	

-- 		if(@diagramname is null)

-- 		begin

-- 			RAISERROR ('Invalid value', 16, 1);

-- 			return -1

-- 		end

-- 	

-- 		EXECUTE AS CALLER;

-- 		select @theId = DATABASE_PRINCIPAL_ID();

-- 		select @IsDbo = IS_MEMBER(N'db_owner'); 

-- 		if(@owner_id is null)

-- 			select @owner_id = @theId;

-- 		REVERT; 

-- 		

-- 		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 

-- 		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))

-- 		begin

-- 			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)

-- 			return -3

-- 		end

-- 	

-- 		delete from dbo.sysdiagrams where diagram_id = @DiagId;

-- 	

-- 		return 0;

-- 	END

-- 	$$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Routine tcepe.fn_diagramobjects
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `tcepe`$$
-- 

-- 	CREATE FUNCTION dbo.fn_diagramobjects() 

-- 	RETURNS int

-- 	WITH EXECUTE AS N'dbo'

-- 	AS

-- 	BEGIN

-- 		declare @id_upgraddiagrams		int

-- 		declare @id_sysdiagrams			int

-- 		declare @id_helpdiagrams		int

-- 		declare @id_helpdiagramdefinition	int

-- 		declare @id_creatediagram	int

-- 		declare @id_renamediagram	int

-- 		declare @id_alterdiagram 	int 

-- 		declare @id_dropdiagram		int

-- 		declare @InstalledObjects	int

-- 

-- 		select @InstalledObjects = 0

-- 

-- 		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),

-- 			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),

-- 			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),

-- 			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),

-- 			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),

-- 			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),

-- 			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 

-- 			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

-- 

-- 		if @id_upgraddiagrams is not null

-- 			select @InstalledObjects = @InstalledObjects + 1

-- 		if @id_sysdiagrams is not null

-- 			select @InstalledObjects = @InstalledObjects + 2

-- 		if @id_helpdiagrams is not null

-- 			select @InstalledObjects = @InstalledObjects + 4

-- 		if @id_helpdiagramdefinition is not null

-- 			select @InstalledObjects = @InstalledObjects + 8

-- 		if @id_creatediagram is not null

-- 			select @InstalledObjects = @InstalledObjects + 16

-- 		if @id_renamediagram is not null

-- 			select @InstalledObjects = @InstalledObjects + 32

-- 		if @id_alterdiagram  is not null

-- 			select @InstalledObjects = @InstalledObjects + 64

-- 		if @id_dropdiagram is not null

-- 			select @InstalledObjects = @InstalledObjects + 128

-- 		

-- 		return @InstalledObjects 

-- 	END

-- 	$$
-- 
-- DELIMITER ;
-- SET FOREIGN_KEY_CHECKS = 1;
