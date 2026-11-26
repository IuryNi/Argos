-- =====================================================================
--  ARGOS - Sistema de chamados de reparo dos laboratórios
--  Script de criação do banco (MySQL / MariaDB) - Modelo v1
-- =====================================================================

DROP DATABASE IF EXISTS argos;
CREATE DATABASE argos CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE argos;

-- ---------------------------------------------------------------------
-- Tabelas sem chave estrangeira (criadas primeiro)
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

CREATE TABLE tb_imagens (
    id_imagem INT AUTO_INCREMENT PRIMARY KEY,
    caminho   VARCHAR(255) NOT NULL          -- ex.: "uploads/6567a1b2c3.jpg"
);

CREATE TABLE tb_relatos_interacoes (
    id_relato_interacao INT AUTO_INCREMENT PRIMARY KEY,
    STATUS   ENUM('Aberto','Em andamento','Aguardando peça','Resolvido','Cancelado')
             NOT NULL DEFAULT 'Aberto',
    urgencia ENUM('Baixa','Média','Alta') NOT NULL DEFAULT 'Média'
);

-- ---------------------------------------------------------------------
-- Usuários
-- ---------------------------------------------------------------------

CREATE TABLE tb_users (
    id_user                          INT AUTO_INCREMENT PRIMARY KEY,
    nome                             VARCHAR(100) NOT NULL,
    email                            VARCHAR(150) NOT NULL UNIQUE,  -- login e salt
    senha                            CHAR(64)     NOT NULL,         -- SHA-256 em hexadecimal
    fk_tb_cursos_id_curso            INT NOT NULL,
    fk_tb_nivel_users_id_nivel_user  INT NOT NULL,
    CONSTRAINT fk_users_curso FOREIGN KEY (fk_tb_cursos_id_curso)
        REFERENCES tb_cursos (id_curso),
    CONSTRAINT fk_users_nivel FOREIGN KEY (fk_tb_nivel_users_id_nivel_user)
        REFERENCES tb_nivel_users (id_nivel_user)
);

-- ---------------------------------------------------------------------
-- Equipamentos (cada equipamento pertence a 1 laboratório)
-- ---------------------------------------------------------------------

CREATE TABLE tb_equipamentos (
    id_equipamento                    INT AUTO_INCREMENT PRIMARY KEY,
    descritivo                        VARCHAR(100) NOT NULL,   -- ex.: "Computador"
    identificacao                     VARCHAR(50)  NOT NULL,   -- ex.: "PC 12" / patrimônio
    fk_tb_laboratorios_id_laboratorio INT NOT NULL,
    CONSTRAINT fk_equip_lab FOREIGN KEY (fk_tb_laboratorios_id_laboratorio)
        REFERENCES tb_laboratorios (id_laboratorio)
);

-- ---------------------------------------------------------------------
-- Relatos (os chamados) - criada por último, pois aponta para quase todas
-- ---------------------------------------------------------------------

CREATE TABLE tb_relatos (
    id_relato                                 INT AUTO_INCREMENT PRIMARY KEY,
    descricao                                 TEXT NOT NULL,
    DATA                                      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fk_tb_users_id_user                       INT NOT NULL,   -- quem abriu o relato
    fk_tb_imagens_id_imagem                   INT NULL,       -- relato pode não ter imagem
    fk_tb_relatos_interacoes_id_relato_interacao INT NULL,
    fk_tb_laboratorios_id_laboratorio         INT NOT NULL,
    fk_tb_categorias_id_categoria             INT NOT NULL,
    CONSTRAINT fk_relato_user FOREIGN KEY (fk_tb_users_id_user)
        REFERENCES tb_users (id_user),
    CONSTRAINT fk_relato_imagem FOREIGN KEY (fk_tb_imagens_id_imagem)
        REFERENCES tb_imagens (id_imagem) ON DELETE SET NULL,
    CONSTRAINT fk_relato_interacao FOREIGN KEY (fk_tb_relatos_interacoes_id_relato_interacao)
        REFERENCES tb_relatos_interacoes (id_relato_interacao) ON DELETE SET NULL,
    CONSTRAINT fk_relato_lab FOREIGN KEY (fk_tb_laboratorios_id_laboratorio)
        REFERENCES tb_laboratorios (id_laboratorio),
    CONSTRAINT fk_relato_categoria FOREIGN KEY (fk_tb_categorias_id_categoria)
        REFERENCES tb_categorias (id_categoria)
);

-- =====================================================================
--  DADOS INICIAIS
-- =====================================================================

INSERT INTO tb_nivel_users (id_nivel_user, descritivo) VALUES
    (1, 'Administrador'),
    (2, 'Técnico'),
    (3, 'Solicitante');

INSERT INTO tb_cursos (id_curso, descritivo) VALUES
    (1, 'Análise e Desenvolvimento de Sistemas');

INSERT INTO tb_categorias (descritivo) VALUES
    ('Hardware'), ('Software'), ('Rede'), ('Elétrica'), ('Mobiliário'), ('Outros');

-- Administrador para o primeiro acesso
--   login: admin@argos.com
--   senha: admin123
--   hash gerado no PHP com: hash('sha256', 'admin123' . 'admin@argos.com')
INSERT INTO tb_users (nome, email, senha, fk_tb_cursos_id_curso, fk_tb_nivel_users_id_nivel_user)
VALUES ('Administrador', 'admin@argos.com',
        '659c4e18859742c4a68553589427c8816f7e4f4c59ff3b37dfd770ac35cd5704',
        1, 1);