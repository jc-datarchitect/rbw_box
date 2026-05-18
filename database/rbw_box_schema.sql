-- ============================================================================
-- SISTEMA RBW_BOX: ARQUITECTURA DE BASE DE DATOS RELACIONAL
-- Autor: Javier Cristóbal Fernández
-- Investigación: Desde el Lápiz al Dataset: Arquitectura Generativa y Trazabilidad Algorítmica
-- ============================================================================

-- 1. TABLA: PROJECTS (Datos Generales de la Obra)
CREATE TABLE PROJECTS (
    PRJ_ID INT AUTO_INCREMENT,
    PRJ_NAME VARCHAR(255) NOT NULL,
    PRJ_STATE ENUM('Not Started', 'In Progress', 'Completed') DEFAULT 'Not Started',
    PRJ_START_DATE DATE NOT NULL,
    PRJ_END_DATE DATE,
    PRJ_DURATION INT AS (DATEDIFF(PRJ_END_DATE, PRJ_START_DATE)) VIRTUAL,
    PRJ_COUNTRY VARCHAR(100) NOT NULL,
    PRJ_REGION VARCHAR(100),
    PRJ_CITY VARCHAR(100) NOT NULL,
    PRJ_TYPOLOGY ENUM('Residential', 'Commercial', 'Industrial', 'Institutional', 'Infrastructure') NOT NULL,
    PRJ_FLOORS INT NOT NULL,
    PRJ_HEIGHT FLOAT NOT NULL,
    PRJ_STRUCT_TYPE ENUM('Reinforced Concrete', 'Structural Steel', 'Laminated Timber', 'Load-Bearing Masonry', 'Hybrid') NOT NULL,
    PRJ_FOUNDAT_TYPE ENUM('Shallow Footings', 'Mat Foundation', 'Deep Piles', 'Drilled Shafts') NOT NULL,
    PRIMARY KEY (PRJ_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. TABLA: PHASES (Ciclo de Vida y Gestión del Proyecto)
CREATE TABLE PHASES (
    PHS_ID INT AUTO_INCREMENT,
    PRJ_ID INT NOT NULL,
    PHS_NAME ENUM('Pre-Design', 'Conceptual Design', 'Schematic Design', 'Detailed/Executive Design', 'Construction Administration') NOT NULL,
    PHS_START_DATE DATE NOT NULL,
    PHS_END_DATE DATE,
    PHS_DURATION INT AS (DATEDIFF(PHS_END_DATE, PHS_START_DATE)) VIRTUAL,
    PHS_VALIDATOR_ID INT,
    PRIMARY KEY (PHS_ID),
    CONSTRAINT FK_PHASES_PROJECTS FOREIGN KEY (PRJ_ID) REFERENCES PROJECTS(PRJ_ID) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. TABLA: USERS (Actores de la Ecología Proyectual)
-- Nota: Se crea aquí para que PHASES, PROMPTS, ACTIONS y VALIDATIONS puedan enlazar sus Foreign Keys sin errores de orden.
CREATE TABLE USERS (
    USR_ID INT AUTO_INCREMENT,
    USR_NAME VARCHAR(150) NOT NULL,
    USR_ROLE ENUM('Principal Architect', 'Collaborating Designer', 'Structural Engineer', 'Bioclimatic Consultant', 'End User/Client', 'Algorithmic Auditor') NOT NULL,
    USR_DIGITAL_SIGNAT TEXT NOT NULL,
    PRIMARY KEY (USR_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Añadir la Foreign Key en PHASES que apunta a USERS una vez creada la tabla USERS
ALTER TABLE PHASES ADD CONSTRAINT FK_PHASES_USERS FOREIGN KEY (PHS_VALIDATOR_ID) REFERENCES USERS(USR_ID) ON DELETE SET NULL;

-- 3. TABLA: PROMPTS (Ingeniería de Entrada de Datos - Capa Blanca)
CREATE TABLE PROMPTS (
    PRM_ID INT AUTO_INCREMENT,
    PHS_ID INT NOT NULL,
    USR_ID INT NOT NULL,
    PRM_TYPE ENUM('Text', 'Image Reference/Img2Img', 'Vector Plan', 'Point Cloud', 'Numerical Parameter') NOT NULL,
    PRM_TEXT TEXT NOT NULL,
    PRM_SUBM_DATE DATE NOT NULL,
    PRM_IA_MODEL VARCHAR(100) NOT NULL,
    PRIMARY KEY (PRM_ID),
    CONSTRAINT FK_PROMPTS_PHASES FOREIGN KEY (PHS_ID) REFERENCES PHASES(PHS_ID) ON DELETE CASCADE,
    CONSTRAINT FK_PROMPTS_USERS FOREIGN KEY (USR_ID) REFERENCES USERS(USR_ID) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. TABLA: OUTPUTS (Respuestas del Sistema Sintético)
CREATE TABLE OUTPUTS (
    OPT_ID INT AUTO_INCREMENT,
    PRM_ID INT NOT NULL,
    OPT_TYPE ENUM('Image/Render', '3D Mesh Model', 'CAD/DWG Plan', 'Text/Descriptive Memory', 'Programming Code/G-Code') NOT NULL,
    OPT_IMG VARCHAR(500) NOT NULL,
    OPT_SELECTED BOOLEAN DEFAULT FALSE,
    OPT_DISCARD_REASON TEXT,
    OPT_TECH_NOTES TEXT,
    PRIMARY KEY (OPT_ID),
    CONSTRAINT FK_OUTPUTS_PROMPTS FOREIGN KEY (PRM_ID) REFERENCES PROMPTS(PRM_ID) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. TABLA: ACTIONS (Trazabilidad Fina de Operaciones - Capa Negra)
CREATE TABLE ACTIONS (
    ACT_ID INT AUTO_INCREMENT,
    OPT_ID INT NOT NULL,
    USR_ID INT NOT NULL,
    ACT_TYPE ENUM('Validate', 'Discard', 'Comment', 'Edit/Modify', 'Bookmark/Favorite') NOT NULL,
    ACT_DATE DATE NOT NULL,
    ACT_TIME TIME(3) NOT NULL, -- Precisión de milisegundos para logs técnicos
    ACT_TEXT TEXT,
    PRIMARY KEY (ACT_ID),
    CONSTRAINT FK_ACTIONS_OUTPUTS FOREIGN KEY (OPT_ID) REFERENCES OUTPUTS(OPT_ID) ON DELETE CASCADE,
    CONSTRAINT FK_ACTIONS_USERS FOREIGN KEY (USR_ID) REFERENCES USERS(USR_ID) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 7. TABLA: VALIDATIONS (Cierre Formal de Contratos y Fases - Capa Roja)
CREATE TABLE VALIDATIONS (
    VALID_ID INT AUTO_INCREMENT,
    PHS_ID INT NOT NULL,
    USR_ID INT NOT NULL,
    VALID_DATE DATE NOT NULL,
    VALID_TIME TIME NOT NULL,
    VALID_TEXT TEXT NOT NULL,
    PRIMARY KEY (VALID_ID),
    CONSTRAINT FK_VALIDATIONS_PHASES FOREIGN KEY (PHS_ID) REFERENCES PHASES(PHS_ID) ON DELETE CASCADE,
    CONSTRAINT FK_VALIDATIONS_USERS FOREIGN KEY (USR_ID) REFERENCES USERS(USR_ID) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;