-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: forum
-- ------------------------------------------------------
-- Server version	8.0.37

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
  `txt_area_atuacao` text,
  PRIMARY KEY (`cd_area_atuacao`),
  UNIQUE KEY `area_atuacao_UQ01` (`nm_area_atuacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Estrutura que armazena informações das areas de atuação da pessoa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_area_atuacao`
--

LOCK TABLES `tb_area_atuacao` WRITE;
/*!40000 ALTER TABLE `tb_area_atuacao` DISABLE KEYS */;
INSERT INTO `tb_area_atuacao` VALUES (1,'Análise e Desenvolvimento de Sistemas','Olá, sou um entusiasta da tecnologia com uma paixão por desenvolver soluções inovadoras que atendam às necessidades do mercado. Com profundo conhecimento em linguagens de programação e metodologias ágeis, estou sempre em busca de novos desafios para aplicar meu expertise em análise e desenvolvimento de sistemas. Minha habilidade em pensar de forma analítica e minha criatividade me permitem criar soluções robustas e eficientes que impulsionam o sucesso de projetos de software.\n'),(2,'Comunicação e Informação','Olá! Sou um comunicador nato, apaixonado por contar histórias e transmitir informações de forma clara e envolvente. Com habilidades excepcionais em redação, edição e gerenciamento de conteúdo, tenho experiência em desenvolver estratégias de comunicação eficazes que fortalecem a presença de marcas e geram engajamento com o público-alvo. Minha criatividade e minha capacidade de entender as necessidades do público me permitem criar conteúdo relevante e impactante que conecta e inspira.\n'),(3,'Engenharia e Produção','Olá! Sou um engenheiro comprometido com a excelência e a inovação. Com ampla experiência em projetos de engenharia e produção, estou sempre em busca de maneiras de otimizar processos e garantir a qualidade e eficiência dos produtos. Minha habilidade em analisar problemas complexos e encontrar soluções criativas, aliada à minha experiência em liderar equipes multidisciplinares, me permite impulsionar o desenvolvimento de projetos e alcançar resultados excepcionais.'),(4,'Administração, negócios e serviços','Olá! Sou apaixonado por desafios e por encontrar soluções que impulsionem o crescimento de empresas. Com vasta experiência em estratégias de gestão e liderança, estou sempre buscando novas oportunidades para otimizar processos e maximizar resultados. Minha abordagem proativa e minha habilidade em identificar oportunidades de mercado me permitem contribuir significativamente para o sucesso de qualquer organização.\n');
/*!40000 ALTER TABLE `tb_area_atuacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa`
--

DROP TABLE IF EXISTS `tb_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pessoa` (
  `cd_pessoa` int NOT NULL AUTO_INCREMENT,
  `nome_pessoa` varchar(250) NOT NULL,
  `email_pessoa` varchar(250) NOT NULL,
  `senha_pessoa` varchar(250) NOT NULL,
  PRIMARY KEY (`cd_pessoa`),
  UNIQUE KEY `pessoa_UQ01` (`email_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabela para armazenar os registros de pessoa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa`
--

LOCK TABLES `tb_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
INSERT INTO `tb_pessoa` VALUES (17,'Helena','helena@email.com','$2a$10$w3EDrhqhHml0NInTe3izzePJCdBtF8Ir89SfKMxHU./Mm1pxFrTTa'),(18,'Rafael','rafael@email.com','$2a$10$YW0k2xi.Hw97YWns.BSZmetjDl1UuvnC6m/16/MUhZiTXJY6J.bm2'),(19,'Nabal','nabal@email.com','$2a$10$mUUUvccg4fsYOvlCVETBROx8M.PHhp9HaLwafxukay.6eKr1yZdXO'),(20,'Marilia','marilia@email.com','$2a$10$z0KwAw8gjL9tQmf25X7RCe2//dlHQE3tWhZHcIalqYuOobndGbCCe');
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
  PRIMARY KEY (`cd_pessoa`,`cd_area_atuacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa_area`
--

LOCK TABLES `tb_pessoa_area` WRITE;
/*!40000 ALTER TABLE `tb_pessoa_area` DISABLE KEYS */;
INSERT INTO `tb_pessoa_area` VALUES (17,4),(18,2),(19,3),(20,1);
/*!40000 ALTER TABLE `tb_pessoa_area` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-11 21:32:39
