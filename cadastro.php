<?php
    require_once("cabecalho-rodape.php")
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Argos</title>
    <link rel="stylesheet" href="styles/geral_temporario_style.css">
</head>
<body>
    <?php cabecalho(2) ?>
    <form method="post" action="cadastra_usuario.php">
        <p>Usuário: <input type="text" name="txt_nome"></p>
        <p>Email: <input type="email" name="txt_email"></p>
        <p>Senha: <input type="password" name="pas_senha"></p>
        <p>Seleceione um curso:</p>
        <p><input type="radio" name="rad_curso" id="?">blabla</p> <!-- puxa os cursos do banco -->
        <p>Selecione o semestre:</p>
        <p><input type="radio" name="rad_semestre" id="?">crecre</p> <!-- puxa os semestres do banco -->
        <p><input type="submit" value="Registrar"></p>
    </form>
    <p>Já possui conta? <a href="login.php">Clique aqui</a></p>
    <?php rodape() ?>
</body>
</html>