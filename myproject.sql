-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2023 at 12:28 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myproject`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarempleado` (IN `id_empleado` INT, IN `nombre_p` VARCHAR(255), IN `apellido_p` VARCHAR(255), IN `celular_p` VARCHAR(255), IN `cargo_id` INT)   BEGIN
    UPDATE empleado SET nombre = nombre_p, apellido = apellido_p, celular = celular_p, cargo_id = cargo_id WHERE id = id_empleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarmodelo` (IN `id_modelo` INT(11), IN `nombre_m` VARCHAR(150), IN `tipo_m` VARCHAR(150), IN `anio_m` VARCHAR(10), IN `precio_m` VARCHAR(20), IN `motor_m` VARCHAR(5), IN `transmision_m` VARCHAR(20), IN `marca_id` INT(11))   BEGIN
UPDATE modelo SET nombre=nombre_m, tipo=tipo_m, anio=anio_m, precio=precio_m, motor=motor_m, transmision=transmision_m, marca_id=marca_id WHERE id=id_modelo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarempleado` (IN `idempleado` INT)   BEGIN
DELETE FROM empleado WHERE id=idempleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarmodelo` (IN `id_modelo` INT(11))   BEGIN
DELETE FROM modelo WHERE id=id_modelo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarempleado` ()   BEGIN
SELECT e.id, e.nombre, e.apellido, e.celular, c.nombre as NombreCargo, c.salario from empleado as e INNER JOIN cargo as c WHERE e.cargo_id = c.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarmodelo` ()   BEGIN
    SELECT
        ma.id AS id,
        ma.nombre AS nombre,
        ma.tipo AS tipo,
        ma.anio AS anio,
        ma.precio AS precio,
        ma.motor AS motor,
        ma.transmision AS transmision,
        mc.nombre AS nombre,
        mc.pais AS pais,
        mc.anio_fundacion AS anio_fundacion
    FROM
        modelo AS ma
    INNER JOIN
        marca AS mc ON ma.marca_id = mc.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarempleado` (IN `nombre` VARCHAR(150), IN `apellido` VARCHAR(150), IN `celular` VARCHAR(20), IN `cargo_id` INT(11))   BEGIN

INSERT INTO empleado (nombre,apellido , celular, cargo_id) VALUES (nombre, apellido, celular, cargo_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarmodeloauto` (IN `nombre` VARCHAR(150), IN `tipo` VARCHAR(150), IN `anio` VARCHAR(10), IN `precio` VARCHAR(20), IN `motor` VARCHAR(5), IN `transmision` VARCHAR(20), IN `marca_id` INT(11))   BEGIN
INSERT INTO modelo (nombre, tipo, anio, precio, motor, transmision, marca_id) VALUES (nombre, tipo, anio, precio, motor, transmision, marca_id);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add prueba', 1, 'add_prueba'),
(2, 'Can change prueba', 1, 'change_prueba'),
(3, 'Can delete prueba', 1, 'delete_prueba'),
(4, 'Can view prueba', 1, 'view_prueba'),
(5, 'Can add cargo', 2, 'add_cargo'),
(6, 'Can change cargo', 2, 'change_cargo'),
(7, 'Can delete cargo', 2, 'delete_cargo'),
(8, 'Can view cargo', 2, 'view_cargo'),
(9, 'Can add empleado', 3, 'add_empleado'),
(10, 'Can change empleado', 3, 'change_empleado'),
(11, 'Can delete empleado', 3, 'delete_empleado'),
(12, 'Can view empleado', 3, 'view_empleado'),
(13, 'Can add marca', 4, 'add_marca'),
(14, 'Can change marca', 4, 'change_marca'),
(15, 'Can delete marca', 4, 'delete_marca'),
(16, 'Can view marca', 4, 'view_marca'),
(17, 'Can add modelo auto', 5, 'add_modeloauto'),
(18, 'Can change modelo auto', 5, 'change_modeloauto'),
(19, 'Can delete modelo auto', 5, 'delete_modeloauto'),
(20, 'Can view modelo auto', 5, 'view_modeloauto'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add permission', 7, 'add_permission'),
(26, 'Can change permission', 7, 'change_permission'),
(27, 'Can delete permission', 7, 'delete_permission'),
(28, 'Can view permission', 7, 'view_permission'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add content type', 10, 'add_contenttype'),
(38, 'Can change content type', 10, 'change_contenttype'),
(39, 'Can delete content type', 10, 'delete_contenttype'),
(40, 'Can view content type', 10, 'view_contenttype'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, '25821045', NULL, 0, 'alejislarga', 'aleja', 'nariño', 'aleja.larga@gmail.com', 0, 1, '2023-09-12 12:32:55.600921'),
(3, '123456', NULL, 0, 'maicolb', 'mariana', 'cararfca', 'lainemarandola@gmail.com', 0, 1, '2023-09-12 12:40:05.618121'),
(4, '45612378', NULL, 0, 'mariajulissa', 'panaeme', 'sosa', 'test@gmail.com', 0, 1, '2023-09-12 13:19:47.839487'),
(5, '12345678', NULL, 0, 'jmamuel', 'jaun', 'nanuel', 'test2@gmail.com', 0, 1, '2023-09-12 13:28:23.520647'),
(6, 'pbkdf2_sha256$600000$XUhH6ZMmWJbqvf9RZBlymQ$5mrBpY8Z3kMfvAPr5VH4p9mCkCUEhvjcmUXlRJMkLUc=', '2023-09-12 16:15:14.049222', 0, 'test3', 'test3', 'test3', 'test3@gmail.com', 0, 1, '2023-09-12 13:30:25.541425'),
(7, 'pbkdf2_sha256$600000$vgzLUwwV6rEgFw2HrkrNZQ$8uROATA35SZo6lMYw0v8PMy8xFRX1WA7Zb8iOIShRzw=', '2023-09-12 15:59:04.622231', 0, 'test4', 'alejandro', 'Correa', 'test4@gmail.com', 0, 1, '2023-09-12 15:54:14.484488'),
(8, 'pbkdf2_sha256$600000$72rsaFhDohiMFutMhq3xGp$XFLrWixl3jy88N11oa085GfhR1SpmgTFqm1JJJNp3RE=', NULL, 0, 'freddy', 'freddy', 'camacho', 'f@gmail.com', 0, 1, '2023-09-12 16:21:43.437050'),
(10, 'pbkdf2_sha256$600000$laDNgQpnnr46PlUAWJmUd0$2SSHfH45Vj02toEyGAlzqo5jHWBjlemihV1g3zHFQ6w=', '2023-09-12 16:22:20.520704', 0, 'freddy123', 'freddy123', 'camacho', 'f@gmail.com', 0, 1, '2023-09-12 16:22:03.358719');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `salario` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`id`, `nombre`, `salario`) VALUES
(1, 'GERENTE', '800000');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(8, 'auth', 'group'),
(7, 'auth', 'permission'),
(9, 'auth', 'user'),
(10, 'contenttypes', 'contenttype'),
(2, 'myproject', 'cargo'),
(3, 'myproject', 'empleado'),
(4, 'myproject', 'marca'),
(5, 'myproject', 'modeloauto'),
(1, 'myproject', 'prueba'),
(11, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-09-04 20:12:26.927940'),
(2, 'auth', '0001_initial', '2023-09-04 20:12:30.720701'),
(3, 'admin', '0001_initial', '2023-09-04 20:12:31.803314'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-09-04 20:12:31.819400'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-04 20:12:31.841965'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-09-04 20:12:32.125149'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-09-04 20:12:32.515102'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-09-04 20:12:32.583265'),
(9, 'auth', '0004_alter_user_username_opts', '2023-09-04 20:12:32.595912'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-09-04 20:12:33.192372'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-09-04 20:12:33.303000'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-09-04 20:12:33.353294'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-09-04 20:12:33.408904'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-09-04 20:12:33.486150'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-09-04 20:12:33.649928'),
(16, 'auth', '0011_update_proxy_permissions', '2023-09-04 20:12:33.726157'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-09-04 20:12:33.819835'),
(18, 'sessions', '0001_initial', '2023-09-04 20:12:34.730740');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `cargo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `apellido`, `celular`, `cargo_id`) VALUES
(9, 'maria', 'sasad', '78596446', 1),
(13, 'mariana', 'capiche', '12304567', 1);

-- --------------------------------------------------------

--
-- Table structure for table `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `anio_fundacion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `pais`, `anio_fundacion`) VALUES
(1, 'Toyota', 'Colombia', '28/08/1937'),
(2, 'honda', 'Japon', '24/09/1948');

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `anio` varchar(10) NOT NULL,
  `precio` varchar(20) NOT NULL,
  `motor` varchar(6) NOT NULL,
  `transmision` varchar(20) NOT NULL,
  `marca_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modelo`
--

INSERT INTO `modelo` (`id`, `nombre`, `tipo`, `anio`, `precio`, `motor`, `transmision`, `marca_id`) VALUES
(1, 'Fouruner', '4x4', '2024', '70000000', '1.8', 'manual', 2),
(2, 'veloster', 'coupe', '2020', '56000000', '2.5L', 'Automatico', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cargo_id` (`cargo_id`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marca_id` (`marca_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`);

--
-- Constraints for table `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
