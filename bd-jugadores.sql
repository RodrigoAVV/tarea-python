-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2022 a las 19:34:54
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd-jugadores`
--
CREATE DATABASE IF NOT EXISTS `bd-jugadores` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `bd-jugadores`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientos`
--

CREATE TABLE `equipamientos` (
  `EQUIPAMIENTO_ID` int(11) NOT NULL,
  `PERSONAJE_ID` int(11) DEFAULT NULL,
  `EQUIPAMIENTO` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidades`
--

CREATE TABLE `habilidades` (
  `HABILIDAD_ID` int(11) NOT NULL,
  `PERSONAJE_ID` int(11) DEFAULT NULL,
  `HABILIDAD` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `JUGADOR_ID` int(11) NOT NULL,
  `NOMBRE_J` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ALIAS_J` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TIPO` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ESTADO` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PASSWORD` varchar(160) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`JUGADOR_ID`, `NOMBRE_J`, `ALIAS_J`, `TIPO`, `ESTADO`, `PASSWORD`) VALUES
(1, 'Juan Vera', 'juanito-v', 'GM', 'Vivo', '123456'),
(2, 'J2', 'JJ', 'GB', 'Vivo', '123456'),
(4, 'Meiben', 'MB', 'Jugador', 'Vivo', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `PERSONAJE_ID` int(11) NOT NULL,
  `JUGADOR_ID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ALIAS_P` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `RAZA` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NIVEL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`PERSONAJE_ID`, `JUGADOR_ID`, `NOMBRE`, `ALIAS_P`, `RAZA`, `NIVEL`) VALUES
(1, 1, 'Samus Aran', 'Sam', 'Robot', 1),
(2, 1, 'Ellie', 'Elli', 'Humano', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poderes`
--

CREATE TABLE `poderes` (
  `PODER_ID` int(11) NOT NULL,
  `PERSONAJE_ID` int(11) DEFAULT NULL,
  `PODER` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DETALLE` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipamientos`
--
ALTER TABLE `equipamientos`
  ADD PRIMARY KEY (`EQUIPAMIENTO_ID`),
  ADD KEY `FK_EQUIPAMI_RELATIONS_PERSONAJ` (`PERSONAJE_ID`);

--
-- Indices de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`HABILIDAD_ID`),
  ADD KEY `FK_HABILIDA_RELATIONS_PERSONAJ` (`PERSONAJE_ID`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`JUGADOR_ID`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`PERSONAJE_ID`),
  ADD KEY `FK_PERSONAJ_RELATIONS_JUGADORE` (`JUGADOR_ID`);

--
-- Indices de la tabla `poderes`
--
ALTER TABLE `poderes`
  ADD PRIMARY KEY (`PODER_ID`),
  ADD KEY `FK_PODERES_RELATIONS_PERSONAJ` (`PERSONAJE_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipamientos`
--
ALTER TABLE `equipamientos`
  MODIFY `EQUIPAMIENTO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `HABILIDAD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `JUGADOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `PERSONAJE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `poderes`
--
ALTER TABLE `poderes`
  MODIFY `PODER_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipamientos`
--
ALTER TABLE `equipamientos`
  ADD CONSTRAINT `FK_EQUIPAMI_RELATIONS_PERSONAJ` FOREIGN KEY (`PERSONAJE_ID`) REFERENCES `personajes` (`PERSONAJE_ID`);

--
-- Filtros para la tabla `habilidades`
--
ALTER TABLE `habilidades`
  ADD CONSTRAINT `FK_HABILIDA_RELATIONS_PERSONAJ` FOREIGN KEY (`PERSONAJE_ID`) REFERENCES `personajes` (`PERSONAJE_ID`);

--
-- Filtros para la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `FK_PERSONAJ_RELATIONS_JUGADORE` FOREIGN KEY (`JUGADOR_ID`) REFERENCES `jugadores` (`JUGADOR_ID`);

--
-- Filtros para la tabla `poderes`
--
ALTER TABLE `poderes`
  ADD CONSTRAINT `FK_PODERES_RELATIONS_PERSONAJ` FOREIGN KEY (`PERSONAJE_ID`) REFERENCES `personajes` (`PERSONAJE_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
