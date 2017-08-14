-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2017 a las 02:37:11
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyect`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarProductos` ()  SELECT P.CodigoProd,P.Nombre,P.Descripcion,P.Precio,P.Imagen,P.Marca,P.Categoria,P.Deporte
FROM producto P ORDER BY P.Nombre$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `IdCategoria` int(11) NOT NULL,
  `Categoria` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IdCategoria`, `Categoria`) VALUES
(1, 'Gimnasio'),
(2, 'Ropa'),
(3, 'Calzado'),
(4, 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `IdCiudad` int(11) NOT NULL,
  `Ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`IdCiudad`, `Ciudad`) VALUES
(1, 'Bogota Dc'),
(2, 'Cali'),
(3, 'Barranquilla'),
(4, 'Bucaramanga'),
(5, 'Cartagena'),
(6, 'Chia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Tipo_Documento` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Cedula` bigint(30) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Telefono` bigint(30) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Ciudad` int(11) DEFAULT NULL,
  `Codigo` varchar(45) DEFAULT NULL,
  `Rol` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Tipo_Documento`, `Cedula`, `Nombre`, `Apellido`, `Telefono`, `Fecha_Nacimiento`, `Email`, `Estado`, `Direccion`, `Ciudad`, `Codigo`, `Rol`) VALUES
('Cedula extranjera', 79683808, 'Alex', 'Lemus', 4845977, '2017-08-17', 'lemusa71@hotmail.com', 1, 'cll113b#47-23', 1, '123', 'Cliente'),
('Cedula de ciudadania', 1233692410, 'Gilberth', 'Lemus', 3144203149, '2016-12-30', 'gandrelem@hotmail.com', 1, 'cll 70', 1, '123', 'Administrador'),
('Cedula de ciudadania', 98111657521, 'Danny', 'lemus', 3136907282, '2013-08-29', 'lemusda71@hotmail.com', 1, 'Cll  170 d este', 1, '123', 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte`
--

CREATE TABLE `deporte` (
  `IdDeporte` int(11) NOT NULL,
  `Deporte` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deporte`
--

INSERT INTO `deporte` (`IdDeporte`, `Deporte`) VALUES
(1, 'Futbol'),
(2, 'Baloncesto'),
(3, 'Voleibol'),
(4, 'Tennis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `idDocumento` int(20) NOT NULL,
  `Tipo_Documento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`idDocumento`, `Tipo_Documento`) VALUES
(1, 'Cedula De Ciudadania'),
(2, 'Cedula De Extranjeria'),
(3, 'Registro Civil De Nacimiento'),
(4, 'Tarjeta De Identidad'),
(5, 'NIT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL,
  `Estado` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idEstado`, `Estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Inactivo por 5 min'),
(5, 'Inactivo por 3 dias'),
(6, 'Inactivo por 5 dias'),
(7, 'Inactivo por 1 mes'),
(8, 'Inactivo por 4 meses');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `IdCalificar` int(11) NOT NULL,
  `Comentario` varchar(30) NOT NULL,
  `Calificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`IdCalificar`, `Comentario`, `Calificacion`) VALUES
(7, 'lll', NULL),
(8, 'lll', NULL),
(9, 'Bonita Prenda', NULL),
(10, 'lol', NULL),
(11, 'jkjhgfdfgh', NULL),
(12, 'jkjhgfdfgh', NULL),
(13, 'Nose', NULL),
(14, 'sdasd', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `Marca` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `Marca`) VALUES
(1, 'Adidas'),
(2, 'Nike');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CodigoProd` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Precio` double NOT NULL,
  `Imagen` varchar(255) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Categoria` varchar(30) NOT NULL,
  `Deporte` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CodigoProd`, `Nombre`, `Descripcion`, `Precio`, `Imagen`, `Marca`, `Categoria`, `Deporte`) VALUES
(1, 'Guayos', 'Buenos Guayos', 250000, 'Guayos.jpg', 'Addidas', 'Calzado', ''),
(2, 'Camiseta', 'Es una prenda de vestir muy particular para los dias calurosos y para los dias de verano', 450000, 'Colombia.jpg', 'Nicke', 'Ropa', ''),
(3, 'Gorra', 'Bonita', 25000, 'Gorra.jpg', 'Nicke', 'Accesorios', ''),
(4, 'Moto', 'En Buen Estado', 3000000, 'Ducati.jpg', 'Ducati', 'Gimnasio', ''),
(5, 'Pelota', 'dfghjk', 78, 'Machine Space.PNG', 'Adidas', 'Adidas', 'Adidas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`IdCiudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cedula`),
  ADD KEY `Ciudad` (`Ciudad`),
  ADD KEY `Estado` (`Estado`);

--
-- Indices de la tabla `deporte`
--
ALTER TABLE `deporte`
  ADD PRIMARY KEY (`IdDeporte`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`idDocumento`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`IdCalificar`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CodigoProd`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `IdCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `IdCiudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `deporte`
--
ALTER TABLE `deporte`
  MODIFY `IdDeporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `idDocumento` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `IdCalificar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `CodigoProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`Ciudad`) REFERENCES `ciudades` (`IdCiudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`Estado`) REFERENCES `estados` (`idEstado`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
