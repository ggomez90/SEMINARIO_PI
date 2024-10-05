CREATE DATABASE  IF NOT EXISTS `complemento_moda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `complemento_moda`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: complemento_moda
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `dniCliente` int NOT NULL,
  `activoCliente` tinyint NOT NULL,
  `nombresCliente` varchar(60) NOT NULL,
  `apellidosCliente` varchar(60) NOT NULL,
  `telefonoCliente` varchar(45) DEFAULT NULL,
  `direccionCliente` varchar(60) DEFAULT NULL,
  `provinciaCliente` varchar(45) DEFAULT NULL,
  `localidadCliente` varchar(60) DEFAULT NULL,
  `sexoCliente` varchar(45) DEFAULT NULL,
  `fechaNacimientoCliente` date DEFAULT NULL,
  `idCtaCteCliente` int DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `FK_Cliente_CtaCte_idx` (`idCtaCteCliente`),
  CONSTRAINT `FK_Cliente_CtaCte` FOREIGN KEY (`idCtaCteCliente`) REFERENCES `cuentacorriente` (`idCuentaCorriente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (10,35750818,1,'Guillermo Luis','Gomez','3491469029','General Rondeau 286','SANTA FE','Ceres','Masculino','1990-12-30',1),(11,36552541,1,'Daiana','Pereyra','3491465028','Av Campuzano 50','SANTIAGO DEL ESTERO','Selva','Femenino','1991-12-29',2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentacorriente`
--

DROP TABLE IF EXISTS `cuentacorriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentacorriente` (
  `idCuentaCorriente` int NOT NULL AUTO_INCREMENT,
  `idClienteProveedor` int NOT NULL,
  PRIMARY KEY (`idCuentaCorriente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentacorriente`
--

LOCK TABLES `cuentacorriente` WRITE;
/*!40000 ALTER TABLE `cuentacorriente` DISABLE KEYS */;
INSERT INTO `cuentacorriente` VALUES (1,10),(2,11),(3,1),(4,2);
/*!40000 ALTER TABLE `cuentacorriente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `fechaIngresoEmpleado` date NOT NULL,
  `fechaEgresoEmpleado` date DEFAULT NULL,
  `salarioEmpleado` double NOT NULL,
  `nombresEmpleado` varchar(60) NOT NULL,
  `apellidosEmpleado` varchar(60) NOT NULL,
  `dniEmpleado` int NOT NULL,
  `telefonoEmpleado` varchar(45) NOT NULL,
  `direccionEmpleado` varchar(50) NOT NULL,
  `provinciaEmpleado` varchar(45) NOT NULL,
  `localidadEmpleado` varchar(45) NOT NULL,
  `fechaNacEmpleado` date NOT NULL,
  `sexoEmpleado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='						';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'2024-10-04',NULL,950000,'Alfredo','Alfano',16416620,'3491468020','Calle Sarmiento S/N','SANTIAGO DEL ESTERO','SELVA','1980-02-14','MASCULINO');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `idMovimiento` int NOT NULL AUTO_INCREMENT,
  `codigoMovimiento` int NOT NULL,
  `detalleMovimiento` varchar(100) NOT NULL,
  `montoDebeMovimiento` double DEFAULT NULL,
  `montoHaberMovimiento` double DEFAULT NULL,
  `saldoMovimiento` double NOT NULL,
  `idCtaCte` int NOT NULL,
  PRIMARY KEY (`idMovimiento`),
  KEY `FK_Movimiento_CtaCte_idx` (`idCtaCte`),
  CONSTRAINT `FK_Movimiento_CtaCte` FOREIGN KEY (`idCtaCte`) REFERENCES `cuentacorriente` (`idCuentaCorriente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='							';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (2,1,'COMPRA INDUMENTARIA VARIA',52000,0,52000,1),(3,2,'COMPRA INDUMENTARIA VARIA',187000,0,187000,2),(4,3,'COMPRA INDUMENTARIA VARIA',419000,0,419000,1);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `codigoProducto` int NOT NULL,
  `detalleProducto` varchar(100) NOT NULL,
  `talleProducto` varchar(45) DEFAULT NULL,
  `precioProducto` double NOT NULL,
  `marcaProducto` varchar(50) DEFAULT NULL,
  `materialProducto` varchar(50) DEFAULT NULL,
  `categoriaProducto` varchar(45) NOT NULL,
  `stockProducto` int NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Jean hombre','42',26000,'Taverniti','Jean','HOMBRE',30),(2,2,'Jean hombre clasico','40',22000,'Mistral','Jean','HOMBRE',23),(3,3,'Jean hombre con rotura','44',28000,'AF','Jean','HOMBRE',13),(4,4,'Jean mujer clasico','38',31000,'AF','Jean','MUJER',16),(5,5,'Jean mujer blanco','36',36000,'Zara','Jean','MUJER',10),(6,6,'Jean mujer con parche','34',31000,'Frame','Jean','MUJER',15),(7,7,'Jean mujer con rotura','32',41000,'Fiume','Jean','MUJER',22);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `dniProveedor` int NOT NULL,
  `nombresProveedor` varchar(60) NOT NULL,
  `apellidosProveedor` varchar(60) NOT NULL,
  `telefonoProveedor` varchar(45) DEFAULT NULL,
  `provinciaProveedor` varchar(45) DEFAULT NULL,
  `localidadProveedor` varchar(45) DEFAULT NULL,
  `direccionProveedor` varchar(45) DEFAULT NULL,
  `ctaCteProveedor` int DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `FK_Proveedor_CtaCte_idx` (`ctaCteProveedor`),
  CONSTRAINT `FK_Proveedor_CtaCte` FOREIGN KEY (`ctaCteProveedor`) REFERENCES `cuentacorriente` (`idCuentaCorriente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,25750818,'Juan Manuel','Borgogno','3491685030','BUENOS AIRES','CABA','Avellaneda 4566',3),(2,33564258,'Marcelo','Manfredi','11699321355','BUENOS AIRES','CABA','Avellaneda 4566',4);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(20) NOT NULL,
  `claveUsuario` varchar(20) NOT NULL,
  `idEmpleadoUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `FK_Usuario_Empleado_idx` (`idEmpleadoUsuario`),
  CONSTRAINT `FK_Usuario_Empleado` FOREIGN KEY (`idEmpleadoUsuario`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin',NULL),(2,'aalfano','alfano2024',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `codigoVenta` int NOT NULL,
  `cantidadProducto1` int NOT NULL,
  `totalVenta` double NOT NULL,
  `formaPagoVenta` varchar(45) NOT NULL,
  `idClienteVenta` int NOT NULL,
  `idProducto1` int NOT NULL,
  `idProducto2` int DEFAULT NULL,
  `idProducto3` int DEFAULT NULL,
  `idProducto4` int DEFAULT NULL,
  `idProducto5` int DEFAULT NULL,
  `idProducto6` int DEFAULT NULL,
  `idProducto7` int DEFAULT NULL,
  `idProducto8` int DEFAULT NULL,
  `idProducto9` int DEFAULT NULL,
  `idProducto10` int DEFAULT NULL,
  `cantidadProducto2` int DEFAULT NULL,
  `cantidadProducto3` int DEFAULT NULL,
  `cantidadProducto4` int DEFAULT NULL,
  `cantidadProducto5` int DEFAULT NULL,
  `cantidadProducto6` int DEFAULT NULL,
  `cantidadProducto7` int DEFAULT NULL,
  `cantidadProducto8` int DEFAULT NULL,
  `cantidadProducto9` int DEFAULT NULL,
  `cantidadProducto10` int DEFAULT NULL,
  `subTotalVenta1` double NOT NULL,
  `subTotalVenta2` double DEFAULT NULL,
  `subTotalVenta3` double DEFAULT NULL,
  `subTotalVenta4` double DEFAULT NULL,
  `subTotalVenta5` double DEFAULT NULL,
  `subTotalVenta6` double DEFAULT NULL,
  `subTotalVenta7` double DEFAULT NULL,
  `subTotalVenta8` double DEFAULT NULL,
  `subTotalVenta9` double DEFAULT NULL,
  `subTotalVenta10` double DEFAULT NULL,
  `PrecioUnitarioP1` double DEFAULT NULL,
  `PrecioUnitarioP2` double DEFAULT NULL,
  `PrecioUnitarioP3` double DEFAULT NULL,
  `PrecioUnitarioP4` double DEFAULT NULL,
  `PrecioUnitarioP5` double DEFAULT NULL,
  `PrecioUnitarioP6` double DEFAULT NULL,
  `PrecioUnitarioP7` double DEFAULT NULL,
  `PrecioUnitarioP8` double DEFAULT NULL,
  `PrecioUnitarioP9` double DEFAULT NULL,
  `PrecioUnitarioP10` double DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `FK_Venta_Cliente_idx` (`idClienteVenta`),
  KEY `FK_Venta_Producto2_idx` (`idProducto2`),
  KEY `FK_Venta_Producto1_idx` (`idProducto1`),
  KEY `FK_Venta_Producto3_idx` (`idProducto3`),
  KEY `FK_Venta_Producto4_idx` (`idProducto4`),
  KEY `FK_Venta_Producto5_idx` (`idProducto5`),
  KEY `FK_Venta_Producto6_idx` (`idProducto6`),
  KEY `FK_Venta_Producto7_idx` (`idProducto7`),
  KEY `FK_Venta_Producto8_idx` (`idProducto8`),
  KEY `FK_Venta_Producto9_idx` (`idProducto9`),
  KEY `FK_Venta_Producto10_idx` (`idProducto10`,`idProducto9`,`idProducto8`,`idProducto7`,`idProducto6`,`idProducto5`,`idProducto4`,`idProducto3`,`idProducto2`,`idProducto1`),
  CONSTRAINT `FK_Venta_Cliente` FOREIGN KEY (`idClienteVenta`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `FK_Venta_Producto1` FOREIGN KEY (`idProducto1`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto10` FOREIGN KEY (`idProducto10`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto2` FOREIGN KEY (`idProducto2`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto3` FOREIGN KEY (`idProducto3`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto4` FOREIGN KEY (`idProducto4`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto5` FOREIGN KEY (`idProducto5`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto6` FOREIGN KEY (`idProducto6`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto7` FOREIGN KEY (`idProducto7`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto8` FOREIGN KEY (`idProducto8`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `FK_Venta_Producto9` FOREIGN KEY (`idProducto9`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (3,1,2,52000,'TARJETA CREDITO',10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,1,187000,'CUENTA CORRIENTE',11,2,5,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22000,72000,93000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22000,36000,31000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,3,2,419000,'TARJETA CREDITO',10,6,7,2,1,5,4,NULL,NULL,NULL,NULL,2,1,2,3,3,NULL,NULL,NULL,NULL,62000,82000,22000,52000,108000,93000,NULL,NULL,NULL,NULL,31000,41000,22000,26000,36000,31000,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-05  1:15:02
