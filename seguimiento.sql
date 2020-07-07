-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2020 a las 01:04:53
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `seguimiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE `historia` (
  `idhistoria` int(11) NOT NULL,
  `idtramite` int(11) NOT NULL,
  `estado` varchar(150) NOT NULL,
  `lugar` varchar(150) NOT NULL,
  `iduser` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalle` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historia`
--

INSERT INTO `historia` (`idhistoria`, `idtramite`, `estado`, `lugar`, `iduser`, `fecha`, `detalle`) VALUES
(1, 1, 'ENTREGADO', 'VENTANILLA UNICA', 1, '2020-07-07 17:10:05', 'se entregoi a la secretaria '),
(3, 1, 'ENTREGADO', 'VEHICULOS', 1, '2020-07-07 17:14:39', 'se entrego a ester');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramite`
--

CREATE TABLE `tramite` (
  `idtramite` int(11) NOT NULL,
  `ci` varchar(150) NOT NULL,
  `asunto` varchar(150) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `idusuario` int(11) NOT NULL,
  `numero` varchar(150) NOT NULL,
  `estado` varchar(150) NOT NULL DEFAULT 'CREADO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tramite`
--

INSERT INTO `tramite` (`idtramite`, `ci`, `asunto`, `nombre`, `fecha`, `idusuario`, `numero`, `estado`) VALUES
(1, '7336199', 'Cambio nombre vehiculos', 'adimer paul', '2020-07-07 13:47:20', 1, '20200', 'CREADO'),
(3, '323125456', 'cambiuo de funete', 'jose canzeco', '2020-07-07 14:10:51', 1, '3030', 'CREADO'),
(4, '123456789', 'CAMBIO NOMBRE NOMBRE', 'ADIMER PAUL', '2020-07-07 17:58:48', 1, '5050', 'CREADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `clave` varchar(150) NOT NULL,
  `unidad` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`iduser`, `nombre`, `clave`, `unidad`, `tipo`, `fecha`) VALUES
(1, 'admin', '1010', 'VENTANILLA UNICA', 'ADMIN', '2020-07-07 13:15:11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`idhistoria`),
  ADD KEY `idtramite` (`idtramite`),
  ADD KEY `iduser` (`iduser`);

--
-- Indices de la tabla `tramite`
--
ALTER TABLE `tramite`
  ADD PRIMARY KEY (`idtramite`),
  ADD KEY `tramite_ibfk_1` (`idusuario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `idhistoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tramite`
--
ALTER TABLE `tramite`
  MODIFY `idtramite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `historia_ibfk_1` FOREIGN KEY (`idtramite`) REFERENCES `tramite` (`idtramite`),
  ADD CONSTRAINT `historia_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`);

--
-- Filtros para la tabla `tramite`
--
ALTER TABLE `tramite`
  ADD CONSTRAINT `tramite_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `users` (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
