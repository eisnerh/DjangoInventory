-- MySQL Script generated by MySQL Workbench
-- Sat 14 Apr 2018 07:45:30 PM CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema my_app
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema my_app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `my_app` DEFAULT CHARACTER SET latin1 ;
USE `my_app` ;

-- -----------------------------------------------------
-- Table `my_app`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`auth_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`django_content_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`auth_permission` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT(11) NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `my_app`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 52
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`auth_group_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC),
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `my_app`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `my_app`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`auth_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`auth_user_groups` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `group_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC),
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `my_app`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `my_app`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`auth_user_user_permissions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC),
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `my_app`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `my_app`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`django_admin_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT(5) UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC),
  INDEX `django_admin_log_user_id_c564eba6_fk` (`user_id` ASC),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `my_app`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `my_app`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`django_migrations` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_almacen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_almacen` (
  `idalmacen` INT(11) NOT NULL AUTO_INCREMENT,
  `almacen` LONGTEXT NOT NULL,
  PRIMARY KEY (`idalmacen`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_clasificacionevento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_clasificacionevento` (
  `idClasificacion_evento` INT(11) NOT NULL AUTO_INCREMENT,
  `Clasificacion_evento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClasificacion_evento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre_cliente` VARCHAR(45) NOT NULL,
  `Apellido_cliente` VARCHAR(45) NOT NULL,
  `Telefono_cliente` VARCHAR(45) NOT NULL,
  `Correo_electronico` VARCHAR(45) NOT NULL,
  `Otros_datos_cliente` LONGTEXT NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_evento` (
  `idEvento` INT(11) NOT NULL AUTO_INCREMENT,
  `NombreEvento` VARCHAR(45) NOT NULL,
  `CodigoEvento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEvento`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_detalleevento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_detalleevento` (
  `idDetalle_evento` INT(11) NOT NULL AUTO_INCREMENT,
  `FechaInicio` DATE NOT NULL,
  `FechaFin` DATE NOT NULL,
  `ClasificacionEvento_idClasificacionEvento_id` INT(11) NOT NULL,
  `Evento_idEvento_id` INT(11) NOT NULL,
  PRIMARY KEY (`idDetalle_evento`),
  INDEX `full_inventory_detal_ClasificacionEvento__ca801701_fk_full_inve` (`ClasificacionEvento_idClasificacionEvento_id` ASC),
  INDEX `full_inventory_detal_Evento_idEvento_id_111d0ab4_fk_full_inve` (`Evento_idEvento_id` ASC),
  CONSTRAINT `full_inventory_detal_ClasificacionEvento__ca801701_fk_full_inve`
    FOREIGN KEY (`ClasificacionEvento_idClasificacionEvento_id`)
    REFERENCES `my_app`.`full_inventory_clasificacionevento` (`idClasificacion_evento`),
  CONSTRAINT `full_inventory_detal_Evento_idEvento_id_111d0ab4_fk_full_inve`
    FOREIGN KEY (`Evento_idEvento_id`)
    REFERENCES `my_app`.`full_inventory_evento` (`idEvento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_eventocliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_eventocliente` (
  `idEventoCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `ClienteIdCliente_id` INT(11) NOT NULL,
  `EventoIdEvento_id` INT(11) NOT NULL,
  PRIMARY KEY (`idEventoCliente`),
  INDEX `full_inventory_event_ClienteIdCliente_id_8b7bc492_fk_full_inve` (`ClienteIdCliente_id` ASC),
  INDEX `full_inventory_event_EventoIdEvento_id_9f9fa400_fk_full_inve` (`EventoIdEvento_id` ASC),
  CONSTRAINT `full_inventory_event_ClienteIdCliente_id_8b7bc492_fk_full_inve`
    FOREIGN KEY (`ClienteIdCliente_id`)
    REFERENCES `my_app`.`full_inventory_cliente` (`idCliente`),
  CONSTRAINT `full_inventory_event_EventoIdEvento_id_9f9fa400_fk_full_inve`
    FOREIGN KEY (`EventoIdEvento_id`)
    REFERENCES `my_app`.`full_inventory_evento` (`idEvento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_pallet_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_pallet_type` (
  `idpallet_type` INT(11) NOT NULL AUTO_INCREMENT,
  `pallet_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpallet_type`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_ubication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_ubication` (
  `idubication` INT(11) NOT NULL AUTO_INCREMENT,
  `ubication` LONGTEXT NOT NULL,
  PRIMARY KEY (`idubication`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_unity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_unity` (
  `idunity` INT(11) NOT NULL AUTO_INCREMENT,
  `unity` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idunity`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_product` (
  `idProduct` INT(11) NOT NULL AUTO_INCREMENT,
  `material` INT(11) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `ple` INT(11) NOT NULL,
  `cajas` INT(11) NOT NULL,
  `unidades` DOUBLE NOT NULL,
  `expiration_date` DATE NOT NULL,
  `fecha_em` DATE NOT NULL,
  `bar_code` BIGINT(20) NOT NULL,
  `cant_ideal` BIGINT(20) NOT NULL,
  `almacen_idalmacen_id` INT(11) NOT NULL,
  `pallet_type_idpallet_type_id` INT(11) NOT NULL,
  `ubication_idubication_id` INT(11) NOT NULL,
  `unidad_idunidad_id` INT(11) NOT NULL,
  PRIMARY KEY (`idProduct`),
  INDEX `full_inventory_produ_almacen_idalmacen_id_510be68d_fk_full_inve` (`almacen_idalmacen_id` ASC),
  INDEX `full_inventory_produ_pallet_type_idpallet_9e14a1e6_fk_full_inve` (`pallet_type_idpallet_type_id` ASC),
  INDEX `full_inventory_produ_ubication_idubicatio_5667edf6_fk_full_inve` (`ubication_idubication_id` ASC),
  INDEX `full_inventory_produ_unidad_idunidad_id_b55a3836_fk_full_inve` (`unidad_idunidad_id` ASC),
  CONSTRAINT `full_inventory_produ_almacen_idalmacen_id_510be68d_fk_full_inve`
    FOREIGN KEY (`almacen_idalmacen_id`)
    REFERENCES `my_app`.`full_inventory_almacen` (`idalmacen`),
  CONSTRAINT `full_inventory_produ_pallet_type_idpallet_9e14a1e6_fk_full_inve`
    FOREIGN KEY (`pallet_type_idpallet_type_id`)
    REFERENCES `my_app`.`full_inventory_pallet_type` (`idpallet_type`),
  CONSTRAINT `full_inventory_produ_ubication_idubicatio_5667edf6_fk_full_inve`
    FOREIGN KEY (`ubication_idubication_id`)
    REFERENCES `my_app`.`full_inventory_ubication` (`idubication`),
  CONSTRAINT `full_inventory_produ_unidad_idunidad_id_b55a3836_fk_full_inve`
    FOREIGN KEY (`unidad_idunidad_id`)
    REFERENCES `my_app`.`full_inventory_unity` (`idunity`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `my_app`.`full_inventory_eventomaterial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_app`.`full_inventory_eventomaterial` (
  `idEventoMaterial` INT(11) NOT NULL AUTO_INCREMENT,
  `EventoIdEvento_id` INT(11) NOT NULL,
  `MaterialIdMaterial_id` INT(11) NOT NULL,
  `cantidad_solicitada` BIGINT(20) NOT NULL,
  PRIMARY KEY (`idEventoMaterial`),
  INDEX `full_inventory_event_EventoIdEvento_id_e54ab097_fk_full_inve` (`EventoIdEvento_id` ASC),
  INDEX `full_inventory_event_MaterialIdMaterial_i_2da887d5_fk_full_inve` (`MaterialIdMaterial_id` ASC),
  CONSTRAINT `full_inventory_event_EventoIdEvento_id_e54ab097_fk_full_inve`
    FOREIGN KEY (`EventoIdEvento_id`)
    REFERENCES `my_app`.`full_inventory_evento` (`idEvento`),
  CONSTRAINT `full_inventory_event_MaterialIdMaterial_i_2da887d5_fk_full_inve`
    FOREIGN KEY (`MaterialIdMaterial_id`)
    REFERENCES `my_app`.`full_inventory_product` (`idProduct`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
