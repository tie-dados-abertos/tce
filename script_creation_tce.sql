USE [master]
GO
/****** Object:  Database [TomeConta]    Script Date: 03/02/2019 11:43:53 ******/
CREATE DATABASE [TomeConta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TomeConta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TomeConta.mdf' , SIZE = 17022976KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TomeConta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TomeConta_log.ldf' , SIZE = 13440960KB , MAXSIZE = 2048GB , FILEGROWTH = 524288KB )
GO
ALTER DATABASE [TomeConta] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TomeConta].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [TomeConta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TomeConta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TomeConta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TomeConta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TomeConta] SET ARITHABORT OFF 
GO
ALTER DATABASE [TomeConta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TomeConta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TomeConta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TomeConta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TomeConta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TomeConta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TomeConta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TomeConta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TomeConta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TomeConta] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TomeConta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TomeConta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TomeConta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TomeConta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TomeConta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TomeConta] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TomeConta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TomeConta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TomeConta] SET  MULTI_USER 
GO
ALTER DATABASE [TomeConta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TomeConta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TomeConta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TomeConta] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TomeConta] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TomeConta', N'ON'
GO
ALTER DATABASE [TomeConta] SET QUERY_STORE = OFF
GO
USE [TomeConta]
GO
/****** Object:  User [UsuariosExternos]    Script Date: 03/02/2019 11:43:53 ******/
CREATE USER [UsuariosExternos] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TCE\4217]    Script Date: 03/02/2019 11:43:53 ******/
CREATE USER [TCE\4217] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tce\1168]    Script Date: 03/02/2019 11:43:53 ******/
CREATE USER [tce\1168] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dba_leitura]    Script Date: 03/02/2019 11:43:53 ******/
CREATE USER [dba_leitura] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DadosAbertosTCE]    Script Date: 03/02/2019 11:43:53 ******/
CREATE USER [DadosAbertosTCE] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [UsuariosExternos]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TCE\4217]
GO
ALTER ROLE [db_owner] ADD MEMBER [tce\1168]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dba_leitura]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DadosAbertosTCE]
GO
/****** Object:  Table [dbo].[LOTACAO]    Script Date: 03/02/2019 11:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOTACAO](
	[ID_LOTACAO] [int] NOT NULL,
	[DT_ANOREFERENCIA] [smallint] NOT NULL,
	[NU_CODIGO] [varchar](15) NOT NULL,
	[DT_MESREFERENCIA] [smallint] NOT NULL,
	[ID_PRESTACAO_CONTA] [numeric](19, 0) NOT NULL,
	[DE_LOTACAO] [varchar](50) NOT NULL,
	[ID_UGESTORA] [numeric](19, 0) NOT NULL,
	[ID_UGESTORAADM] [int] NOT NULL,
	[DE_UGGESTORA] [varchar](200) NULL,
	[DE_UGGESTORAADM] [varchar](200) NULL,
 CONSTRAINT [PK__LOTACAO__0DAF0CB0] PRIMARY KEY CLUSTERED 
(
	[ID_LOTACAO] ASC,
	[DT_ANOREFERENCIA] ASC,
	[DT_MESREFERENCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_LOTACAO_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_LOTACAO_2014] as 
SELECT [ID_LOTACAO]
      ,[DT_ANOREFERENCIA]
      ,[NU_CODIGO]
      ,[DT_MESREFERENCIA]
      ,[ID_PRESTACAO_CONTA]
      ,[DE_LOTACAO]
      ,[ID_UGESTORA]
      ,[ID_UGESTORAADM]
      ,[DE_UGGESTORA]
      ,[DE_UGGESTORAADM]
  FROM [dbo].[LOTACAO]
  where DT_ANOREFERENCIA = 2014 
GO
/****** Object:  View [dbo].[VW_LOTACAO_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VW_LOTACAO_2015] as 
SELECT [ID_LOTACAO]
      ,[DT_ANOREFERENCIA]
      ,[NU_CODIGO]
      ,[DT_MESREFERENCIA]
      ,[ID_PRESTACAO_CONTA]
      ,[DE_LOTACAO]
      ,[ID_UGESTORA]
      ,[ID_UGESTORAADM]
      ,[DE_UGGESTORA]
      ,[DE_UGGESTORAADM]
  FROM [dbo].[LOTACAO]
  where DT_ANOREFERENCIA = 2015 

GO
/****** Object:  Table [dbo].[SCA_Despesas]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_Despesas](
	[ID_EMPENHO] [char](12) NOT NULL,
	[ANO_REFERENCIA] [int] NOT NULL,
	[ID_UNIDADE_GESTORA] [int] NULL,
	[NUMERO_EMPENHO] [varchar](8) NULL,
	[HISTORICO] [varchar](510) NULL,
	[CODIGO_UNIDADE_ORCAMENTARIA] [int] NULL,
	[UNIDADE_ORCAMENTARIA] [varchar](50) NULL,
	[CODIGO_FONTE_RECURSO] [int] NULL,
	[FONTE_RECURSO] [varchar](80) NULL,
	[CODIGO_FUNCAO] [numeric](19, 0) NULL,
	[FUNCAO] [varchar](25) NULL,
	[CODIGO_SUBFUNCAO] [numeric](19, 0) NULL,
	[SUBFUNCAO] [varchar](255) NULL,
	[CODIGO_PROGRAMA] [int] NULL,
	[PROGRAMA] [varchar](70) NULL,
	[CODIGO_ACAO] [int] NULL,
	[ACAO] [varchar](70) NULL,
	[CODIGO_CATEGORIA] [numeric](19, 0) NULL,
	[CATEGORIA] [varchar](25) NULL,
	[CODIGO_NATUREZA] [numeric](19, 0) NULL,
	[NATUREZA] [varchar](30) NULL,
	[CODIGO_MODALIDADE] [numeric](19, 0) NULL,
	[MODALIDADE] [varchar](160) NULL,
	[CODIGO_ELEMENTO_DESPESA] [numeric](19, 0) NULL,
	[ELEMENTO_DESPESA] [varchar](70) NULL,
	[CODIGO_SUBELEMENTO] [numeric](19, 0) NULL,
	[SUBELEMENTO_DESPESA] [varchar](255) NULL,
	[CPF_CNPJ] [varchar](14) NULL,
	[NOME_FORNECEDOR] [varchar](150) NULL,
	[VALOR_EMPENHADO] [numeric](38, 2) NULL,
	[VALOR_LIQUIDADO] [numeric](38, 2) NULL,
	[VALOR_PAGO] [numeric](38, 2) NULL,
	[DATA_EMPENHO] [datetime] NULL,
	[ESFERA] [varchar](1) NULL,
	[CODIGO_MUNICIPIO] [char](4) NULL,
	[TIPO_CREDOR] [numeric](19, 0) NULL,
	[NOME_UNIDADE_GESTORA] [varchar](500) NULL,
	[ID_UNIDADE_GESTORA_ORIG] [numeric](19, 0) NULL,
	[CODIGO_TIPO_EMPENHO] [numeric](19, 0) NULL,
	[TIPO_EMPENHO] [varchar](20) NULL,
	[CODIGO_TIPO_ACAO] [numeric](19, 0) NULL,
	[TIPO_ACAO] [varchar](50) NULL,
	[CODIGO_TIPO_MODALIDADE_LICITACAO] [numeric](19, 0) NULL,
	[TIPO_MODALIDADE_LICITACAO] [varchar](40) NULL,
	[NUMERO_ANO_PROCESSO_LICITATORIO] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_SCA_Despesas_2018]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Despesas_2018] as
SELECT  *
  FROM [dbo].[SCA_Despesas]
where [ANO_REFERENCIA] = 2018

GO
/****** Object:  Table [dbo].[SCA_Receitas]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_Receitas](
	[ID_RECEITA_ORCAMENTARIA] [int] NOT NULL,
	[ID_UNIDADE_GESTORA] [int] NOT NULL,
	[NUMERO_RECEITA_ORCAMENTARIA_UG] [varchar](11) NULL,
	[DEDUCAO_RECEITA] [int] NOT NULL,
	[CATEGORIA_RECEITA] [varchar](100) NULL,
	[ORIGEM_RECEITA] [varchar](100) NULL,
	[ESPECIE_RECEITA] [varchar](255) NULL,
	[DESCRICAO] [varchar](255) NULL,
	[ANO_REFERENCIA] [int] NOT NULL,
	[VALOR_LANCAMENTO] [numeric](23, 2) NULL,
	[ESFERA] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_SCA_Receitas_2012]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Receitas_2012] as
SELECT *
  FROM [dbo].[SCA_Receitas]
where [ANO_REFERENCIA] = 2012

GO
/****** Object:  View [dbo].[VW_SCA_Receitas_2013]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Receitas_2013] as
SELECT *
  FROM [dbo].[SCA_Receitas]
where [ANO_REFERENCIA] = 2013

GO
/****** Object:  Table [dbo].[SCA_DespesasEstaduais]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_DespesasEstaduais](
	[ID_EMPENHO] [char](12) NOT NULL,
	[ANO_REFERENCIA] [char](4) NOT NULL,
	[ID_UNIDADE_GESTORA] [int] NULL,
	[NUMERO_EMPENHO] [char](12) NOT NULL,
	[HISTORICO] [varchar](8000) NULL,
	[CODIGO_UNIDADE_ORCAMENTARIA] [char](5) NULL,
	[UNIDADE_ORCAMENTARIA] [varchar](200) NULL,
	[CODIGO_FONTE_RECURSO] [char](10) NULL,
	[FONTE_RECURSO] [varchar](100) NULL,
	[CODIGO_FUNCAO] [char](2) NULL,
	[FUNCAO] [varchar](100) NULL,
	[CODIGO_SUBFUNCAO] [char](3) NULL,
	[SUBFUNCAO] [varchar](100) NULL,
	[CODIGO_PROGRAMA] [char](4) NULL,
	[PROGRAMA] [varchar](500) NULL,
	[CODIGO_ACAO] [char](17) NULL,
	[ACAO] [varchar](200) NULL,
	[CODIGO_CATEGORIA] [char](8) NULL,
	[CATEGORIA] [varchar](200) NULL,
	[CODIGO_NATUREZA] [char](8) NULL,
	[NATUREZA] [varchar](200) NULL,
	[CODIGO_MODALIDADE] [char](8) NULL,
	[MODALIDADE] [varchar](200) NULL,
	[CODIGO_ELEMENTO_DESPESA] [char](8) NULL,
	[ELEMENTO_DESPESA] [varchar](200) NULL,
	[CODIGO_SUBELEMENTO] [int] NULL,
	[SUBELEMENTO_DESPESA] [int] NULL,
	[CPF_CNPJ] [char](14) NULL,
	[NOME_FORNECEDOR] [varchar](200) NULL,
	[VALOR_EMPENHADO] [decimal](17, 2) NULL,
	[VALOR_LIQUIDADO] [decimal](17, 2) NULL,
	[VALOR_PAGO] [decimal](38, 2) NULL,
	[DATA_EMPENHO] [datetime] NOT NULL,
	[NOME_UNIDADE_GESTORA] [varchar](100) NULL,
	[TIPO_CREDOR] [char](1) NULL,
	[ESFERA] [varchar](1) NULL,
	[CODIGO_MUNICIPIO] [char](4) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2018]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2018] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2018

GO
/****** Object:  View [dbo].[VW_SCA_Receitas_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Receitas_2014] as
SELECT *
  FROM [dbo].[SCA_Receitas]
where [ANO_REFERENCIA] = 2014

GO
/****** Object:  Table [dbo].[SCA_EmpenhoLiquidacao]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_EmpenhoLiquidacao](
	[ID_LIQUIDACAO] [varchar](12) NULL,
	[TIPO] [varchar](50) NOT NULL,
	[DATA] [datetime] NULL,
	[NUMERO] [varchar](12) NULL,
	[VALOR] [decimal](23, 2) NULL,
	[ID_EMPENHO] [varchar](12) NULL,
	[NUMERO_EMPENHO] [varchar](12) NULL,
	[ANO_REFERENCIA] [int] NOT NULL,
	[ID_UNIDADE_GESTORA] [int] NULL,
	[ESFERA] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2018]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2018] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2018

GO
/****** Object:  View [dbo].[VW_SCA_Receitas_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Receitas_2015] as
SELECT *
  FROM [dbo].[SCA_Receitas]
where [ANO_REFERENCIA] = 2015

GO
/****** Object:  Table [dbo].[SCA_EmpenhoPagamento]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_EmpenhoPagamento](
	[ID_PAGAMENTO] [varchar](12) NULL,
	[TIPO] [varchar](50) NOT NULL,
	[DATA] [datetime] NULL,
	[VALOR] [numeric](23, 2) NULL,
	[NUMERO_BANCO] [varchar](3) NULL,
	[NUMERO_AGENCIA] [varchar](6) NULL,
	[NUMERO_CONTA] [varchar](12) NULL,
	[NUMERO_CHEQUE] [varchar](6) NULL,
	[ID_EMPENHO] [varchar](12) NULL,
	[NUMERO_EMPENHO] [varchar](12) NULL,
	[ANO_REFERENCIA] [int] NOT NULL,
	[ID_UNIDADE_GESTORA] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPagamento_2018]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPagamento_2018] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2018

GO
/****** Object:  View [dbo].[VW_SCA_Receitas_2016]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Receitas_2016] as
SELECT *
  FROM [dbo].[SCA_Receitas]
where [ANO_REFERENCIA] = 2016

GO
/****** Object:  Table [dbo].[SCA_EmpenhoResumo]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_EmpenhoResumo](
	[ID] [varchar](12) NULL,
	[TIPO] [varchar](18) NOT NULL,
	[DATA] [datetime] NOT NULL,
	[VALOR] [numeric](23, 2) NULL,
	[ID_EMPENHO] [varchar](12) NULL,
	[NUMERO_EMPENHO] [varchar](12) NULL,
	[ANO_REFERENCIA] [int] NOT NULL,
	[ID_UNIDADE_GESTORA] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2018]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2018] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2018

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2010]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2010] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2010

GO
/****** Object:  View [dbo].[VW_SCA_Receitas_2018]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Receitas_2018] as
SELECT *
  FROM [dbo].[SCA_Receitas]
where [ANO_REFERENCIA] = 2018

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2011]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2011] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2011

GO
/****** Object:  Table [dbo].[SCA_ReceitasPrevistas]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_ReceitasPrevistas](
	[ID_RECEITA_ORCAMENTARIA] [int] NULL,
	[ID_UNIDADE_GESTORA] [int] NOT NULL,
	[ANO_REFERENCIA] [int] NOT NULL,
	[Categoria] [varchar](100) NULL,
	[Origem] [varchar](100) NULL,
	[Especie] [varchar](100) NULL,
	[VALOR_PREVISTO] [numeric](23, 2) NULL,
	[ESFERA] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_SCA_ReceitasPrevistas_2017]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasPrevistas_2017] as
SELECT *
  FROM [dbo].[SCA_ReceitasPrevistas]
  where [ANO_REFERENCIA] = 2017

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2012]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2012] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2012

GO
/****** Object:  View [dbo].[VW_SCA_ReceitasPrevistas_2018]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasPrevistas_2018] as
SELECT *
  FROM [dbo].[SCA_ReceitasPrevistas]
  where [ANO_REFERENCIA] = 2018

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2013]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2013] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2013

GO
/****** Object:  Table [dbo].[SCA_ReceitasEstaduais]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_ReceitasEstaduais](
	[ID_RECEITA_ORCAMENTARIA] [int] NULL,
	[ID_UNIDADE_GESTORA] [int] NULL,
	[NUMERO_RECEITA_ORCAMENTARIA_UG] [int] NULL,
	[DEDUCAO_RECEITA] [int] NULL,
	[CATEGORIA_RECEITA] [varchar](100) NULL,
	[ORIGEM_RECEITA] [varchar](100) NULL,
	[ESPECIE_RECEITA] [varchar](100) NULL,
	[DESCRICAO] [varchar](200) NULL,
	[ANO_REFERENCIA] [int] NOT NULL,
	[MES] [int] NOT NULL,
	[VALOR_PREVISTO] [int] NOT NULL,
	[VALOR_LANCAMENTO] [decimal](18, 2) NULL,
	[ESFERA] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_SCA_ReceitasEstaduais_2018]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasEstaduais_2018] as
SELECT *
  FROM [dbo].[SCA_ReceitasEstaduais]
  where [ANO_REFERENCIA] = 2018

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2014] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2014

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2015] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2015

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2016]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2016] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2016

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoResumo_2017]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoResumo_2017] as
SELECT *
  FROM [dbo].[SCA_EmpenhoResumo]
where [ANO_REFERENCIA] = 2017

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2008]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2008] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2008

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2009]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2009] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2009

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2010]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2010] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2010

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2011]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2011] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2011

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2012]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2012] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2012

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2013]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2013] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2013

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2014] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2014

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2015] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2015

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2016]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2016] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2016

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoLiquidacao_2017]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoLiquidacao_2017] as
SELECT *
  FROM [dbo].[SCA_EmpenhoLiquidacao]
where [ANO_REFERENCIA] = 2017

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPagamento_2010]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPagamento_2010] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2010

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPagamento_2012]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPagamento_2012] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2012

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPagamento_2013]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPagamento_2013] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2013

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPagamento_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPagamento_2014] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2014

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPAgamento_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPAgamento_2015] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2015

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPagamento_2016]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPagamento_2016] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2016

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPagamento_2017]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPagamento_2017] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2017

GO
/****** Object:  View [dbo].[VW_SCA_Despesas_2012]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Despesas_2012] as
SELECT  *
  FROM [dbo].[SCA_Despesas]
where [ANO_REFERENCIA] = 2012

GO
/****** Object:  View [dbo].[VW_SCA_Despesas_2013]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Despesas_2013] as
SELECT  *
  FROM [dbo].[SCA_Despesas]
where [ANO_REFERENCIA] = 2013

GO
/****** Object:  View [dbo].[VW_SCA_Despesas_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Despesas_2014] as
SELECT  *
  FROM [dbo].[SCA_Despesas]
where [ANO_REFERENCIA] = 2014

GO
/****** Object:  View [dbo].[VW_SCA_Despesas_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Despesas_2015] as
SELECT  *
  FROM [dbo].[SCA_Despesas]
where [ANO_REFERENCIA] = 2015

GO
/****** Object:  View [dbo].[VW_SCA_Despesas_2016]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VW_SCA_Despesas_2016] as
SELECT [ID_EMPENHO]
      ,[ANO_REFERENCIA]
      ,[ID_UNIDADE_GESTORA]
      ,[NUMERO_EMPENHO]
      ,[HISTORICO]
      ,[CODIGO_UNIDADE_ORCAMENTARIA]
      ,[UNIDADE_ORCAMENTARIA]
      ,[CODIGO_FONTE_RECURSO]
      ,[FONTE_RECURSO]
      ,[CODIGO_FUNCAO]
      ,[FUNCAO]
      ,[CODIGO_SUBFUNCAO]
      ,[SUBFUNCAO]
      ,[CODIGO_PROGRAMA]
      ,[PROGRAMA]
      ,[CODIGO_ACAO]
      ,[ACAO]
      ,[CODIGO_CATEGORIA]
      ,[CATEGORIA]
      ,[CODIGO_NATUREZA]
      ,[NATUREZA]
      ,[CODIGO_MODALIDADE]
      ,[MODALIDADE]
      ,[CODIGO_ELEMENTO_DESPESA]
      ,[ELEMENTO_DESPESA]
      ,[CODIGO_SUBELEMENTO]
      ,[SUBELEMENTO_DESPESA]
      ,[CPF_CNPJ]
      ,[NOME_FORNECEDOR]
      ,[VALOR_EMPENHADO]
      ,[VALOR_LIQUIDADO]
      ,[VALOR_PAGO]
      ,[DATA_EMPENHO]
      ,[ESFERA]
      ,[CODIGO_MUNICIPIO]
      ,[TIPO_CREDOR]
      ,[NOME_UNIDADE_GESTORA]
  FROM [dbo].[SCA_Despesas]
where [ANO_REFERENCIA] = 2016
GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2010]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2010] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2010

GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2011]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2011] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2011

GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2012]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2012] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2012

GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2013]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2013] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2013

GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2014] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2014

GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2015] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2015

GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2016]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2016] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2016

GO
/****** Object:  View [dbo].[VW_SCA_DespesasEstaduais_2017]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_DespesasEstaduais_2017] as
SELECT *
  FROM [dbo].[SCA_DespesasEstaduais]
where [ANO_REFERENCIA] = 2017

GO
/****** Object:  View [dbo].[VW_SCA_EmpenhoPagamento_2011]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_EmpenhoPagamento_2011] as
SELECT *
  FROM [dbo].[SCA_EmpenhoPagamento]
where [ANO_REFERENCIA] = 2011

GO
/****** Object:  View [dbo].[VW_SCA_Despesas_2017]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Despesas_2017] as
SELECT  *
  FROM [dbo].[SCA_Despesas]
where [ANO_REFERENCIA] = 2017

GO
/****** Object:  View [dbo].[VW_SCA_Receitas_2017]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_Receitas_2017] as
SELECT *
  FROM [dbo].[SCA_Receitas]
where [ANO_REFERENCIA] = 2017

GO
/****** Object:  View [dbo].[VW_SCA_ReceitasEstaduais_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasEstaduais_2014] as
SELECT *
  FROM [dbo].[SCA_ReceitasEstaduais]
  where [ANO_REFERENCIA] = 2014

GO
/****** Object:  View [dbo].[VW_SCA_ReceitasEstaduais_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasEstaduais_2015] as
SELECT *
  FROM [dbo].[SCA_ReceitasEstaduais]
  where [ANO_REFERENCIA] = 2015

GO
/****** Object:  View [dbo].[VW_SCA_ReceitasEstaduais_2016]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasEstaduais_2016] as
SELECT *
  FROM [dbo].[SCA_ReceitasEstaduais]
  where [ANO_REFERENCIA] = 2016

GO
/****** Object:  View [dbo].[VW_SCA_ReceitasEstaduais_2017]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasEstaduais_2017] as
SELECT *
  FROM [dbo].[SCA_ReceitasEstaduais]
  where [ANO_REFERENCIA] = 2017

GO
/****** Object:  View [dbo].[VW_SCA_ReceitasPrevistas_2016]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasPrevistas_2016] as
SELECT *
  FROM [dbo].[SCA_ReceitasPrevistas]
  where [ANO_REFERENCIA] = 2016

GO
/****** Object:  View [dbo].[VW_SCA_ReceitasPrevistas_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasPrevistas_2015] as
SELECT *
  FROM [dbo].[SCA_ReceitasPrevistas]
  where [ANO_REFERENCIA] = 2015

GO
/****** Object:  View [dbo].[VW_SCA_ReceitasPrevistas_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_SCA_ReceitasPrevistas_2014] as
SELECT *
  FROM [dbo].[SCA_ReceitasPrevistas]
  where [ANO_REFERENCIA] = 2014

GO
/****** Object:  Table [dbo].[PORTAL_LISTASERVIDORES]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PORTAL_LISTASERVIDORES](
	[ID_HISTORICOFUNCIONAL] [int] NOT NULL,
	[ENTRADA_ID_TIPOMOVIMENTACAO] [int] NULL,
	[DT_MOVIMENTACAO] [datetime] NOT NULL,
	[SAIDA_ID_TIPOMOVIMENTACAO] [int] NULL,
	[ID_SERVIDOR] [int] NOT NULL,
	[DE_ESFERA] [varchar](30) NULL,
	[UG_NATUREZA_ORGAO] [varchar](50) NULL,
	[DT_ANOREFERENCIA] [smallint] NOT NULL,
	[DT_MESREFERENCIA] [smallint] NOT NULL,
	[MATRICULA] [varchar](15) NOT NULL,
	[NU_CPF] [varchar](69) NULL,
	[NO_SERVIDOR] [varchar](80) NOT NULL,
	[DE_UGGESTORA] [varchar](200) NOT NULL,
	[DE_TIPOVINCULO] [varchar](50) NOT NULL,
	[DE_TIPOESCOLARIDADE] [varchar](40) NOT NULL,
	[NO_CARGO] [varchar](200) NOT NULL,
	[DE_LOTACAO] [varchar](50) NOT NULL,
	[DT_ENTRADA] [datetime] NOT NULL,
	[DT_SAIDA] [datetime] NULL,
	[DE_TIPOATOPESSOAL] [varchar](100) NOT NULL,
	[NOME_MUNICIPIO] [varchar](100) NOT NULL,
	[VINCULOS] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_PORTAL_LISTASERVIDORES_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_PORTAL_LISTASERVIDORES_2014] as
SELECT [ID_HISTORICOFUNCIONAL]
      ,[ENTRADA_ID_TIPOMOVIMENTACAO]
      ,[DT_MOVIMENTACAO]
      ,[SAIDA_ID_TIPOMOVIMENTACAO]
      ,[ID_SERVIDOR]
      ,[DE_ESFERA]
      ,[UG_NATUREZA_ORGAO]
      ,[DT_ANOREFERENCIA]
      ,[DT_MESREFERENCIA]
      ,[MATRICULA]
      ,[NU_CPF]
      ,[NO_SERVIDOR]
      ,[DE_UGGESTORA]
      ,[DE_TIPOVINCULO]
      ,[DE_TIPOESCOLARIDADE]
      ,[NO_CARGO]
      ,[DE_LOTACAO]
      ,[DT_ENTRADA]
      ,[DT_SAIDA]
      ,[DE_TIPOATOPESSOAL]
      ,[NOME_MUNICIPIO]
      ,[VINCULOS]
  FROM [dbo].[PORTAL_LISTASERVIDORES]
  where [DT_ANOREFERENCIA] = 2014
GO
/****** Object:  View [dbo].[VW_PORTAL_LISTASERVIDORES_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_PORTAL_LISTASERVIDORES_2015] as
SELECT [ID_HISTORICOFUNCIONAL]
      ,[ENTRADA_ID_TIPOMOVIMENTACAO]
      ,[DT_MOVIMENTACAO]
      ,[SAIDA_ID_TIPOMOVIMENTACAO]
      ,[ID_SERVIDOR]
      ,[DE_ESFERA]
      ,[UG_NATUREZA_ORGAO]
      ,[DT_ANOREFERENCIA]
      ,[DT_MESREFERENCIA]
      ,[MATRICULA]
      ,[NU_CPF]
      ,[NO_SERVIDOR]
      ,[DE_UGGESTORA]
      ,[DE_TIPOVINCULO]
      ,[DE_TIPOESCOLARIDADE]
      ,[NO_CARGO]
      ,[DE_LOTACAO]
      ,[DT_ENTRADA]
      ,[DT_SAIDA]
      ,[DE_TIPOATOPESSOAL]
      ,[NOME_MUNICIPIO]
      ,[VINCULOS]
  FROM [dbo].[PORTAL_LISTASERVIDORES]
  where [DT_ANOREFERENCIA] = 2015
GO
/****** Object:  Table [dbo].[PORTAL_MOVIMENTACAOPESSOAL]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PORTAL_MOVIMENTACAOPESSOAL](
	[ID_HISTORICOFUNCIONAL] [int] NOT NULL,
	[DT_ANOREFERENCIA] [smallint] NOT NULL,
	[DT_MOVIMENTACAO] [datetime] NOT NULL,
	[DT_ANOMOVIMENTACAO] [int] NULL,
	[DT_MESMOVIMENTACAO] [int] NULL,
	[DT_MESREFERENCIA] [smallint] NOT NULL,
	[INGRESSO] [int] NOT NULL,
	[AFASTAMENTO] [int] NOT NULL,
	[AFASTAMENTO_SUJEITO_REGISTRO_TCE] [int] NOT NULL,
	[NU_TIPOATOPESSOAL] [int] NOT NULL,
	[ID_SERVIDOR] [int] NULL,
	[MATRICULA] [varchar](15) NOT NULL,
	[NU_CPF] [varchar](69) NULL,
	[NO_SERVIDOR] [varchar](80) NOT NULL,
	[DE_ESFERA] [varchar](30) NULL,
	[UG_NATUREZA_ORGAO] [varchar](50) NULL,
	[NOME_MUNICIPIO] [varchar](100) NOT NULL,
	[DE_UGGESTORA] [varchar](200) NOT NULL,
	[DE_TIPOMOTIVOINATIVACAO] [varchar](40) NULL,
	[DE_TIPOREGIMEPREVIDENCIARIO] [varchar](40) NOT NULL,
	[DE_TIPOREGIMETRABALHO] [varchar](40) NOT NULL,
	[DE_TIPOATOPESSOAL] [varchar](100) NOT NULL,
	[NO_CARGO] [varchar](200) NOT NULL,
	[DT_ANOREFERENCIA_CARGO] [smallint] NOT NULL,
	[DT_MESREFERENCIA_CARGO] [smallint] NOT NULL,
	[DE_LOTACAO] [varchar](50) NOT NULL,
	[DE_TIPOVINCULO] [varchar](50) NOT NULL,
	[DE_TIPOESCOLARIDADE] [varchar](40) NOT NULL,
	[ID_TIPOMOVIMENTACAO] [int] NOT NULL,
	[DE_TIPOMOVIMENTACAO] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_PORTAL_MOVIMENTACAOPESSOAL_2015]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_PORTAL_MOVIMENTACAOPESSOAL_2015] as
SELECT [ID_HISTORICOFUNCIONAL]
      ,[DT_ANOREFERENCIA]
      ,[DT_MOVIMENTACAO]
      ,[DT_ANOMOVIMENTACAO]
      ,[DT_MESMOVIMENTACAO]
      ,[DT_MESREFERENCIA]
      ,[INGRESSO]
      ,[AFASTAMENTO]
      ,[AFASTAMENTO_SUJEITO_REGISTRO_TCE]
      ,[NU_TIPOATOPESSOAL]
      ,[ID_SERVIDOR]
      ,[MATRICULA]
      ,[NU_CPF]
      ,[NO_SERVIDOR]
      ,[DE_ESFERA]
      ,[UG_NATUREZA_ORGAO]
      ,[NOME_MUNICIPIO]
      ,[DE_UGGESTORA]
      ,[DE_TIPOMOTIVOINATIVACAO]
      ,[DE_TIPOREGIMEPREVIDENCIARIO]
      ,[DE_TIPOREGIMETRABALHO]
      ,[DE_TIPOATOPESSOAL]
      ,[NO_CARGO]
      ,[DT_ANOREFERENCIA_CARGO]
      ,[DT_MESREFERENCIA_CARGO]
      ,[DE_LOTACAO]
      ,[DE_TIPOVINCULO]
      ,[DE_TIPOESCOLARIDADE]
      ,[ID_TIPOMOVIMENTACAO]
      ,[DE_TIPOMOVIMENTACAO]
  FROM [dbo].[PORTAL_MOVIMENTACAOPESSOAL]
  where [DT_ANOREFERENCIA] = 2015
GO
/****** Object:  View [dbo].[VW_PORTAL_MOVIMENTACAOPESSOAL_2014]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VW_PORTAL_MOVIMENTACAOPESSOAL_2014] as
SELECT [ID_HISTORICOFUNCIONAL]
      ,[DT_ANOREFERENCIA]
      ,[DT_MOVIMENTACAO]
      ,[DT_ANOMOVIMENTACAO]
      ,[DT_MESMOVIMENTACAO]
      ,[DT_MESREFERENCIA]
      ,[INGRESSO]
      ,[AFASTAMENTO]
      ,[AFASTAMENTO_SUJEITO_REGISTRO_TCE]
      ,[NU_TIPOATOPESSOAL]
      ,[ID_SERVIDOR]
      ,[MATRICULA]
      ,[NU_CPF]
      ,[NO_SERVIDOR]
      ,[DE_ESFERA]
      ,[UG_NATUREZA_ORGAO]
      ,[NOME_MUNICIPIO]
      ,[DE_UGGESTORA]
      ,[DE_TIPOMOTIVOINATIVACAO]
      ,[DE_TIPOREGIMEPREVIDENCIARIO]
      ,[DE_TIPOREGIMETRABALHO]
      ,[DE_TIPOATOPESSOAL]
      ,[NO_CARGO]
      ,[DT_ANOREFERENCIA_CARGO]
      ,[DT_MESREFERENCIA_CARGO]
      ,[DE_LOTACAO]
      ,[DE_TIPOVINCULO]
      ,[DE_TIPOESCOLARIDADE]
      ,[ID_TIPOMOVIMENTACAO]
      ,[DE_TIPOMOVIMENTACAO]
  FROM [dbo].[PORTAL_MOVIMENTACAOPESSOAL]
  where [DT_ANOREFERENCIA] = 2014
GO
/****** Object:  Table [dbo].[CARGO]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARGO](
	[ID_CARGO] [int] NOT NULL,
	[DT_ANOREFERENCIA] [int] NOT NULL,
	[NU_CARGAHORARIA] [int] NOT NULL,
	[DT_MESREFERENCIA] [int] NOT NULL,
	[NO_CARGO] [varchar](255) NOT NULL,
	[NU_CODIGO] [varchar](30) NOT NULL,
	[ID_PRESTACAO_CONTA] [numeric](19, 0) NOT NULL,
	[ID_TIPOESCOLARIDADE] [int] NOT NULL,
	[ID_UGESTORA] [numeric](19, 0) NOT NULL,
	[DE_TIPOESCOLARIDADE] [varchar](50) NULL,
	[DE_UGGESTORA] [varchar](255) NULL,
	[CBOCodigo] [varchar](6) NULL,
	[LeiCriacao] [varchar](255) NULL,
 CONSTRAINT [PK_CARGO] PRIMARY KEY CLUSTERED 
(
	[ID_CARGO] ASC,
	[DT_ANOREFERENCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contratos]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contratos](
	[UnidadeGestora] [varchar](200) NOT NULL,
	[Esfera] [char](2) NOT NULL,
	[Municipio] [varchar](40) NOT NULL,
	[NumeroContrato] [varchar](10) NULL,
	[AnoContrato] [int] NOT NULL,
	[TipoProcesso] [varchar](100) NULL,
	[NumeroProcesso] [int] NULL,
	[AnoProcesso] [int] NULL,
	[CPF_CNPJ] [varchar](18) NOT NULL,
	[TipoDocumento] [varchar](5) NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[NumeroDocumentoAjustado] [varchar](20) NULL,
	[RazaoSocial] [varchar](255) NOT NULL,
	[Vigencia] [varchar](63) NULL,
	[Objeto] [varchar](106) NOT NULL,
	[ValorContrato] [money] NULL,
	[EstagioContrato] [varchar](15) NOT NULL,
	[SituacaoContrato] [varchar](50) NOT NULL,
	[SiglaUG] [varchar](20) NULL,
	[CodigoUG] [int] NULL,
	[CodigoEfiscoUG] [char](6) NULL,
	[CodigoAudinUG] [varchar](20) NULL,
	[PortariaComissaoLicitacao] [varchar](100) NULL,
	[LinkArquivo] [varchar](500) NULL,
	[UnidadeOrcamentaria] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INET_ContasPrefeito]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INET_ContasPrefeito](
	[Processo] [char](8) NULL,
	[Prefeito] [varchar](80) NULL,
	[Municipio] [char](4) NOT NULL,
	[NomeMunicipio] [varchar](40) NOT NULL,
	[Ano] [varchar](4) NOT NULL,
	[Descricao] [varchar](60) NULL,
	[ParecerTCE] [varchar](50) NULL,
	[StatusCamara] [varchar](50) NULL,
	[Descricao2] [varchar](60) NULL,
	[ParecerTCE2] [varchar](50) NULL,
	[StatusCamara2] [varchar](50) NULL,
	[Inspetoria] [char](6) NULL,
	[CodigoTipoParecer] [int] NOT NULL,
	[CodigoTipoParecer2] [int] NULL,
	[SiglaTipoParecer] [varchar](6) NOT NULL,
	[SiglaTipoParecer2] [varchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUNICIPIO]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUNICIPIO](
	[CODIGO] [char](4) NOT NULL,
	[NOME] [varchar](40) NOT NULL,
	[CUNIFED] [char](2) NOT NULL,
	[CodigoSagres] [int] NOT NULL,
	[CodigoIBGE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_Doacoes]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_Doacoes](
	[Id] [int] NOT NULL,
	[Municipio] [varchar](40) NULL,
	[Destino] [nvarchar](513) NULL,
	[Partido] [nvarchar](255) NULL,
	[CPFCNPJ] [nvarchar](255) NULL,
	[NomeDoador] [nvarchar](255) NULL,
	[SetorEconomicoDoador] [nvarchar](255) NULL,
	[DataDoacao] [datetime] NULL,
	[ValorDoacao] [real] NULL,
	[Ano] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_LicitacoesDetalhes]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_LicitacoesDetalhes](
	[NumeroDocumentoAjustado] [char](30) NULL,
	[RazaoSocial] [varchar](255) NULL,
	[codigoPL] [int] NULL,
	[codigoUG] [int] NULL,
	[UG] [varchar](200) NULL,
	[NomeNatureza] [varchar](25) NULL,
	[NomeModalidade] [varchar](100) NULL,
	[NumeroModalidade] [int] NULL,
	[AnoModalidade] [int] NULL,
	[DescricaoObjeto] [varchar](100) NULL,
	[EspecificacaoObjeto] [varchar](2000) NULL,
	[SituacaoLicitacao] [varchar](50) NULL,
	[EstagioLicitacao] [varchar](60) NULL,
	[DataPublicacaoHomologacao] [datetime] NULL,
	[TotalAdjudicadoLicitacao] [money] NULL,
	[TotalAdjudicadoLicitante] [money] NULL,
	[ResultadoHabilitacao] [varchar](50) NULL,
	[Adjudicada] [varchar](14) NOT NULL,
	[QtdeLicitantes] [int] NULL,
	[CodigoModalidade] [int] NULL,
	[NumeroProcesso] [int] NULL,
	[AnoProcesso] [int] NULL,
	[DataEmissaoEdital] [datetime] NULL,
	[DataPublicacaoHabilitacao] [datetime] NULL,
	[DataPublicacaoJulgamento] [datetime] NULL,
	[CaracteristicaObjeto] [varchar](60) NULL,
	[ObjetoConformeEdital] [varchar](1000) NULL,
	[LinkArquivo] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_Obras]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_Obras](
	[Codigo] [int] NOT NULL,
	[Municipio] [varchar](40) NULL,
	[UG] [varchar](200) NULL,
	[Titulo] [varchar](500) NULL,
	[DataUltimaAuditoria] [datetime] NULL,
	[CodigoMunicipio] [char](4) NULL,
	[CodigoUG] [int] NULL,
	[LocalExecucao] [varchar](300) NULL,
	[DataInicial] [datetime] NULL,
	[AnoInicial] [int] NULL,
	[Prazo] [int] NULL,
	[PrazoAditado] [int] NULL,
	[PrazoParalizacao] [int] NULL,
	[NaturezaIntervencao] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_ObrasDadosAuditoria]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_ObrasDadosAuditoria](
	[Obra] [int] NOT NULL,
	[DataUltimaAuditoria] [datetime] NULL,
	[ValorInicialContratado] [decimal](13, 2) NULL,
	[ValorAditado] [decimal](13, 2) NULL,
	[DespesaPaga] [decimal](13, 2) NULL,
	[ValorTotal] [decimal](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_ObrasDadosContratacao]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_ObrasDadosContratacao](
	[Obra] [int] NOT NULL,
	[Pessoa] [varchar](150) NULL,
	[Logradouro] [varchar](100) NULL,
	[Numero] [varchar](40) NULL,
	[Complemento] [varchar](150) NULL,
	[Bairro] [varchar](40) NULL,
	[CEP] [varchar](20) NULL,
	[CPFCNPJ] [varchar](14) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_ParticipantesComuns]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_ParticipantesComuns](
	[Id] [bigint] NULL,
	[NumeroDocumentoAjustado] [char](30) NULL,
	[Total] [int] NULL,
	[plCodigo] [int] NULL,
	[RazaoSocial] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_Pessoa]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_Pessoa](
	[CPFCNPJ] [char](14) NOT NULL,
	[Nome] [varchar](255) NULL,
	[TipoCredor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_TransporteEscolar]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_TransporteEscolar](
	[Codigo] [int] NOT NULL,
	[Municipio] [varchar](40) NULL,
	[UG] [varchar](200) NULL,
	[Titulo] [varchar](500) NULL,
	[DataUltimaAuditoria] [datetime] NULL,
	[CodigoMunicipio] [char](4) NULL,
	[CodigoUG] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_UJsEstaduais]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_UJsEstaduais](
	[ID_UNIDADEGESTORA] [char](6) NOT NULL,
	[NOME_UNIDADE_GESTORA] [varchar](200) NOT NULL,
	[CODIGO_TCE] [int] NULL,
 CONSTRAINT [PK_SCA_UJsEstaduais] PRIMARY KEY CLUSTERED 
(
	[ID_UNIDADEGESTORA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCA_UJsMunicipais]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCA_UJsMunicipais](
	[ID_UNIDADE_GESTORA] [int] NOT NULL,
	[NOME_UNIDADE_GESTORA] [varchar](200) NOT NULL,
	[CODIGO_MUNICIPIO_UNIDADE_GESTORA] [char](4) NOT NULL,
	[NATUREZA_ORGAO] [int] NOT NULL,
	[EXERCICIO] [int] NOT NULL,
	[ULTIMA_ATUALIZACAO] [datetime] NULL,
 CONSTRAINT [PK_SCA_UJsMunicipais] PRIMARY KEY CLUSTERED 
(
	[ID_UNIDADE_GESTORA] ASC,
	[EXERCICIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TermoAditivo]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TermoAditivo](
	[UnidadeGestora] [varchar](200) NOT NULL,
	[Esfera] [char](2) NOT NULL,
	[Municipio] [varchar](40) NOT NULL,
	[NumeroTermoAditivo] [varchar](10) NULL,
	[AnoTermoAditivo] [int] NOT NULL,
	[Vigencia] [varchar](63) NULL,
	[NumeroContrato] [varchar](10) NULL,
	[AnoContrato] [int] NOT NULL,
	[CPF_CNPJ] [varchar](18) NOT NULL,
	[TipoDocumento] [varchar](5) NULL,
	[NumeroDocumento] [varchar](18) NULL,
	[NumeroDocumentoAjustado] [varchar](30) NULL,
	[RazaoSocial] [varchar](255) NOT NULL,
	[ObjetoAditivo] [varchar](106) NOT NULL,
	[JustificativaTermoAditivo] [varchar](1000) NULL,
	[ValorAcrescimo] [numeric](26, 4) NULL,
	[ValorReducao] [numeric](26, 4) NULL,
	[ValorTermoAditivo] [numeric](26, 4) NULL,
	[EstagioContrato] [varchar](15) NOT NULL,
	[SituacaoContrato] [varchar](50) NOT NULL,
	[SiglaUG] [varchar](20) NULL,
	[CodigoUG] [int] NULL,
	[CodigoEfiscoUG] [char](6) NULL,
	[CodigoAudinUG] [varchar](20) NULL,
	[LinkArquivo] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_ATOPESSOAL]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_ATOPESSOAL](
	[ID_TIPOATOPESSOAL] [int] NOT NULL,
	[DE_TIPOATOPESSOAL] [varchar](100) NOT NULL,
	[NU_TIPOATOPESSOAL] [int] NOT NULL,
	[ID_TIPOMOVIMENTACAO] [int] NOT NULL,
	[DT_ANOREFERENCIA] [int] NOT NULL,
 CONSTRAINT [PK_TIPO_ATOPESSOAL] PRIMARY KEY CLUSTERED 
(
	[ID_TIPOATOPESSOAL] ASC,
	[DT_ANOREFERENCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_CREDOR]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_CREDOR](
	[ID_TIPO_CREDOR] [int] NOT NULL,
	[NUMERO] [int] NOT NULL,
	[DESCRICAO] [varchar](40) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_ESCOLARIDADE]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_ESCOLARIDADE](
	[ID_TIPOESCOLARIDADE] [int] NOT NULL,
	[DE_TIPOESCOLARIDADE] [varchar](40) NOT NULL,
	[NU_TIPOESCOLARIDADE] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOESCOLARIDADE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_FOLHA]    Script Date: 03/02/2019 11:43:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_FOLHA](
	[ID_TIPOFOLHA] [int] NOT NULL,
	[DE_TIPOFOLHA] [varchar](40) NOT NULL,
	[NU_TIPOFOLHA] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOFOLHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_FONTERECURSO]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_FONTERECURSO](
	[ID_TIPOFONTERECURSO] [int] NOT NULL,
	[DE_TIPOFONTERECURSO] [varchar](40) NOT NULL,
	[NU_TIPOFONTERECURSO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOFONTERECURSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_MOTIVOINATIVACAO]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_MOTIVOINATIVACAO](
	[ID_TIPOMOTIVOINATIVACAO] [int] NOT NULL,
	[DE_TIPOMOTIVOINATIVACAO] [varchar](40) NOT NULL,
	[NU_TIPOMOTIVOINATIVACAO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOMOTIVOINATIVACAO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_MOVIMENTACAO]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_MOVIMENTACAO](
	[ID_TIPOMOVIMENTACAO] [int] NOT NULL,
	[DE_TIPOMOVIMENTACAO] [varchar](20) NOT NULL,
	[NU_TIPOMOVIMENTACAO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOMOVIMENTACAO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_REGIMEPREVIDENCIARIO]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_REGIMEPREVIDENCIARIO](
	[ID_TIPOREGIMEPREVIDENCIARIO] [int] NOT NULL,
	[DE_TIPOREGIMEPREVIDENCIARIO] [varchar](40) NOT NULL,
	[NU_TIPOREGIMEPREVIDENCIARIO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOREGIMEPREVIDENCIARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_REGIMETRABALHO]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_REGIMETRABALHO](
	[ID_TIPOREGIMETRABALHO] [int] NOT NULL,
	[DE_TIPOREGIMETRABALHO] [varchar](40) NOT NULL,
	[NU_TIPOREGIMETRABALHO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOREGIMETRABALHO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_SITUACAOFUNCIONAL]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_SITUACAOFUNCIONAL](
	[ID_TIPOSITUACAOFUNCIONAL] [int] NOT NULL,
	[DE_TIPOSITUACAOFUNCIONAL] [varchar](40) NOT NULL,
	[NU_TIPOSITUACAOFUNCIONAL] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOSITUACAOFUNCIONAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_VINCULO]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_VINCULO](
	[ID_TIPOVINCULO] [int] NOT NULL,
	[DE_TIPOVINCULO] [varchar](50) NOT NULL,
	[ST_VENCIMENTOBASE] [tinyint] NOT NULL,
	[NU_TIPOVINCULO] [int] NOT NULL,
	[ID_TIPOSITUACAOFUNCIONAL] [int] NULL,
	[de_TIPOSITUACAOFUNCIONAL] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPOVINCULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UG]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UG](
	[ID_UNIDADE_GESTORA] [int] NOT NULL,
	[CODIGOTCE] [varchar](6) NULL,
	[ESFERA] [varchar](10) NULL,
	[CODIGOMUNICIPIO] [char](4) NOT NULL,
	[MUNICIPIO] [varchar](40) NOT NULL,
	[ORGAO] [varchar](200) NOT NULL,
	[SIGLA] [varchar](20) NULL,
	[SITUACAO] [varchar](40) NULL,
	[CNPJ] [char](14) NOT NULL,
	[PODER] [varchar](30) NULL,
	[UNIFED] [char](2) NOT NULL,
	[TipoPessoaJuridicaPublica] [varchar](25) NULL,
	[NATUREZA] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CARGO_DE_UGGESTORA]    Script Date: 03/02/2019 11:43:55 ******/
CREATE NONCLUSTERED INDEX [IX_CARGO_DE_UGGESTORA] ON [dbo].[CARGO]
(
	[DE_UGGESTORA] ASC
)
INCLUDE ( 	[ID_CARGO],
	[DT_ANOREFERENCIA],
	[NU_CARGAHORARIA],
	[DT_MESREFERENCIA],
	[NO_CARGO],
	[DE_TIPOESCOLARIDADE]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CARGO_NU_CARGAHORARIA]    Script Date: 03/02/2019 11:43:55 ******/
CREATE NONCLUSTERED INDEX [IX_CARGO_NU_CARGAHORARIA] ON [dbo].[CARGO]
(
	[NU_CARGAHORARIA] ASC
)
INCLUDE ( 	[ID_CARGO],
	[DT_ANOREFERENCIA],
	[DT_MESREFERENCIA],
	[NO_CARGO],
	[DE_TIPOESCOLARIDADE],
	[DE_UGGESTORA]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PORTAL_ListaServidores]    Script Date: 03/02/2019 11:43:55 ******/
CREATE NONCLUSTERED INDEX [IX_PORTAL_ListaServidores] ON [dbo].[PORTAL_LISTASERVIDORES]
(
	[NU_CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SCA_EmpenhoLiquidacao_Empenho_UG]    Script Date: 03/02/2019 11:43:55 ******/
CREATE NONCLUSTERED INDEX [IX_SCA_EmpenhoLiquidacao_Empenho_UG] ON [dbo].[SCA_EmpenhoLiquidacao]
(
	[NUMERO_EMPENHO] ASC,
	[ID_UNIDADE_GESTORA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SCAEmpenhoLiquidacao_ID_EMPENHO_UG_ANO]    Script Date: 03/02/2019 11:43:55 ******/
CREATE NONCLUSTERED INDEX [IX_SCAEmpenhoLiquidacao_ID_EMPENHO_UG_ANO] ON [dbo].[SCA_EmpenhoLiquidacao]
(
	[ID_EMPENHO] ASC,
	[ID_UNIDADE_GESTORA] ASC,
	[ANO_REFERENCIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_EscreveArquivo]    Script Date: 03/02/2019 11:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EscreveArquivo] (
    @String VARCHAR(MAX),
    @Ds_Arquivo VARCHAR(1501)
)
AS
BEGIN
 
    DECLARE
        @objFileSystem INT,
        @objTextStream INT,
        @objErrorObject INT,
        @strErrorMessage VARCHAR(1000),
        @Command VARCHAR(1000),
        @hr INT
 
    SET NOCOUNT ON
 
    SELECT
        @strErrorMessage = 'opening the File System Object'
    
    EXECUTE @hr = sp_OACreate
        'Scripting.FileSystemObject',
        @objFileSystem OUT
 
    
    IF @HR = 0
        SELECT
            @objErrorObject = @objFileSystem,
            @strErrorMessage = 'Creating file "' + @Ds_Arquivo + '"'
    
    
    IF @HR = 0
        EXECUTE @hr = sp_OAMethod
            @objFileSystem,
            'CreateTextFile',
            @objTextStream OUT,
            @Ds_Arquivo,
            2,
            True
 
    IF @HR = 0
        SELECT
            @objErrorObject = @objTextStream,
            @strErrorMessage = 'writing to the file "' + @Ds_Arquivo + '"'
    
    
    IF @HR = 0
        EXECUTE @hr = sp_OAMethod
            @objTextStream,
            'Write',
            NULL,
            @String
 
    
    IF @HR = 0
        SELECT
            @objErrorObject = @objTextStream,
            @strErrorMessage = 'closing the file "' + @Ds_Arquivo + '"'
    
    
    IF @HR = 0
        EXECUTE @hr = sp_OAMethod
            @objTextStream,
            'Close'
 
    
    IF @hr <> 0
    BEGIN
    
        DECLARE
            @Source VARCHAR(255),
            @Description VARCHAR(255),
            @Helpfile VARCHAR(255),
            @HelpID INT
    
        EXECUTE sp_OAGetErrorInfo
            @objErrorObject,
            @source OUTPUT,
            @Description OUTPUT,
            @Helpfile OUTPUT,
            @HelpID OUTPUT
        
        
        SELECT
            @strErrorMessage = 'Error whilst ' + COALESCE(@strErrorMessage, 'doing something') + ', ' + COALESCE(@Description, '')
        
        
        RAISERROR (@strErrorMessage,16,1)
        
    END
    
    
    EXECUTE sp_OADestroy
        @objTextStream
    
    EXECUTE sp_OADestroy
        @objTextStream
        
END
GO
USE [master]
GO
ALTER DATABASE [TomeConta] SET  READ_WRITE 
GO
