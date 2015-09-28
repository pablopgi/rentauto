DROP SCHEMA IF EXISTS Epers_Rentauto;
CREATE SCHEMA Epers_Rentauto;

USE Epers_Rentauto;

CREATE TABLE  `Epers_Rentauto`.`usuarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) NOT NULL,
  `NOMBRE_USUARIO` varchar(20) NOT NULL,
  `APELLIDO` varchar(20) NOT NULL,
  `EMAIL` varchar(20),
  `FECHA_NACIMIENTO` date NOT NULL,
  `ESTA_VALIDADA` boolean,
  `CODIGO_VALIDACION` varchar(30),
  `PASSWORD` varchar(20),
  PRIMARY KEY (`ID`)
) ENGINE = InnoDB AUTO_INCREMENT=1;
