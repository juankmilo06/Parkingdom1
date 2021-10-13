-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-05-2019 a las 21:12:01
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `parkingdom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espacio`
--

CREATE TABLE IF NOT EXISTS `espacio` (
  `num_espacio` int(11) NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`num_espacio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `espacio`
--

INSERT INTO `espacio` (`num_espacio`, `estado`) VALUES
(1, 'Disponible'),
(2, 'Disponible'),
(3, 'Disponible'),
(4, 'Disponible'),
(5, 'Disponible'),
(6, 'Disponible'),
(7, 'Disponible'),
(8, 'Disponible'),
(9, 'Disponible'),
(10, 'Disponible'),
(11, 'Disponible'),
(12, 'Disponible'),
(13, 'Disponible'),
(14, 'Disponible'),
(15, 'Disponible'),
(16, 'Disponible'),
(17, 'Disponible'),
(18, 'Disponible'),
(19, 'Disponible'),
(20, 'Disponible'),
(21, 'Disponible'),
(22, 'Disponible'),
(23, 'Disponible'),
(24, 'Disponible'),
(25, 'Disponible'),
(26, 'Disponible'),
(27, 'Disponible'),
(28, 'Disponible'),
(29, 'Disponible'),
(30, 'Disponible'),
(31, 'Disponible'),
(32, 'Disponible'),
(33, 'Disponible'),
(34, 'Disponible'),
(35, 'Disponible'),
(36, 'Disponible'),
(37, 'Disponible'),
(38, 'Disponible'),
(39, 'Disponible'),
(40, 'Disponible'),
(41, 'Disponible'),
(42, 'Disponible'),
(43, 'Disponible'),
(44, 'Disponible'),
(45, 'Disponible'),
(46, 'Disponible'),
(47, 'Disponible'),
(48, 'Disponible'),
(49, 'Disponible'),
(50, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensualidad`
--

CREATE TABLE IF NOT EXISTS `mensualidad` (
  `id_mensualidad` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(50) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `valor_mensualidad` double NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_mensualidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=114 ;

--
-- Volcado de datos para la tabla `mensualidad`
--

INSERT INTO `mensualidad` (`id_mensualidad`, `placa`, `fecha_inicio`, `fecha_fin`, `valor_mensualidad`, `estado`) VALUES
(107, 'rht476', '2018-12-01 00:00:00', '2018-12-31 00:00:00', 0, 'activo'),
(108, 'fze788', '2018-12-01 00:00:00', '2018-12-31 00:00:00', 0, 'activo'),
(109, 'epr87d', '2018-11-17 00:00:00', '2018-12-17 00:00:00', 0, 'activo'),
(110, 'poi125', '2019-01-01 00:00:00', '2019-01-30 00:00:00', 0, 'activo'),
(111, 'poi125', '2019-01-01 00:00:00', '2019-01-30 00:00:00', 0, 'activo'),
(112, 'epr87d', '2018-11-17 00:00:00', '2018-11-29 00:00:01', 0, 'activo'),
(113, 'HKN25E', '2019-05-02 00:00:00', '2019-06-01 00:00:00', 40000, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `num_documento` int(45) NOT NULL,
  `tipo_documento` varchar(10) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` int(20) DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`num_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`num_documento`, `tipo_documento`, `nombre`, `apellido`, `direccion`, `correo`, `telefono`, `observaciones`) VALUES
(123456, 'CC', 'mngf', 'dasf', 'asd', 'marto@asd.com', 3245678, 'adsfh'),
(76553467, 'CC', 'plmj', 'ijn ', 'dsafg', 'marto9610@hotmail.com', 45646546, 'adsfh'),
(103245987, 'CC', 'calvo hpta', 'calluo ', 'avenida siempre viva 123', 'zidanemetajames@hotmail.com', 123456789, 'meta ajame hpta'),
(216781237, '', 'callou', 'zidane', 'calle 14b 14-05', 'calvometajames@hotmail.com', 12312376, 'invalido'),
(1030680852, 'CC', 'Juan Camilo', 'Nieto', 'Cra 90a #46-51 sur', 'juan.laura2817@gmail.com', 2147483647, 'Ninguna'),
(1032479175, '', 'martin ', 'gaona', 'calle 19 #64b 08', 'megaona@misena.edu.co', 2147483647, NULL),
(1233509976, '', 'sebastian ', 'montaña', 'cr 89 a #69 04 sur', 'sdmontana8@misena.edu.co', 1234567, NULL),
(2147483647, '', 'prueba1', 'montaña', 'calle1 10 37', 'sdmontana8@misena.edu.co', 2147483647, 'superusuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE IF NOT EXISTS `tarifa` (
  `id_tarifa` int(10) NOT NULL AUTO_INCREMENT,
  `valor_tarifa` double NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tarifa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tarifa`
--

INSERT INTO `tarifa` (`id_tarifa`, `valor_tarifa`, `descripcion`) VALUES
(1, 30, 'moto'),
(2, 70, 'automovil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE IF NOT EXISTS `transaccion` (
  `id_transaccion` int(45) NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) NOT NULL,
  `tipo_vehiculo` varchar(45) DEFAULT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `hora_salida` datetime DEFAULT NULL,
  `tiempo_parqueo` varchar(200) DEFAULT NULL,
  `valor_tiempo` double DEFAULT NULL,
  `tipo_cliente` varchar(45) DEFAULT NULL,
  `usuario` varchar(15) NOT NULL,
  `tarifa_tr` int(11) DEFAULT NULL,
  `espacio_tr` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `fk_tarifa` (`tarifa_tr`),
  KEY `fk_espacio` (`espacio_tr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=182920 ;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`id_transaccion`, `placa`, `tipo_vehiculo`, `hora_entrada`, `hora_salida`, `tiempo_parqueo`, `valor_tiempo`, `tipo_cliente`, `usuario`, `tarifa_tr`, `espacio_tr`) VALUES
(14, 'rht476', 'Automovil', '2018-11-29 20:49:42', '2018-12-06 16:57:49', NULL, 3468525, 'temporal', 'martin', 2, 24),
(15, 'abc123', 'Automovil', '2018-11-30 10:13:09', '2018-12-11 21:18:21', NULL, 990312, 'temporal', 'martin', 2, 10),
(16, 'epr87d', 'motocicleta', '2018-11-30 10:14:03', '2019-01-22 09:12:39', NULL, 4611516, 'mensual', 'martin', 1, 10),
(17, 'ept123', 'motocicleta', '2018-11-30 20:42:50', '2018-11-30 21:13:39', NULL, 1849.000098, 'temporal', 'martin', 1, 10),
(18, 'qwe123', 'Automovil', '2018-11-30 20:49:21', '2019-01-23 16:54:49', '1 meses 53 dias 20 horas 5 minutos 28 segundos', 4601128, 'temporal', 'martin', 2, 10),
(19, 'epr87d', 'motocicleta', '2018-12-02 21:17:13', '2019-01-22 09:12:39', NULL, 4611516, 'mensual', 'martin', 1, 25),
(20, 'asd789', 'Automovil', '2018-12-06 15:51:13', '2018-12-06 15:51:31', NULL, 18.000036, 'temporal', 'admin', 2, 23),
(21, 'poi852', 'Automovil', '2018-12-06 15:52:44', '2018-12-06 15:53:12', NULL, 28, 'temporal', 'admin', 2, 22),
(22, 'abc123', 'motocicleta', '2018-12-11 21:17:45', '2018-12-11 21:18:21', NULL, 990312, 'temporal', 'martin', 1, 21),
(23, 'rht476', 'motocicleta', '2018-12-12 16:23:32', '2019-01-22 10:56:13', '1 meses 40 dias 18 horas 32 minutos 41 segundos', 3472361, 'mensual', 'martin', 1, 10),
(24, '098poi', 'Automovil', '2019-01-06 21:16:49', '2019-01-22 11:05:22', '0 meses 15 dias 13 horas 48 minutos 33 segundos', 1345713, 'temporal', 'martin', 2, 10),
(26, 'epr87d', 'Automovil', '2019-02-04 18:21:05', '2019-02-04 18:22:22', '0 meses 0 dias 0 horas 1 minutos 17 segundos', 77, 'mensual', 'martin', 2, 10),
(27, 'abc123', 'Automovil', '2019-02-04 18:37:39', '2019-02-04 18:38:04', '0 meses 0 dias 0 horas 0 minutos 25 segundos', 25, 'temporal', 'martin', 2, 10),
(28, '098poi', 'Automovil', '2019-02-04 18:40:09', '2019-02-04 18:40:40', '0 meses 0 dias 0 horas 0 minutos 31 segundos', 31, 'temporal', 'martin', 2, 10),
(30, 'ert321', 'motocicleta', '2019-02-04 19:44:07', '2019-02-04 19:46:00', '0 meses 0 dias 0 horas 1 minutos 53 segundos', 113, 'temporal', 'martin', 1, 10),
(31, 'ikm987', 'Automovil', '2019-02-04 20:22:12', NULL, NULL, NULL, 'temporal', 'martin', 2, 20),
(32, 'loi564', 'Automovil', '2019-02-04 20:26:50', '2019-02-04 20:27:43', '0 meses 0 dias 0 horas 0 minutos 53 segundos', 53, 'temporal', 'martin', 2, 16),
(34, 'epr87d', 'Automovil', '2019-02-04 20:31:06', '2019-02-04 20:31:17', '0 meses 0 dias 0 horas 0 minutos 11 segundos', 11, 'mensual', 'martin', 2, 17),
(157652, 'loi564', 'Automovil', '2019-01-18 11:24:15', '2019-01-25 13:47:34', NULL, 613399, 'temporal', 'martin', 2, 10),
(157657, 'oiu908', 'motocicleta', '2019-02-12 12:39:42', '2019-02-17 14:53:48', '0 meses 5 dias 2 horas 14 minutos 06 segundos', 440046, 'temporal', 'martin', 1, 11),
(157658, 'ytr67g', 'Automovil', '2019-02-12 12:43:46', '2019-02-17 14:59:08', '0 meses 5 dias 2 horas 15 minutos 22 segundos', 440122, 'temporal', 'martin', 2, 14),
(157659, 'vfc456', 'motocicleta', '2019-02-12 12:45:52', '2019-02-17 15:43:49', '0 meses 5 dias 2 horas 57 minutos 57 segundos', 0, 'temporal', 'martin', 1, 12),
(157661, 'iuy789', 'Automovil', '2019-02-15 22:25:31', NULL, NULL, NULL, 'temporal', 'martin', 2, NULL),
(157662, 'OIU090', 'Automovil', '2019-02-15 22:28:14', NULL, NULL, NULL, 'temporal', 'martin', 2, NULL),
(157663, 'oiu543', 'Automovil', '2019-02-15 22:41:05', NULL, NULL, NULL, 'temporal', 'martin', 2, NULL),
(157664, 'mnb123', 'Automovil', '2019-02-15 23:23:26', NULL, NULL, NULL, 'temporal', 'martin', 2, 1),
(157665, 'bgf453', 'Automovil', '2019-02-17 07:12:55', NULL, NULL, NULL, 'temporal', 'martin', 2, 3),
(157666, 'epr87d', 'motocicleta', '2019-02-17 15:00:52', '2019-02-17 15:01:40', '0 meses 0 dias 0 horas 0 minutos 48 segundos', 48, 'mensual', 'martin', 1, 1),
(157667, 'epr87d', 'motocicleta', '2019-02-17 15:06:30', '2019-02-17 15:06:45', '0 meses 0 dias 0 horas 0 minutos 15 segundos', 0, 'mensual', 'martin', 1, 1),
(157668, 'epr87d', 'motocicleta', '2019-02-18 10:03:23', '2019-02-18 10:03:45', '0 meses 0 dias 0 horas 0 minutos 22 segundos', 0, 'mensual', 'martin', 1, 1),
(157669, 'epr87d', 'motocicleta', '2019-02-18 13:45:14', '2019-02-18 18:30:24', '0 dias 4 hrs 45 minutos 10 segundos', 0, 'mensual', 'martin', 1, 1),
(157670, 'epr87i', 'motocicleta', '2019-02-18 18:18:52', '2019-02-18 18:19:26', '0 dias 0 hrs 0 minutos 34 segundos', 0, 'temporal', 'martin', 1, 4),
(157671, 'iuy760', 'Automovil', '2019-02-18 18:31:48', NULL, NULL, NULL, 'temporal', 'martin', 2, 6),
(157672, 'epr87s', 'Automovil', '2019-02-18 18:38:42', '2019-02-18 18:38:59', '0 dias 0 hrs 0 minutos 17 segundos', 0, 'temporal', 'martin', 2, 9),
(182910, 'poi987', 'motocicleta', '2019-02-09 11:47:36', NULL, NULL, NULL, 'temporal', 'martin', 1, 16),
(182911, 'poi852', 'motocicleta', '2019-02-09 11:55:37', NULL, NULL, NULL, 'temporal', 'martin', 1, 50),
(182912, 'oiu89p', 'motocicleta', '2019-02-09 11:44:41', NULL, NULL, NULL, 'temporal', 'martin', 1, 49),
(182913, 'poi123', 'motocicleta', '2019-02-09 12:03:37', NULL, NULL, NULL, 'temporal', 'martin', 1, 47),
(182914, 'poi124', 'motocicleta', '2019-02-09 12:04:18', NULL, NULL, NULL, 'temporal', 'martin', 1, 18),
(182915, 'mnu456', 'Automovil', '2019-02-09 12:04:58', NULL, NULL, NULL, 'temporal', 'martin', 2, 13),
(182916, 'ijm876', 'Automovil', '2019-02-11 19:06:59', NULL, NULL, NULL, 'temporal', 'martin', 2, 46),
(182918, 'mnb098', 'Automovil', '2019-02-11 20:43:48', NULL, NULL, NULL, 'temporal', 'martin', 2, 45),
(182919, 'uhb654', 'Automovil', '2019-02-11 20:47:36', NULL, NULL, NULL, 'temporal', 'martin', 2, 44);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `nombre`, `estado`) VALUES
(1, '1V', 1),
(2, '2V', 0),
(3, '3V', 0),
(5, '4V', 1),
(6, '5V', 0),
(7, '6V', 0),
(8, '7V', 1),
(9, '8V', 0),
(10, '9V', 0),
(11, '10V', 0),
(12, '11V', 0),
(13, '12V', 0),
(14, '13V', 0),
(15, '14V', 0),
(16, '15V', 0),
(17, '16V', 0),
(18, '17V', 0),
(19, '18V', 0),
(20, '19V', 0),
(21, '20V', 0),
(22, '21V', 0),
(23, '22V', 0),
(24, '23V', 0),
(25, '24V', 0),
(26, '25V', 0),
(27, '26V', 0),
(28, '27V', 0),
(29, '28V', 0),
(30, '29V', 0),
(31, '30V', 0),
(32, '31V', 0),
(33, '32V', 0),
(34, '33V', 0),
(35, '34V', 0),
(36, '35V', 0),
(37, '36V', 0),
(38, '37V', 0),
(39, '38V', 0),
(40, '39V', 0),
(41, '40', 0),
(42, '41', 0),
(43, '42', 0),
(44, '43', 0),
(45, '44', 0),
(46, '45', 0),
(47, '46', 0),
(48, '47', 0),
(49, '48', 0),
(50, '49', 0),
(51, '50', 0),
(52, '51', 0),
(53, '52', 0),
(54, '53', 0),
(55, '54', 0),
(56, '55', 0),
(57, '56', 0),
(58, '57', 0),
(59, '58', 0),
(60, '59', 0),
(61, '60', 0),
(62, '61', 0),
(63, '62', 0),
(64, '63', 0),
(65, '64', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  PRIMARY KEY (`usuario`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `apellidos` (`apellidos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `password`, `nombre`, `apellidos`, `correo`) VALUES
('admin', 'admin', 'admin', 'admin', 'admin@hotmail.com'),
('jk', '12345', 'Camilo', 'Nieto', 'juan.laura2817@gmail.com'),
('prueba', 'prueba', 'prueba', 'prueba', 'marto9610@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE IF NOT EXISTS `vehiculos` (
  `placa_vehi` varchar(10) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `tipo_vehiculo` varchar(45) NOT NULL,
  PRIMARY KEY (`placa_vehi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`placa_vehi`, `modelo`, `color`, `marca`, `tipo_vehiculo`) VALUES
('ads456', '4567', 'gris', 'por', 'automovil'),
('epr87d', '2015', 'verde', 'tvs apache', 'motocicleta'),
('fze788', '2016', 'verde', 'mazda', 'automovil'),
('HKN25E', '2017', 'Azul', 'AKT', 'motocicleta'),
('PTA123', '2012', 'anaranjado', 'subaru', 'automovil'),
('rht476', '2012', 'gris', 'chevrolet', 'automovil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_persona`
--

CREATE TABLE IF NOT EXISTS `vehiculo_persona` (
  `num_documento_vp` int(11) NOT NULL,
  `placa_vp` varchar(45) NOT NULL,
  KEY `fk_numdocumento_vp` (`num_documento_vp`),
  KEY `fk_placa_vp` (`placa_vp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo_persona`
--

INSERT INTO `vehiculo_persona` (`num_documento_vp`, `placa_vp`) VALUES
(1032479175, 'epr87d'),
(1233509976, 'rht476'),
(216781237, 'fze788'),
(103245987, 'PTA123'),
(1030680852, 'HKN25E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_ubicacion`
--

CREATE TABLE IF NOT EXISTS `vehiculo_ubicacion` (
  `placa` varchar(50) NOT NULL,
  `tipo_vehiculo` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo_ubicacion`
--

INSERT INTO `vehiculo_ubicacion` (`placa`, `tipo_vehiculo`, `ubicacion`) VALUES
('epr87d', 'motocicleta', '1v');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD CONSTRAINT `transaccion_ibfk_1` FOREIGN KEY (`tarifa_tr`) REFERENCES `tarifa` (`id_tarifa`),
  ADD CONSTRAINT `transaccion_ibfk_4` FOREIGN KEY (`espacio_tr`) REFERENCES `espacio` (`num_espacio`);

--
-- Filtros para la tabla `vehiculo_persona`
--
ALTER TABLE `vehiculo_persona`
  ADD CONSTRAINT `vehiculo_persona_ibfk_1` FOREIGN KEY (`num_documento_vp`) REFERENCES `persona` (`num_documento`),
  ADD CONSTRAINT `vehiculo_persona_ibfk_2` FOREIGN KEY (`placa_vp`) REFERENCES `vehiculos` (`placa_vehi`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
