-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2026 at 06:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `Id_Autor` int(10) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`Id_Autor`, `Nombres`, `Apellidos`, `Nacionalidad`) VALUES
(1, 'Gabriel', 'García Márquez', 'Colombiana'),
(2, 'Salarrué', 'Arrué', 'Salvadoreña'),
(3, 'Roque', 'Dalton', 'Salvadoreña'),
(4, 'Isabel', 'Allende', 'Chilena'),
(5, 'Julio', 'Cortázar', 'Argentina'),
(6, 'Mario', 'Vargas Llosa', 'Peruana'),
(7, 'Carl', 'Sagan', 'Estadounidense'),
(8, 'Isaac', 'Asimov', 'Estadounidense'),
(9, 'Claudia', 'Lars', 'Salvadoreña'),
(10, 'Andrew', 'Tanenbaum', 'Estadounidense');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `Id_Categoria` int(10) NOT NULL,
  `Nombre_Categoria` varchar(50) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`Id_Categoria`, `Nombre_Categoria`, `Descripcion`) VALUES
(1, 'Novela', 'Narrativa de ficción extensa'),
(2, 'Cuento', 'Narrativa breve'),
(3, 'Poesía', 'Obras en verso'),
(4, 'Ciencia', 'Divulgación científica'),
(5, 'Historia', 'Libros de historia'),
(6, 'Informática', 'Computación y programación'),
(7, 'Infantil', 'Literatura para niños'),
(8, 'Biografía', 'Vidas de personajes'),
(9, 'Filosofía', 'Pensamiento y ensayo'),
(10, 'Ciencia ficción', 'Ficción especulativa');

-- --------------------------------------------------------

--
-- Table structure for table `libro`
--

CREATE TABLE `libro` (
  `Id_Libro` int(10) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Anio_Publicacion` int(4) DEFAULT NULL,
  `Id_Autor` int(10) NOT NULL,
  `Id_Categoria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libro`
--

INSERT INTO `libro` (`Id_Libro`, `Titulo`, `Anio_Publicacion`, `Id_Autor`, `Id_Categoria`) VALUES
(1, 'Cien años de soledad', 1967, 1, 1),
(2, 'Cuentos de barro', 1933, 2, 2),
(3, 'Taberna y otros lugares', 1969, 3, 3),
(4, 'La casa de los espíritus', 1982, 4, 1),
(5, 'Rayuela', 1963, 5, 1),
(6, 'La ciudad y los perros', 1963, 6, 1),
(7, 'Cosmos', 1980, 7, 4),
(8, 'Fundación', 1951, 8, 10),
(9, 'Escrito de Claudia', 1950, 9, 3),
(10, 'Redes de computadoras', 1981, 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `prestamo`
--

CREATE TABLE `prestamo` (
  `Id_Prestamo` int(10) NOT NULL,
  `Id_Libro` int(10) NOT NULL,
  `Id_Socio` int(10) NOT NULL,
  `Fecha_Prestamo` date NOT NULL,
  `Fecha_Devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prestamo`
--

INSERT INTO `prestamo` (`Id_Prestamo`, `Id_Libro`, `Id_Socio`, `Fecha_Prestamo`, `Fecha_Devolucion`) VALUES
(1, 1, 1, '2026-03-02', '2026-03-16'),
(2, 2, 2, '2026-03-04', '2026-03-18'),
(3, 3, 3, '2026-03-06', '2026-03-20'),
(4, 4, 4, '2026-03-09', '2026-03-23'),
(5, 5, 5, '2026-03-11', '2026-03-25'),
(6, 6, 6, '2026-03-13', NULL),
(7, 7, 7, '2026-03-16', '2026-03-30'),
(8, 8, 8, '2026-03-18', NULL),
(9, 9, 9, '2026-03-20', '2026-04-03'),
(10, 10, 10, '2026-03-23', '2026-04-06');

-- --------------------------------------------------------

--
-- Table structure for table `socio`
--

CREATE TABLE `socio` (
  `Id_Socio` int(10) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `socio`
--

INSERT INTO `socio` (`Id_Socio`, `Nombres`, `Apellidos`, `Telefono`, `Correo`) VALUES
(1, 'Carlos', 'Martínez', '7012-3456', 'carlos.martinez@correo.com'),
(2, 'Ana', 'Hernández', '7123-4567', 'ana.hernandez@correo.com'),
(3, 'José', 'López', '7234-5678', 'jose.lopez@correo.com'),
(4, 'María', 'Rivas', '7345-6789', 'maria.rivas@correo.com'),
(5, 'Luis', 'Flores', '7456-7890', 'luis.flores@correo.com'),
(6, 'Sofía', 'Ramírez', '7567-8901', 'sofia.ramirez@correo.com'),
(7, 'Pedro', 'Guzmán', '7678-9012', 'pedro.guzman@correo.com'),
(8, 'Laura', 'Cruz', '7789-0123', 'laura.cruz@correo.com'),
(9, 'Miguel', 'Alvarado', '7890-1234', 'miguel.alvarado@correo.com'),
(10, 'Daniela', 'Mejía', '7901-2345', 'daniela.mejia@correo.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`Id_Autor`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indexes for table `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`Id_Libro`),
  ADD KEY `fk_libro_autor` (`Id_Autor`),
  ADD KEY `fk_libro_categoria` (`Id_Categoria`);

--
-- Indexes for table `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`Id_Prestamo`),
  ADD KEY `fk_prestamo_libro` (`Id_Libro`),
  ADD KEY `fk_prestamo_socio` (`Id_Socio`);

--
-- Indexes for table `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`Id_Socio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `Id_Autor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `Id_Categoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `libro`
--
ALTER TABLE `libro`
  MODIFY `Id_Libro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `Id_Prestamo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `socio`
--
ALTER TABLE `socio`
  MODIFY `Id_Socio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `fk_libro_autor` FOREIGN KEY (`Id_Autor`) REFERENCES `autor` (`Id_Autor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_libro_categoria` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`) ON UPDATE CASCADE;

--
-- Constraints for table `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_prestamo_libro` FOREIGN KEY (`Id_Libro`) REFERENCES `libro` (`Id_Libro`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestamo_socio` FOREIGN KEY (`Id_Socio`) REFERENCES `socio` (`Id_Socio`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
