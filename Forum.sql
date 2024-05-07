CREATE DATABASE  IF NOT EXISTS `forum` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `forum`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: forum
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_area_atuacao`
--

DROP TABLE IF EXISTS `tb_area_atuacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_area_atuacao` (
  `cd_area_atuacao` int NOT NULL,
  `nm_area_atuacao` varchar(45) NOT NULL,
  `ds_area_atuacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_area_atuacao`),
  UNIQUE KEY `area_atuacao_UQ01` (`nm_area_atuacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Estrutura que armazena informações das areas de atuação da pessoa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_area_atuacao`
--

LOCK TABLES `tb_area_atuacao` WRITE;
/*!40000 ALTER TABLE `tb_area_atuacao` DISABLE KEYS */;
INSERT INTO `tb_area_atuacao` VALUES (1,'Análise e Desenvolvimento de Sistemas',NULL),(2,'Comunicação e Informação',NULL),(3,'Engenharia e Produção',NULL),(4,'Administração, negócios e serviços',NULL);
/*!40000 ALTER TABLE `tb_area_atuacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa`
--

DROP TABLE IF EXISTS `tb_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pessoa` (
  `cd_pessoa` int NOT NULL,
  `nome_pessoa` varchar(250) NOT NULL,
  `email_pessoa` varchar(250) NOT NULL,
  `senha_pessoa` varchar(45) NOT NULL,
  `documento_pessoa` varchar(14) NOT NULL,
  `tipo_pessoa` varchar(1) NOT NULL,
  PRIMARY KEY (`cd_pessoa`),
  UNIQUE KEY `pessoa_UQ01` (`email_pessoa`),
  UNIQUE KEY `pessoa_UQ02` (`documento_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabela para armazenar os registros de pessoa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa`
--

LOCK TABLES `tb_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
INSERT INTO `tb_pessoa` VALUES (1,'Helena carvalho','helena.carvalho@gmail.com','202cb962ac59075b964b07152d234b70','94563204056','1'),(2,'Rafael Menezes Gonçalves','rafael.mg@gmail.com','202cb962ac59075b964b07152d234b70','57952866052','1');
/*!40000 ALTER TABLE `tb_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa_area`
--

DROP TABLE IF EXISTS `tb_pessoa_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pessoa_area` (
  `cd_pessoa` int NOT NULL,
  `cd_area_atuacao` int NOT NULL,
  `dt_inicio_vigencia` date NOT NULL,
  `dt_fim_vigencia` date DEFAULT NULL,
  PRIMARY KEY (`cd_pessoa`,`cd_area_atuacao`),
  KEY `cd_area_atuacao_idx` (`cd_area_atuacao`),
  CONSTRAINT `pessoa_area_FK01` FOREIGN KEY (`cd_area_atuacao`) REFERENCES `tb_area_atuacao` (`cd_area_atuacao`),
  CONSTRAINT `pessoa_area_FK02` FOREIGN KEY (`cd_pessoa`) REFERENCES `tb_pessoa` (`cd_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa_area`
--

LOCK TABLES `tb_pessoa_area` WRITE;
/*!40000 ALTER TABLE `tb_pessoa_area` DISABLE KEYS */;
INSERT INTO `tb_pessoa_area` VALUES (1,2,'2024-01-01',NULL),(1,3,'2024-01-01',NULL),(1,4,'2024-01-01',NULL),(2,1,'2024-01-01',NULL),(2,3,'2024-01-01',NULL);
/*!40000 ALTER TABLE `tb_pessoa_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'forum'
--

--
-- Dumping routines for database 'forum'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 13:16:46
