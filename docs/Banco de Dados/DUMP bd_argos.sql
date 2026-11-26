-- =====================================================================
--  ARGOS - Sistema de chamados de reparo dos laboratórios
--  Script de criação do banco (MySQL / MariaDB)
-- =====================================================================

DROP DATABASE IF EXISTS bd_argos;
CREATE DATABASE bd_argos;
USE bd_argos;

-- ---------------------------------------------------------------------
-- Tabelas "de apoio" (não dependem de ninguém) - criadas primeiro
-- ---------------------------------------------------------------------

CREATE TABLE tb_cursos (
    id_curso    INT AUTO_INCREMENT PRIMARY KEY,
    descritivo  VARCHAR(100) NOT NULL
);

CREATE TABLE tb_nivel_users (
    id_nivel_user INT AUTO_INCREMENT PRIMARY KEY,
    descritivo    VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descritivo   VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE tb_laboratorios (
    id_laboratorio INT AUTO_INCREMENT PRIMARY KEY,
    descritivo     VARCHAR(100) NOT NULL
);

-- ---------------------------------------------------------------------
-- Usuários
-- ---------------------------------------------------------------------

CREATE TABLE tb_users (
    id_user                      INT AUTO_INCREMENT PRIMARY KEY,
    nome                         VARCHAR(100) NOT NULL,
    email                        VARCHAR(150) NOT NULL UNIQUE,  -- usado como login (e como salt)
    senha                        CHAR(64)     NOT NULL,         -- SHA-256 em hexadecimal = 64 caracteres
    fk_tb_cursos_id_curso        INT NULL,                      -- NULL para técnico/admin sem curso
    fk_tb_nivel_users_id_nivel_user INT NOT NULL,
    CONSTRAINT fk_users_curso FOREIGN KEY (fk_tb_cursos_id_curso)
        REFERENCES tb_cursos (id_curso) ON DELETE SET NULL,
    CONSTRAINT fk_users_nivel FOREIGN KEY (fk_tb_nivel_users_id_nivel_user)
        REFERENCES tb_nivel_users (id_nivel_user)
);

-- ---------------------------------------------------------------------
-- Equipamentos (cada equipamento fica em 1 laboratório)
-- ---------------------------------------------------------------------

CREATE TABLE tb_equipamentos (
    id_equipamento                  INT AUTO_INCREMENT PRIMARY KEY,
    descritivo                      VARCHAR(100) NOT NULL,   -- ex.: "Computador", "Projetor"
    identificacao                   VARCHAR(50)  NOT NULL,   -- ex.: "PC 12", nº de patrimônio
    fk_tb_laboratorios_id_laboratorio INT NOT NULL,
    CONSTRAINT fk_equip_lab FOREIGN KEY (fk_tb_laboratorios_id_laboratorio)
        REFERENCES tb_laboratorios (id_laboratorio)
);

-- ---------------------------------------------------------------------
-- Relatos (os chamados)
-- ---------------------------------------------------------------------

CREATE TABLE tb_relatos (
    id_relato                         INT AUTO_INCREMENT PRIMARY KEY,
    descricao                         TEXT NOT NULL,
    DATA                              DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fk_tb_users_id_user               INT NOT NULL,   -- quem abriu o chamado
    fk_tb_laboratorios_id_laboratorio INT NOT NULL,
    fk_tb_categorias_id_categoria     INT NOT NULL,
    fk_tb_equipamentos_id_equipamento INT NULL,       -- opcional: o problema pode ser da sala toda
    CONSTRAINT fk_relato_user FOREIGN KEY (fk_tb_users_id_user)
        REFERENCES tb_users (id_user),
    CONSTRAINT fk_relato_lab FOREIGN KEY (fk_tb_laboratorios_id_laboratorio)
        REFERENCES tb_laboratorios (id_laboratorio),
    CONSTRAINT fk_relato_categoria FOREIGN KEY (fk_tb_categorias_id_categoria)
        REFERENCES tb_categorias (id_categoria),
    CONSTRAINT fk_relato_equip FOREIGN KEY (fk_tb_equipamentos_id_equipamento)
        REFERENCES tb_equipamentos (id_equipamento) ON DELETE SET NULL
);

-- ---------------------------------------------------------------------
-- Interações do relato (histórico de status / urgência)
-- ---------------------------------------------------------------------

CREATE TABLE tb_relatos_interacoes (
    id_relato_interacao   INT AUTO_INCREMENT PRIMARY KEY,
    STATUS                ENUM('Aberto','Em andamento','Resolvido','Cancelado')
                          NOT NULL DEFAULT 'Aberto',
    urgencia              ENUM('Baixa','Média','Alta') NOT NULL DEFAULT 'Média',
    DATA                  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fk_tb_relatos_id_relato INT NOT NULL,
    fk_tb_users_id_user     INT NOT NULL,   -- quem registrou a interação (técnico, admin...)
    CONSTRAINT fk_inter_relato FOREIGN KEY (fk_tb_relatos_id_relato)
        REFERENCES tb_relatos (id_relato) ON DELETE CASCADE,
    CONSTRAINT fk_inter_user FOREIGN KEY (fk_tb_users_id_user)
        REFERENCES tb_users (id_user)
);

-- ---------------------------------------------------------------------
-- Imagens do relato (requisito de gerenciamento de imagens)
-- ---------------------------------------------------------------------

CREATE TABLE tb_imagens (
    id_imagem               INT AUTO_INCREMENT PRIMARY KEY,
    caminho                 VARCHAR(255) NOT NULL,   -- ex.: "uploads/6567a1b2c3.jpg"
    fk_tb_relatos_id_relato INT NOT NULL,
    CONSTRAINT fk_imagem_relato FOREIGN KEY (fk_tb_relatos_id_relato)
        REFERENCES tb_relatos (id_relato) ON DELETE CASCADE
);

-- =====================================================================
--  DADOS INICIAIS
-- =====================================================================

INSERT INTO tb_nivel_users (id_nivel_user, descritivo) VALUES
    (1, 'Administrador'),
    (2, 'Técnico'),
    (3, 'Solicitante');

INSERT INTO tb_categorias (descritivo) VALUES
    ('Hardware'), ('Software'), ('Rede'), ('Elétrica'), ('Mobiliário'), ('Outros');

-- Administrador para o primeiro acesso
--   login: admin@argos.com
--   senha: admin123
--   hash  = SHA2(CONCAT(senha, login), 256)
--   no PHP: hash('sha256', $senha . strtolower($email))
INSERT INTO tb_users (nome, email, senha, fk_tb_cursos_id_curso, fk_tb_nivel_users_id_nivel_user)
VALUES ('Administrador', 'admin@argos.com',
        SHA2(CONCAT('admin123', 'admin@argos.com'), 256),
        NULL, 1);
        
