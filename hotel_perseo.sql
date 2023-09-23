-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2023 a las 06:52:06
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel_perseo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_inventario`
--

CREATE TABLE `categoria_inventario` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion_categoria` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_inventario`
--

INSERT INTO `categoria_inventario` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`) VALUES
(1, 'Electrónica', 'Productos electrónicos para habitaciones de hotel'),
(2, 'Ropa de cama', 'Ropa de cama y accesorios'),
(3, 'Artículos de aseo', 'Productos de aseo personal para huéspedes'),
(4, 'Consumibles', 'Consumibles para habitaciones (bebidas, snacks, etc.)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_factura`
--

CREATE TABLE `detalles_factura` (
  `id_detalleFactura` int(11) NOT NULL,
  `fecha_emision` datetime NOT NULL,
  `total_factura` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_factura`
--

INSERT INTO `detalles_factura` (`id_detalleFactura`, `fecha_emision`, `total_factura`) VALUES
(1, '2023-06-01 10:30:00', 3500),
(2, '2023-06-02 18:45:00', 28000),
(3, '2023-06-03 12:15:00', 9000),
(4, '2023-06-04 20:00:00', 10000),
(5, '2023-06-05 15:30:00', 2500),
(6, '2023-06-06 09:00:00', 18000),
(7, '2023-06-07 14:30:00', 28000),
(8, '2023-06-08 19:45:00', 22000),
(9, '2023-06-09 11:00:00', 17000),
(10, '2023-06-10 17:15:00', 7500),
(11, '2023-06-11 08:30:00', 9000),
(12, '2023-06-12 13:45:00', 15000),
(13, '2023-06-13 16:30:00', 12000),
(14, '2023-06-14 10:15:00', 17000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_habitacion`
--

CREATE TABLE `estado_habitacion` (
  `id_estadoHabitacion` int(11) NOT NULL,
  `tipo_estado` varchar(20) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_habitacion`
--

INSERT INTO `estado_habitacion` (`id_estadoHabitacion`, `tipo_estado`, `descripcion`) VALUES
(1, 'Disponible', 'Habitación lista para ser ocupada'),
(2, 'Ocupada', 'Habitación actualmente ocupada'),
(3, 'Mantenimiento', 'Habitación en mantenimiento'),
(4, 'Limpieza', 'Habitación en proceso de limpieza'),
(5, 'Reservada', 'Habitación reservada para un cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_metodoPago` int(11) NOT NULL,
  `id_detalleFactura` int(11) NOT NULL,
  `numero_documento` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_metodoPago`, `id_detalleFactura`, `numero_documento`) VALUES
(1, 1, 1, '1234567890'),
(2, 2, 2, '9876543210'),
(3, 3, 3, 'ABC123XYZ'),
(4, 4, 4, '0987654321'),
(5, 1, 5, '5432109876'),
(6, 2, 6, 'XYZ321ABC'),
(7, 3, 7, 'DEF456GHI'),
(8, 4, 8, '9876543219'),
(9, 1, 9, '1234567898'),
(10, 2, 10, 'JKL987MNO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `num_habitacion` varchar(4) NOT NULL,
  `id_estadoHabitacion` int(11) NOT NULL,
  `id_tipoHabitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`num_habitacion`, `id_estadoHabitacion`, `id_tipoHabitacion`) VALUES
('101', 1, 1),
('102', 1, 1),
('103', 1, 1),
('104', 1, 1),
('105', 1, 1),
('106', 1, 1),
('107', 1, 1),
('108', 2, 1),
('109', 2, 1),
('201', 1, 2),
('202', 1, 2),
('203', 1, 2),
('204', 1, 2),
('205', 1, 2),
('206', 1, 2),
('207', 1, 2),
('208', 2, 2),
('209', 2, 2),
('301', 1, 3),
('302', 1, 3),
('303', 1, 3),
('304', 1, 3),
('305', 1, 3),
('306', 1, 3),
('307', 1, 3),
('308', 2, 3),
('309', 2, 3),
('401', 1, 4),
('402', 1, 4),
('403', 1, 4),
('404', 1, 4),
('405', 1, 4),
('406', 1, 4),
('407', 1, 4),
('408', 3, 4),
('409', 4, 4),
('501', 1, 1),
('502', 1, 1),
('503', 1, 1),
('504', 1, 1),
('505', 1, 1),
('506', 1, 1),
('507', 1, 1),
('508', 2, 1),
('509', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacionxreserva`
--

CREATE TABLE `habitacionxreserva` (
  `num_habitacion` varchar(4) NOT NULL,
  `id_reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitacionxreserva`
--

INSERT INTO `habitacionxreserva` (`num_habitacion`, `id_reserva`) VALUES
('101', 2),
('102', 3),
('103', 6),
('104', 7),
('201', 5),
('202', 1),
('203', 5),
('205', 9),
('301', 4),
('302', 6),
('303', 8),
('401', 2),
('402', 4),
('403', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huesped`
--

CREATE TABLE `huesped` (
  `id_huesped` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  `numero_documento` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `huesped`
--

INSERT INTO `huesped` (`id_huesped`, `id_reserva`, `nombre`, `apellido`, `numero_documento`, `email`, `telefono`) VALUES
(1, 1, 'Juan', 'Pérez', '1234567890', 'juan@example.com', '1234567890'),
(2, 2, 'María', 'López', '9876543210', 'maria@example.com', '9876543210'),
(3, 3, 'Pedro', 'González', 'ABC123XYZ', 'pedro@example.com', '5555555555'),
(4, 2, 'Ana', 'Sánchez', '0987654321', 'ana@example.com', '1231231234'),
(5, 3, 'Luis', 'Torres', '5432109876', 'luis@example.com', '9879879876'),
(6, 1, 'Carolina', 'García', 'XYZ321ABC', 'carolina@example.com', '1112223333'),
(7, 2, 'Andrés', 'Ramírez', 'DEF456GHI', 'andres@example.com', '4445556666'),
(8, 3, 'Laura', 'Gómez', '9876543219', 'laura@example.com', '9998887777'),
(9, 1, 'Roberto', 'Hernández', '1234567898', 'roberto@example.com', '3332221111'),
(10, 3, 'Sara', 'Vargas', 'JKL987MNO', 'sara@example.com', '7776665555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(200) DEFAULT NULL,
  `estado_producto` varchar(20) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `nombre_producto`, `descripcion_producto`, `estado_producto`, `id_categoria`) VALUES
(1, 'Televisor', 'Televisor de pantalla plana de 32 pulgadas', 'Disponible', 1),
(2, 'Cafetera', 'Cafetera eléctrica con cápsulas de café', 'Disponible', 1),
(3, 'Almohada', 'Almohada suave y cómoda', 'Disponible', 2),
(4, 'Sábanas', 'Juego de sábanas de algodón', 'Disponible', 2),
(5, 'Toallas', 'Toallas de baño suaves y absorbentes', 'Disponible', 2),
(6, 'Jabón de baño', 'Jabón de baño con fragancia suave', 'Disponible', 3),
(7, 'Champú', 'Champú revitalizante para el cabello', 'Disponible', 3),
(8, 'Agua embotellada', 'Botella de agua mineral', 'Disponible', 4),
(9, 'Snacks', 'Variedad de snacks y bocadillos', 'Disponible', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarioxhabitacion`
--

CREATE TABLE `inventarioxhabitacion` (
  `id_inventario` int(11) NOT NULL,
  `num_habitacion` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventarioxhabitacion`
--

INSERT INTO `inventarioxhabitacion` (`id_inventario`, `num_habitacion`) VALUES
(1, '101'),
(1, '102'),
(1, '201'),
(2, '101'),
(3, '301'),
(4, '102'),
(4, '301'),
(5, '202'),
(6, '201'),
(6, '202');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodoPago` int(11) NOT NULL,
  `metodo` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodoPago`, `metodo`) VALUES
(1, 'Tarjeta de crédito'),
(2, 'Transferencia bancaria'),
(3, 'PayPal'),
(4, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_tipoDocumento` int(11) NOT NULL,
  `numero_documento` varchar(10) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `id_tipoPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_tipoDocumento`, `numero_documento`, `nombre`, `apellido`, `email`, `telefono`, `id_tipoPersona`) VALUES
(1, '0987654321', 'Ana', 'Sánchez', 'ana@example.com', '1231231234', 2),
(1, '1001094840', 'Juan Esteban', 'Rodriguez', 'juanes.ro2002@gmail.com', '3102323404', 3),
(1, '1234567890', 'Juan', 'Pérez', 'juan@example.com', '1234567890', 1),
(2, '1234567898', 'Roberto', 'Hernández', 'roberto@example.com', '3332221111', 1),
(3, '1684896846', 'Steve', 'Rogers', 'sr@gmail.com', '6846462', 3),
(2, '5432109876', 'Luis', 'Torres', 'luis@example.com', '9879879876', 3),
(2, '9876543210', 'María', 'López', 'maria@example.com', '9876543210', 2),
(1, '9876543219', 'Laura', 'Gómez', 'laura@example.com', '9998887777', 3),
(3, 'ABC123XYZ', 'Pedro', 'González', 'pedro@example.com', '5555555555', 3),
(3, 'DEF456GHI', 'Andrés', 'Ramírez', 'andres@example.com', '4445556666', 2),
(3, 'JKL987MNO', 'Sara', 'Vargas', 'sara@example.com', '7776665555', 3),
(3, 'XYZ321ABC', 'Carolina', 'García', 'carolina@example.com', '1112223333', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `fecha_entrada` datetime NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `precio_calculado` float NOT NULL,
  `cantidad_adultos` int(11) NOT NULL,
  `cantidad_niños` int(11) NOT NULL,
  `numero_documento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `fecha_entrada`, `fecha_salida`, `precio_calculado`, `cantidad_adultos`, `cantidad_niños`, `numero_documento`) VALUES
(1, '2023-07-15 14:00:00', '2023-07-20 10:00:00', 500, 2, 0, '1234567890'),
(2, '2023-08-05 12:00:00', '2023-08-10 09:00:00', 750, 3, 1, '9876543210'),
(3, '2023-09-01 15:30:00', '2023-09-05 11:00:00', 350, 1, 0, 'ABC123XYZ'),
(4, '2023-09-10 10:00:00', '2023-09-15 14:00:00', 900, 4, 2, '0987654321'),
(5, '2023-10-01 13:00:00', '2023-10-05 12:00:00', 400, 2, 0, '5432109876'),
(6, '2023-10-15 10:30:00', '2023-10-20 16:00:00', 600, 3, 1, 'XYZ321ABC'),
(7, '2023-11-05 14:00:00', '2023-11-10 11:00:00', 250, 1, 0, 'DEF456GHI'),
(8, '2023-11-15 12:00:00', '2023-11-20 15:00:00', 800, 4, 2, '9876543219'),
(9, '2023-12-01 09:00:00', '2023-12-05 17:00:00', 450, 2, 0, '1234567898'),
(10, '2023-12-10 11:30:00', '2023-12-15 13:00:00', 700, 3, 1, 'JKL987MNO'),
(11, '2023-09-29 05:00:00', '2023-11-04 05:00:00', 100000, 2, 1, '1001094840');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipoDocumento` int(11) NOT NULL,
  `tipo_documento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipoDocumento`, `tipo_documento`) VALUES
(1, 'Cédula de ciudadanía'),
(2, 'Cédula de extranjería'),
(3, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE `tipo_habitacion` (
  `id_tipoHabitacion` int(11) NOT NULL,
  `tipo_habitacion` varchar(30) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precioXnoche` float NOT NULL,
  `cantidad_adultos` int(1) DEFAULT NULL,
  `cantidad_niños` int(1) DEFAULT NULL,
  `foto` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_habitacion`
--

INSERT INTO `tipo_habitacion` (`id_tipoHabitacion`, `tipo_habitacion`, `descripcion`, `precioXnoche`, `cantidad_adultos`, `cantidad_niños`, `foto`) VALUES
(1, 'Individual', 'Habitación para una persona', 50000, 1, 0, NULL),
(2, 'Doble', 'Habitación para dos personas', 80000, 2, 0, NULL),
(3, 'Familiar', 'Habitación para cuatro personas', 120000, 2, 2, NULL),
(4, 'Suite', 'Habitación de lujo con sala de estar', 200000, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE `tipo_persona` (
  `id_tipoPersona` int(11) NOT NULL,
  `tipo_persona` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id_tipoPersona`, `tipo_persona`) VALUES
(1, 'Administrador'),
(2, 'Empleado'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `email` varchar(100) NOT NULL,
  `contraseña` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`email`, `contraseña`) VALUES
('juan@example.com', 'password123\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('maria@example.com', 'securepass\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('pedro@example.com', 'pass1234\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('ana@example.com', 'mypassword\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('luis@example.com', '12345678\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('carolina@example.com', 'strongpass\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('andres@example.com', 'password123\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('laura@example.com', 'secretpass\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('roberto@example.com', 'pass1234\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('sara@example.com', 'mypassword\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
('juanes.ro2002@gmail.com', 'Juanes.12345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_inventario`
--
ALTER TABLE `categoria_inventario`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD PRIMARY KEY (`id_detalleFactura`);

--
-- Indices de la tabla `estado_habitacion`
--
ALTER TABLE `estado_habitacion`
  ADD PRIMARY KEY (`id_estadoHabitacion`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_metodoPago` (`id_metodoPago`),
  ADD KEY `id_detalleFactura` (`id_detalleFactura`),
  ADD KEY `numero_documento` (`numero_documento`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`num_habitacion`),
  ADD KEY `id_estadoHabitacion` (`id_estadoHabitacion`),
  ADD KEY `id_tipoHabitacion` (`id_tipoHabitacion`);

--
-- Indices de la tabla `habitacionxreserva`
--
ALTER TABLE `habitacionxreserva`
  ADD PRIMARY KEY (`num_habitacion`,`id_reserva`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `huesped`
--
ALTER TABLE `huesped`
  ADD PRIMARY KEY (`id_huesped`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `inventarioxhabitacion`
--
ALTER TABLE `inventarioxhabitacion`
  ADD PRIMARY KEY (`id_inventario`,`num_habitacion`),
  ADD KEY `num_habitacion` (`num_habitacion`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodoPago`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`numero_documento`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_tipoDocumento` (`id_tipoDocumento`),
  ADD KEY `id_tipoPersona` (`id_tipoPersona`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `numero_documento` (`numero_documento`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipoDocumento`);

--
-- Indices de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD PRIMARY KEY (`id_tipoHabitacion`);

--
-- Indices de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  ADD PRIMARY KEY (`id_tipoPersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_inventario`
--
ALTER TABLE `categoria_inventario`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  MODIFY `id_detalleFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `estado_habitacion`
--
ALTER TABLE `estado_habitacion`
  MODIFY `id_estadoHabitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `huesped`
--
ALTER TABLE `huesped`
  MODIFY `id_huesped` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodoPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipoDocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  MODIFY `id_tipoHabitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  MODIFY `id_tipoPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_metodoPago`) REFERENCES `metodo_pago` (`id_metodoPago`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_detalleFactura`) REFERENCES `detalles_factura` (`id_detalleFactura`),
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`numero_documento`) REFERENCES `persona` (`numero_documento`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`id_estadoHabitacion`) REFERENCES `estado_habitacion` (`id_estadoHabitacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `habitacion_ibfk_2` FOREIGN KEY (`id_tipoHabitacion`) REFERENCES `tipo_habitacion` (`id_tipoHabitacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habitacionxreserva`
--
ALTER TABLE `habitacionxreserva`
  ADD CONSTRAINT `habitacionxreserva_ibfk_1` FOREIGN KEY (`num_habitacion`) REFERENCES `habitacion` (`num_habitacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `habitacionxreserva_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `huesped`
--
ALTER TABLE `huesped`
  ADD CONSTRAINT `huesped_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_inventario` (`id_categoria`);

--
-- Filtros para la tabla `inventarioxhabitacion`
--
ALTER TABLE `inventarioxhabitacion`
  ADD CONSTRAINT `inventarioxhabitacion_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventarioxhabitacion_ibfk_2` FOREIGN KEY (`num_habitacion`) REFERENCES `habitacion` (`num_habitacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_tipoDocumento`) REFERENCES `tipo_documento` (`id_tipoDocumento`),
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`id_tipoPersona`) REFERENCES `tipo_persona` (`id_tipoPersona`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`numero_documento`) REFERENCES `persona` (`numero_documento`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`email`) REFERENCES `persona` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
