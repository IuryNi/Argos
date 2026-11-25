<?php
    require_once("cabecalho-rodape.php")
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Argos</title>
    <style>
        body {
        display: grid;
        place-items: center;
        }
    </style>
</head>
<body>
    <?php cabecalho(2) ?>
    <form method="post" action="valida_login.php">
        <p>Email: <input type="email" name="txt_email"></p>
        <p>Senha: <input type="password" name="pas_senha"></p>
        <p><input type="submit" value="Entrar"></p>
    </form>
    <p>Não possui conta? <a href="cadastro.php">Clique aqui</a></p>
    <?php rodape() ?>
</body>
</html>