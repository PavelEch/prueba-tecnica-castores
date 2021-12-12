-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2021 a las 16:25:34
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pavel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL,
  `parent_dir` int(11) NOT NULL,
  `fechadecreacion` datetime NOT NULL,
  `comentario` varchar(1000) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `idnota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`idcomentario`, `parent_dir`, `fechadecreacion`, `comentario`, `idusuario`, `idnota`) VALUES
(1, 0, '2021-12-05 17:08:59', 'Algunas de esas medidas son innecesarias', 3, 1),
(2, 1, '2021-12-05 17:17:59', 'Al contrario se deberían de tomar más medidas al respecto', 4, 1),
(3, 2, '2021-12-05 17:23:59', 'La medida x podría poner en peligro tu salud si no tomas en cuenta y', 3, 1),
(4, 3, '2021-12-05 17:30:59', 'Toda medida debe ser tomada con causión, sin embargo deben ser respetadas por la seguridad de todos', 4, 1),
(5, 0, '2021-12-05 17:48:59', 'Yo también opino que son medidas demasiado estrictas', 2, 1),
(6, 1, '2021-12-05 17:09:59', 'Y qué pasa con la gente que se niega a vacunarse y vive en EU?', 1, 1),
(7, 4, '2021-12-12 10:58:45', 'un Nuevo comentario respondiendo a #4', 1, 1),
(8, 5, '2021-12-12 10:58:59', 'Un Nuevo comentario respondiendo a #5', 1, 1),
(9, 0, '2021-12-12 10:59:08', 'Un Nuevo comentario base', 1, 1),
(10, 0, '2021-12-12 11:26:49', 'Nuevo comentario en nota 3', 1, 3),
(11, 10, '2021-12-12 11:27:01', 'Respondiendo a comentario en nota 3', 1, 3),
(12, 9, '2021-12-12 11:30:54', 'Tienes razón', 4, 1),
(13, 0, '2021-12-12 13:54:11', 'Primer comentario de nota #2', 1, 2),
(14, 13, '2021-12-12 13:54:23', 'Primera respuesta a comentario de nota #2', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `idnota` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `fechadecreacion` datetime NOT NULL,
  `idpersonal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`idnota`, `titulo`, `descripcion`, `fechadecreacion`, `idpersonal`) VALUES
(1, 'Entran en vigor nuevas medidas para viajeros que van a EU: esto es lo que debes saber', 'A partir de este lunes 6 de diciembre, entran en vigor las medidas para viajes internacionales a Estados Unidos anunciadas por el gobierno de Joe Biden. El objetivo es frenar los contagios de coronavirus, particularmente con la llegada de la variante ómicron, que parece ser más contagiosa que delta.\nEl principal cambio es que los viajeros deben presentar prueba negativa de Covid-19, sin importar su estatus de vacunación, realizada no más de un día antes del vuelo. Hasta ahora, se podía presentar una prueba realizada hasta 3 días antes del viaje.', '2021-12-05 15:08:59', 1),
(2, 'Detectan casos de la variante Ómicron en al menos 15 estados de EU; “Delta sigue dominando en el país”, dicen funcionarios de salud', 'La variante Ómicron del coronavirus se ha extendido a alrededor de un tercio de los estados de Estados Unidos, pero la variante Delta sigue representando la mayoría de los casos de Covid-19 en todo el país, dijeron este domingo funcionarios de salud.\r\n\r\nAunque la aparición de la nueva variante ha causado alarma en todo el mundo, Anthony Fauci, el principal funcionario de enfermedades infecciosas de Estados Unidos, dijo a CNN que “hasta ahora no parece que haya un gran grado de gravedad“, pero agregó que era demasiado temprano para sacar conclusiones definitivas y que se necesitan más estudios.', '2021-12-05 19:34:59', 1),
(3, 'Título de la nota 1234', 'Cuerpo de la nota 1234', '2021-12-08 06:30:16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `idpersonal` int(11) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idpersonal`, `direccion`, `idusuario`) VALUES
(1, 'Calle del Cairo #245', 1),
(2, 'Calle de Santa Catarina #1002', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `apepaterno` varchar(50) NOT NULL,
  `apematerno` varchar(50) NOT NULL,
  `nombre` varchar(125) NOT NULL,
  `fechadeingreso` datetime NOT NULL,
  `externo` tinyint(1) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `nick` varchar(200) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `apepaterno`, `apematerno`, `nombre`, `fechadeingreso`, `externo`, `correo`, `nick`, `contraseña`) VALUES
(1, 'Echeveste', 'Segoviano', 'Juan Pavel', '2021-05-07 15:08:59', 0, 'pavelecheveste@gmail.com', 'pavelecheveste', '12345.'),
(2, 'Rocha', 'López', 'Arturo', '2021-09-02 15:09:22', 0, 'arturorocha@gmail.com', 'arturorocha', '12345.'),
(3, 'Ramirez', 'Zamora', 'Abigail', '2021-10-08 15:09:27', 1, 'abigailramirez@gmail.com', 'abigailramirez', '12345.'),
(4, 'Zuñiga', 'Hernández', 'Luis', '2021-10-16 15:09:30', 1, 'luiszuñiga@gmail.com', 'luiszuñiga', '12345.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `idvisitante` int(11) NOT NULL,
  `pasatiempo` varchar(150) DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `visitante`
--

INSERT INTO `visitante` (`idvisitante`, `pasatiempo`, `idusuario`) VALUES
(1, 'Notas de deportes', 3),
(2, 'Notas de política', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idcomentario`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idnota` (`idnota`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`idnota`),
  ADD KEY `idpersonal` (`idpersonal`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idpersonal`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `nick` (`nick`),
  ADD UNIQUE KEY `unique_correo` (`correo`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`idvisitante`),
  ADD KEY `idusuario` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `idnota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `idpersonal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `visitante`
--
ALTER TABLE `visitante`
  MODIFY `idvisitante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`idnota`) REFERENCES `nota` (`idnota`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`idpersonal`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `visitante_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
