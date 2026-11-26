DELIMITER //
DROP PROCEDURE IF EXISTS proc_relatos_relator //

CREATE PROCEDURE proc_relatos_relator (IN STATUS VARCHAR(255), DATA DATETIME, ordem VARCHAR(4))
BEGIN
	IF (STATUS IS NULL) THEN
		SELECT 'Mensagem de erro.' AS msg;
	END IF;
	
	SELECT r.id_relato, r.data, r.descricao, ri.status, img.caminho, e.descritivo, e.identificacao, c.descritivo, l.descritivo
	FROM tb_relatos r INNER JOIN tb_relatos_interacoes ri ON (r.fk_id_relato_interacao = ri.id_relato_interacao)
	INNER JOIN tb_imagens img ON (r.fk_id_imagem = img.id_imagem)
	INNER JOIN tb_equipamentos e ON (r.fk_id_equipamento = e.id_equipamento)
	INNER JOIN tb_categorias c ON (r.fk_id_categoria = c.id_categoria)
	INNER JOIN tb_laboratorios l ON (e.fk_id_laboratorio = l.id_laboratorio);
END
//
DELIMITER ;

CALL proc_relatos_relator(NULL);