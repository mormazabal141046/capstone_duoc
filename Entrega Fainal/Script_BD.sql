-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aulasansebastian
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aulasansebastian
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aulasansebastian` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `aulasansebastian` ;

-- -----------------------------------------------------
-- Table `aulasansebastian`.`administrativo_antecedentesfamiliares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`administrativo_antecedentesfamiliares` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre_padre` VARCHAR(50) NOT NULL,
  `fecha_nac_padre` DATE NOT NULL,
  `nombre_madre` VARCHAR(50) NOT NULL,
  `fecha_nac_madre` DATE NOT NULL,
  `convivientes` VARCHAR(50) NOT NULL,
  `total_hermanos` INT NOT NULL,
  `posicion_familiar` INT NOT NULL,
  `cantidad_personas_hogar` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`registro_region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`registro_region` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`registro_comuna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`registro_comuna` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `region_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `registro_comuna_region_id_8808735d_fk_registro_region_id` (`region_id` ASC) VISIBLE,
  CONSTRAINT `registro_comuna_region_id_8808735d_fk_registro_region_id`
    FOREIGN KEY (`region_id`)
    REFERENCES `aulasansebastian`.`registro_region` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 349
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`personas_apoderado_backup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`personas_apoderado_backup` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `rut` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellido_paterno` VARCHAR(100) NOT NULL,
  `apellido_materno` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `ubicacion` VARCHAR(255) NULL DEFAULT NULL,
  `parentezco` VARCHAR(200) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `comuna_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rut` (`rut` ASC) VISIBLE,
  INDEX `personas_apoderado_b_comuna_id_566b185f_fk_registro_` (`comuna_id` ASC) VISIBLE,
  CONSTRAINT `personas_apoderado_b_comuna_id_566b185f_fk_registro_`
    FOREIGN KEY (`comuna_id`)
    REFERENCES `aulasansebastian`.`registro_comuna` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`personas_apoderado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`personas_apoderado` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `rut` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellido_paterno` VARCHAR(100) NOT NULL,
  `apellido_materno` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `parentezco` VARCHAR(200) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `comuna_id` BIGINT NULL DEFAULT NULL,
  `ubicacion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rut` (`rut` ASC) VISIBLE,
  INDEX `personas_apoderado_comuna_id_adfce3f7_fk_registro_comuna_id` (`comuna_id` ASC) VISIBLE,
  CONSTRAINT `personas_apoderado_comuna_id_adfce3f7_fk_registro_comuna_id`
    FOREIGN KEY (`comuna_id`)
    REFERENCES `aulasansebastian`.`registro_comuna` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`academico_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`academico_curso` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `grado` VARCHAR(50) NOT NULL,
  `identificador` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`personas_alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`personas_alumno` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `rut` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellido_paterno` VARCHAR(100) NOT NULL,
  `apellido_materno` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `colegio_origen` VARCHAR(200) NOT NULL,
  `identificador_curso` VARCHAR(200) NOT NULL,
  `curso_id` BIGINT NOT NULL,
  `apoderado_id` BIGINT NULL DEFAULT NULL,
  `comuna_id` BIGINT NULL DEFAULT NULL,
  `ubicacion` VARCHAR(255) NULL DEFAULT NULL,
  `antecedentes_familiares_id` BIGINT NULL DEFAULT NULL,
  `apoderado_backup_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rut` (`rut` ASC) VISIBLE,
  INDEX `personas_alumno_curso_id_36188aa5_fk_academico_curso_id` (`curso_id` ASC) VISIBLE,
  INDEX `personas_alumno_apoderado_id_df869df7_fk_personas_apoderado_id` (`apoderado_id` ASC) VISIBLE,
  INDEX `personas_alumno_comuna_id_a9b0833b_fk_registro_comuna_id` (`comuna_id` ASC) VISIBLE,
  INDEX `personas_alumno_antecedentes_familia_499aade9_fk_administr` (`antecedentes_familiares_id` ASC) VISIBLE,
  INDEX `personas_alumno_apoderado_backup_id_96fe9528_fk_personas_` (`apoderado_backup_id` ASC) VISIBLE,
  CONSTRAINT `personas_alumno_antecedentes_familia_499aade9_fk_administr`
    FOREIGN KEY (`antecedentes_familiares_id`)
    REFERENCES `aulasansebastian`.`administrativo_antecedentesfamiliares` (`id`),
  CONSTRAINT `personas_alumno_apoderado_backup_id_96fe9528_fk_personas_`
    FOREIGN KEY (`apoderado_backup_id`)
    REFERENCES `aulasansebastian`.`personas_apoderado_backup` (`id`),
  CONSTRAINT `personas_alumno_apoderado_id_df869df7_fk_personas_apoderado_id`
    FOREIGN KEY (`apoderado_id`)
    REFERENCES `aulasansebastian`.`personas_apoderado` (`id`),
  CONSTRAINT `personas_alumno_comuna_id_a9b0833b_fk_registro_comuna_id`
    FOREIGN KEY (`comuna_id`)
    REFERENCES `aulasansebastian`.`registro_comuna` (`id`),
  CONSTRAINT `personas_alumno_curso_id_36188aa5_fk_academico_curso_id`
    FOREIGN KEY (`curso_id`)
    REFERENCES `aulasansebastian`.`academico_curso` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`administrativo_sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`administrativo_sede` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`personas_docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`personas_docente` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `rut` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellido_paterno` VARCHAR(100) NOT NULL,
  `apellido_materno` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sede_id` BIGINT NULL DEFAULT NULL,
  `comuna_id` BIGINT NULL DEFAULT NULL,
  `ubicacion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rut` (`rut` ASC) VISIBLE,
  INDEX `personas_docente_sede_id_7ce7daff_fk_temp_user_id` (`sede_id` ASC) VISIBLE,
  INDEX `personas_docente_comuna_id_06de4cb8_fk_registro_comuna_id` (`comuna_id` ASC) VISIBLE,
  CONSTRAINT `personas_docente_comuna_id_06de4cb8_fk_registro_comuna_id`
    FOREIGN KEY (`comuna_id`)
    REFERENCES `aulasansebastian`.`registro_comuna` (`id`),
  CONSTRAINT `personas_docente_sede_id_7ce7daff_fk_temp_user_id`
    FOREIGN KEY (`sede_id`)
    REFERENCES `aulasansebastian`.`administrativo_sede` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`academico_asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`academico_asignatura` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `alumno_id` BIGINT NOT NULL,
  `docente_id` BIGINT NOT NULL,
  `curso_id` BIGINT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `academico_asignatura_alumno_id_7be06641_fk_personas_alumno_id` (`alumno_id` ASC) VISIBLE,
  INDEX `academico_asignatura_docente_id_2d1bcdef_fk_personas_docente_id` (`docente_id` ASC) VISIBLE,
  INDEX `academico_asignatura_curso_id_954ce1ef_fk_academico_curso_id` (`curso_id` ASC) VISIBLE,
  CONSTRAINT `academico_asignatura_alumno_id_7be06641_fk_personas_alumno_id`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `aulasansebastian`.`personas_alumno` (`id`),
  CONSTRAINT `academico_asignatura_curso_id_954ce1ef_fk_academico_curso_id`
    FOREIGN KEY (`curso_id`)
    REFERENCES `aulasansebastian`.`academico_curso` (`id`),
  CONSTRAINT `academico_asignatura_docente_id_2d1bcdef_fk_personas_docente_id`
    FOREIGN KEY (`docente_id`)
    REFERENCES `aulasansebastian`.`personas_docente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`academico_calificaciondocente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`academico_calificaciondocente` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `calificacion` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`academico_tipoclase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`academico_tipoclase` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`academico_clase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`academico_clase` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `hr_inicio_programado` TIME NOT NULL,
  `hr_termino_programado` TIME NOT NULL,
  `hr_inicio_efectivo` TIME NULL DEFAULT NULL,
  `hr_termino_efectivo` TIME NULL DEFAULT NULL,
  `duracion_clase` BIGINT NOT NULL,
  `tipo_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `academico_clase_tipo_id_18e2ba5f_fk_academico_tipoclase_id` (`tipo_id` ASC) VISIBLE,
  CONSTRAINT `academico_clase_tipo_id_18e2ba5f_fk_academico_tipoclase_id`
    FOREIGN KEY (`tipo_id`)
    REFERENCES `aulasansebastian`.`academico_tipoclase` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`academico_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`academico_material` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NOT NULL,
  `ruta_directorio` VARCHAR(500) NOT NULL,
  `asignatura_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `academico_material_asignatura_id_86bd0b70_fk_academico` (`asignatura_id` ASC) VISIBLE,
  CONSTRAINT `academico_material_asignatura_id_86bd0b70_fk_academico`
    FOREIGN KEY (`asignatura_id`)
    REFERENCES `aulasansebastian`.`academico_asignatura` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`programa_listaprogramaapoyo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`programa_listaprogramaapoyo` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`administrativo_matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`administrativo_matricula` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `folio` VARCHAR(50) NOT NULL,
  `fecha` DATE NOT NULL,
  `observaciones` LONGTEXT NOT NULL,
  `alumno_id` BIGINT NOT NULL,
  `programa_apoyo_id` BIGINT NULL DEFAULT NULL,
  `sede_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `administrativo_matri_alumno_id_d5846b24_fk_personas_` (`alumno_id` ASC) VISIBLE,
  INDEX `administrativo_matri_programa_apoyo_id_e4398904_fk_programa_` (`programa_apoyo_id` ASC) VISIBLE,
  INDEX `administrativo_matricula_sede_id_d33a1b31_fk_temp_user_id` (`sede_id` ASC) VISIBLE,
  CONSTRAINT `administrativo_matri_alumno_id_d5846b24_fk_personas_`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `aulasansebastian`.`personas_alumno` (`id`),
  CONSTRAINT `administrativo_matri_programa_apoyo_id_e4398904_fk_programa_`
    FOREIGN KEY (`programa_apoyo_id`)
    REFERENCES `aulasansebastian`.`programa_listaprogramaapoyo` (`id`),
  CONSTRAINT `administrativo_matricula_sede_id_d33a1b31_fk_temp_user_id`
    FOREIGN KEY (`sede_id`)
    REFERENCES `aulasansebastian`.`administrativo_sede` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`administrativo_notasalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`administrativo_notasalumno` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nota` DOUBLE NOT NULL,
  `fecha_nota` DATE NOT NULL,
  `alumno_id` BIGINT NOT NULL,
  `asignatura_id` BIGINT NOT NULL,
  `curso_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `administrativo_notas_alumno_id_8ed43341_fk_personas_` (`alumno_id` ASC) VISIBLE,
  INDEX `administrativo_notas_asignatura_id_a97a3559_fk_academico` (`asignatura_id` ASC) VISIBLE,
  INDEX `administrativo_notas_curso_id_e681bc1d_fk_academico` (`curso_id` ASC) VISIBLE,
  CONSTRAINT `administrativo_notas_alumno_id_8ed43341_fk_personas_`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `aulasansebastian`.`personas_alumno` (`id`),
  CONSTRAINT `administrativo_notas_asignatura_id_a97a3559_fk_academico`
    FOREIGN KEY (`asignatura_id`)
    REFERENCES `aulasansebastian`.`academico_asignatura` (`id`),
  CONSTRAINT `administrativo_notas_curso_id_e681bc1d_fk_academico`
    FOREIGN KEY (`curso_id`)
    REFERENCES `aulasansebastian`.`academico_curso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`administrativo_progresoalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`administrativo_progresoalumno` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `anio` INT NOT NULL,
  `estado_aprobacion` VARCHAR(50) NOT NULL,
  `alumno_id` BIGINT NOT NULL,
  `curso_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `administrativo_progr_alumno_id_a21fb1a9_fk_personas_` (`alumno_id` ASC) VISIBLE,
  INDEX `administrativo_progr_curso_id_13c2ba0b_fk_academico` (`curso_id` ASC) VISIBLE,
  CONSTRAINT `administrativo_progr_alumno_id_a21fb1a9_fk_personas_`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `aulasansebastian`.`personas_alumno` (`id`),
  CONSTRAINT `administrativo_progr_curso_id_13c2ba0b_fk_academico`
    FOREIGN KEY (`curso_id`)
    REFERENCES `aulasansebastian`.`academico_curso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`auth_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`django_content_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`auth_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC) VISIBLE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `aulasansebastian`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 129
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`auth_group_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `aulasansebastian`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `aulasansebastian`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`auth_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME(6) NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(150) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`auth_user_groups` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC) VISIBLE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `aulasansebastian`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `aulasansebastian`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`auth_user_user_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `aulasansebastian`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `aulasansebastian`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`django_admin_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC) VISIBLE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `aulasansebastian`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `aulasansebastian`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`django_migrations` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 50
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`personas_coordinador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`personas_coordinador` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `rut` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellido_paterno` VARCHAR(100) NOT NULL,
  `apellido_materno` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `comuna_id` BIGINT NULL DEFAULT NULL,
  `ubicacion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rut` (`rut` ASC) VISIBLE,
  INDEX `personas_coordinador_comuna_id_43d90b28_fk_registro_comuna_id` (`comuna_id` ASC) VISIBLE,
  CONSTRAINT `personas_coordinador_comuna_id_43d90b28_fk_registro_comuna_id`
    FOREIGN KEY (`comuna_id`)
    REFERENCES `aulasansebastian`.`registro_comuna` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`programa_hojadevida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`programa_hojadevida` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `promedio` DOUBLE NOT NULL,
  `observacion` LONGTEXT NOT NULL,
  `alumno_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `alumno_id` (`alumno_id` ASC) VISIBLE,
  CONSTRAINT `programa_hojadevida_alumno_id_ecdaa539_fk_personas_alumno_id`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `aulasansebastian`.`personas_alumno` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`registro_listahorariobloque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`registro_listahorariobloque` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `numero_bloque` INT NOT NULL,
  `hr_inicio_programado` TIME NOT NULL,
  `hr_termino_programado` TIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`registro_registroasignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`registro_registroasignatura` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `alumno_id` BIGINT NOT NULL,
  `asignatura_id` BIGINT NOT NULL,
  `docente_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `registro_registroasi_alumno_id_667543b3_fk_personas_` (`alumno_id` ASC) VISIBLE,
  INDEX `registro_registroasi_asignatura_id_89b6db12_fk_academico` (`asignatura_id` ASC) VISIBLE,
  INDEX `registro_registroasi_docente_id_ebd43121_fk_personas_` (`docente_id` ASC) VISIBLE,
  CONSTRAINT `registro_registroasi_alumno_id_667543b3_fk_personas_`
    FOREIGN KEY (`alumno_id`)
    REFERENCES `aulasansebastian`.`personas_alumno` (`id`),
  CONSTRAINT `registro_registroasi_asignatura_id_89b6db12_fk_academico`
    FOREIGN KEY (`asignatura_id`)
    REFERENCES `aulasansebastian`.`academico_asignatura` (`id`),
  CONSTRAINT `registro_registroasi_docente_id_ebd43121_fk_personas_`
    FOREIGN KEY (`docente_id`)
    REFERENCES `aulasansebastian`.`personas_docente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`registro_bloque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`registro_bloque` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `dia` VARCHAR(20) NOT NULL,
  `lista_horario_bloque_id` BIGINT NOT NULL,
  `registro_asignatura_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `registro_bloque_lista_horario_bloque_76bad1d7_fk_registro_` (`lista_horario_bloque_id` ASC) VISIBLE,
  INDEX `registro_bloque_registro_asignatura__b09f9c5a_fk_registro_` (`registro_asignatura_id` ASC) VISIBLE,
  CONSTRAINT `registro_bloque_lista_horario_bloque_76bad1d7_fk_registro_`
    FOREIGN KEY (`lista_horario_bloque_id`)
    REFERENCES `aulasansebastian`.`registro_listahorariobloque` (`id`),
  CONSTRAINT `registro_bloque_registro_asignatura__b09f9c5a_fk_registro_`
    FOREIGN KEY (`registro_asignatura_id`)
    REFERENCES `aulasansebastian`.`registro_registroasignatura` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`registro_coordinadorsede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`registro_coordinadorsede` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `coordinador_id` BIGINT NOT NULL,
  `sede_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `registro_coordinador_coordinador_id_3ad323a9_fk_personas_` (`coordinador_id` ASC) VISIBLE,
  INDEX `registro_coordinador_sede_id_cbe88955_fk_administr` (`sede_id` ASC) VISIBLE,
  CONSTRAINT `registro_coordinador_coordinador_id_3ad323a9_fk_personas_`
    FOREIGN KEY (`coordinador_id`)
    REFERENCES `aulasansebastian`.`personas_coordinador` (`id`),
  CONSTRAINT `registro_coordinador_sede_id_cbe88955_fk_administr`
    FOREIGN KEY (`sede_id`)
    REFERENCES `aulasansebastian`.`administrativo_sede` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`registro_motivoclase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`registro_motivoclase` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `descripcion_motivo` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aulasansebastian`.`registro_registroclase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulasansebastian`.`registro_registroclase` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `fecha_registro` DATETIME(6) NOT NULL,
  `calificacion_docente_id` BIGINT NULL DEFAULT NULL,
  `motivo_cierre_id` BIGINT NULL DEFAULT NULL,
  `tipo_clase_id` BIGINT NOT NULL,
  `hr_inicio_efectivo` TIME NOT NULL,
  `hr_termino_efectivo` TIME NOT NULL,
  `registro_asignatura_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `registro_registrocla_calificacion_docente_8bac3bb9_fk_academico` (`calificacion_docente_id` ASC) VISIBLE,
  INDEX `registro_registrocla_motivo_cierre_id_e37b77f6_fk_registro_` (`motivo_cierre_id` ASC) VISIBLE,
  INDEX `registro_registrocla_tipo_clase_id_3b236bfe_fk_academico` (`tipo_clase_id` ASC) VISIBLE,
  INDEX `registro_registrocla_registro_asignatura__2bdadfe3_fk_registro_` (`registro_asignatura_id` ASC) VISIBLE,
  CONSTRAINT `registro_registrocla_calificacion_docente_8bac3bb9_fk_academico`
    FOREIGN KEY (`calificacion_docente_id`)
    REFERENCES `aulasansebastian`.`academico_calificaciondocente` (`id`),
  CONSTRAINT `registro_registrocla_motivo_cierre_id_e37b77f6_fk_registro_`
    FOREIGN KEY (`motivo_cierre_id`)
    REFERENCES `aulasansebastian`.`registro_motivoclase` (`id`),
  CONSTRAINT `registro_registrocla_registro_asignatura__2bdadfe3_fk_registro_`
    FOREIGN KEY (`registro_asignatura_id`)
    REFERENCES `aulasansebastian`.`registro_registroasignatura` (`id`),
  CONSTRAINT `registro_registrocla_tipo_clase_id_3b236bfe_fk_academico`
    FOREIGN KEY (`tipo_clase_id`)
    REFERENCES `aulasansebastian`.`academico_tipoclase` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
