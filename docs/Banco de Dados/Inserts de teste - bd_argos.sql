-- =====================================================================
--  ARGOS - Dados de teste
--  Rode DEPOIS do bd_argos.sql (ele já cria: níveis 1-3, curso 1 (ADS),
--  categorias 1-6 e o admin id 1).
--  Senha de TODOS os usuários abaixo: 123456
-- =====================================================================
USE bd_argos;

-- ---------------- Cursos ----------------
INSERT INTO tb_cursos (id_curso, descritivo) VALUES
    (2, 'Gestão Empresarial'),
    (3, 'Gestão da Produção Industrial'),
    (4, 'Ciência de Dados'),
    (5, 'Docente');   -- professores e equipe técnica

-- ---------------- Laboratórios ----------------
INSERT INTO tb_laboratorios (id_laboratorio, descritivo) VALUES
    (1, 'Laboratório 1 - Bloco A'),
    (2, 'Laboratório 2 - Bloco A'),
    (3, 'Laboratório 3 - Bloco B'),
    (4, 'Laboratório de Redes - Bloco B'),
    (5, 'Laboratório Maker - Bloco C');

-- ---------------- Equipamentos ----------------
-- ids 16-20: 'Infraestrutura da sala' de cada lab, para problemas que não são de uma máquina
-- (lâmpada, tomada, cadeira...), já que todo relato precisa de um equipamento.
INSERT INTO tb_equipamentos (id_equipamento, descritivo, identificacao, fk_id_laboratorio) VALUES
    (1, 'Computador', 'PC 01', 1),
    (2, 'Computador', 'PC 02', 1),
    (3, 'Computador', 'PC 03', 1),
    (4, 'Projetor', 'PROJ-A1', 1),
    (5, 'Computador', 'PC 01', 2),
    (6, 'Computador', 'PC 02', 2),
    (7, 'Impressora', 'IMP-A2', 2),
    (8, 'Computador', 'PC 01', 3),
    (9, 'Computador', 'PC 02', 3),
    (10, 'Projetor', 'PROJ-B3', 3),
    (11, 'Ar-condicionado', 'AR-B3', 3),
    (12, 'Switch', 'SW-01', 4),
    (13, 'Roteador', 'RT-01', 4),
    (14, 'Computador', 'PC 01', 4),
    (15, 'Rack', 'RACK-01', 4),
    (16, 'Infraestrutura da sala', 'SALA-L1', 1),
    (17, 'Infraestrutura da sala', 'SALA-L2', 2),
    (18, 'Infraestrutura da sala', 'SALA-L3', 3),
    (19, 'Infraestrutura da sala', 'SALA-REDES', 4),
    (20, 'Infraestrutura da sala', 'SALA-MAKER', 5);

-- ---------------- Usuários ----------------
-- níveis: 1=Administrador, 2=Técnico, 3=Solicitante
-- Mariana (id 9) não tem relatos: serve para testar a consulta sem resultados
INSERT INTO tb_users (id_user, nome, email, senha, fk_id_curso, fk_id_nivel_user) VALUES
    (2, 'Carlos Mendes', 'carlos.tecnico@argos.com', 'b5ebf76d2abbcf6f5d88ee6fb72de9a707ee3677c500245aabb8a2ed7554590d', 5, 2),
    (3, 'Fernanda Rocha', 'fernanda.tecnica@argos.com', '48e3dd905766efb96476a76e901d0feb845ddad346aedfa24490e4dea2d83cf3', 5, 2),
    (4, 'Prof. Ricardo Alves', 'ricardo.alves@argos.com', 'efc3d4fab67180e60c1fae33087b38faa32779e76221d78ad2bc923cefd33ea3', 5, 3),
    (5, 'Ana Souza', 'ana.souza@argos.com', 'c98b6a578ce7e0a4e7bdf1f7c4ce7778a86fe4065c53b53ab8849f5cfdfc2adf', 1, 3),
    (6, 'Bruno Lima', 'bruno.lima@argos.com', '235f771178b24a0af356cbd09163c5739e7c0782a868c0c273630fe4e8f09cd0', 1, 3),
    (7, 'Juliana Costa', 'juliana.costa@argos.com', '369a434954d3831eb5e61eebd752f50b566d389ce632b5fd023e505328bdc9bb', 2, 3),
    (8, 'Pedro Santos', 'pedro.santos@argos.com', '2550dfd143fea80daa4ac7991208c68f762b77e7938ea96c9ae9150c0438b921', 4, 3),
    (9, 'Mariana Oliveira', 'mariana.oliveira@argos.com', '3cb1f6c6dc63a4e4c9d3bb6bc36be805d739130b4f7e319325b77d4c207bd0db', 3, 3);

-- ---------------- Imagens ----------------
-- Os arquivos não existem de verdade; os caminhos servem só para testar as consultas.
INSERT INTO tb_imagens (id_imagem, caminho) VALUES
    (1, 'uploads/relato_01.jpg'),
    (2, 'uploads/relato_03.jpg'),
    (3, 'uploads/relato_05.jpg'),
    (4, 'uploads/relato_07.jpg'),
    (5, 'uploads/relato_09.jpg'),
    (6, 'uploads/relato_10.jpg'),
    (7, 'uploads/relato_11.jpg'),
    (8, 'uploads/relato_14.jpg'),
    (9, 'uploads/relato_16.jpg'),
    (10, 'uploads/relato_17.jpg');

-- ---------------- Interações (1 por relato, mesmo id do relato) ----------------
INSERT INTO tb_relatos_interacoes (id_relato_interacao, STATUS, urgencia) VALUES
    (1, 'Resolvido', 'Alta'),
    (2, 'Resolvido', 'Média'),
    (3, 'Cancelado', 'Baixa'),
    (4, 'Resolvido', 'Alta'),
    (5, 'Resolvido', 'Média'),
    (6, 'Resolvido', 'Média'),
    (7, 'Resolvido', 'Alta'),
    (8, 'Resolvido', 'Baixa'),
    (9, 'Resolvido', 'Média'),
    (10, 'Em andamento', 'Alta'),
    (11, 'Aguardando peça', 'Alta'),
    (12, 'Resolvido', 'Média'),
    (13, 'Resolvido', 'Baixa'),
    (14, 'Em andamento', 'Média'),
    (15, 'Aberto', 'Alta'),
    (16, 'Aberto', 'Baixa'),
    (17, 'Aberto', 'Média'),
    (18, 'Em andamento', 'Média'),
    (19, 'Aberto', 'Baixa'),
    (20, 'Aberto', 'Baixa');

-- ---------------- Relatos ----------------
-- Setembro: 3 | Outubro: 5 | Novembro/2026: 12  (bom para testar o relatório mensal)
-- Novembro: 12 relatos, 3 resolvidos; Lab 1 tem mais relatos (4); Hardware é a categoria com mais (5)
-- Relatos sem imagem têm fk_id_imagem = NULL (teste do LEFT JOIN)
INSERT INTO tb_relatos (id_relato, descricao, DATA, fk_id_user, fk_id_imagem, fk_id_relato_interacao, fk_id_equipamento, fk_id_categoria) VALUES
    (1, 'Computador não liga, nenhuma luz acende.', '2026-09-08 08:15:00', 5, 1, 1, 1, 1),
    (2, 'Visual Studio Code não abre, erro de licença.', '2026-09-15 10:40:00', 6, NULL, 2, 5, 2),
    (3, 'Cadeira com encosto quebrado.', '2026-09-22 19:05:00', 7, 2, 3, 18, 5),
    (4, 'Sem acesso à internet em todo o laboratório.', '2026-10-02 09:30:00', 4, NULL, 4, 12, 3),
    (5, 'Projetor com imagem amarelada.', '2026-10-09 14:20:00', 4, 3, 5, 4, 1),
    (6, 'XAMPP não inicia o MySQL.', '2026-10-16 20:10:00', 5, NULL, 6, 6, 2),
    (7, 'Tomada da bancada soltando faísca.', '2026-10-23 08:50:00', 8, 4, 7, 18, 4),
    (8, 'Teclado com teclas falhando.', '2026-10-30 15:00:00', 6, NULL, 8, 2, 1),
    (9, 'Monitor piscando constantemente.', '2026-11-03 08:10:00', 5, 5, 9, 3, 1),
    (10, 'Ar-condicionado pingando água no chão.', '2026-11-05 19:30:00', 7, 6, 10, 11, 4),
    (11, 'Switch reiniciando sozinho, rede cai a cada 10 minutos.', '2026-11-07 10:00:00', 4, 7, 11, 12, 3),
    (12, 'Python não está instalado nas máquinas.', '2026-11-10 13:45:00', 8, NULL, 12, 5, 2),
    (13, 'Mouse não funciona.', '2026-11-12 20:15:00', 6, NULL, 13, 1, 1),
    (14, 'Projetor não reconhece o cabo HDMI.', '2026-11-14 09:20:00', 4, 8, 14, 10, 1),
    (15, 'Roteador com luz vermelha piscando.', '2026-11-17 18:40:00', 5, NULL, 15, 13, 3),
    (16, 'Bancada com pé solto, balançando.', '2026-11-18 08:05:00', 7, 9, 16, 20, 5),
    (17, 'Impressora não puxa o papel.', '2026-11-19 14:30:00', 8, 10, 17, 7, 1),
    (18, 'Antivírus bloqueando o MySQL Workbench.', '2026-11-21 19:50:00', 5, NULL, 18, 2, 2),
    (19, 'Computador muito lento, demora 10 min para ligar.', '2026-11-24 10:15:00', 6, NULL, 19, 9, 1),
    (20, 'Lâmpada queimada no fundo da sala.', '2026-11-25 21:00:00', 4, NULL, 20, 16, 4);