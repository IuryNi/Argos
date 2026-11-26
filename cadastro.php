<?php
    require_once("cabecalho-rodape.php");
    require_once("conecta.php");
    $dados = mysqli_query($con, "SELECT * FROM `tb_cursos`");
    $cursos = mysqli_fetch_all($dados,2);
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
    <form method="post" action="valida_cadastro.php">
        <p>Nome Completo: <input type="text" name="txt_nome"></p>
        <p>Email: <input type="email" name="txt_email"></p>
        <p>Senha: <input type="password" name="pas_senha"></p>
        <p>Seleceione um curso:</p>
        <p><?php
            foreach ($cursos as $curso) {
                echo "<p><input type='radio' name='curso' id='$curso[0]' value='$curso[0]'>$curso[1]</p>";
            }
        ?></p>
        <p><input type="submit" value="Registrar"></p>
    </form>
    <?php
        if(isset($_GET['email']) and $_GET['email'] == "repetido"){
        echo "email ja cadastrado!";
        }
    ?>
    <p>Já possui conta? <a href="login.php">Clique aqui</a></p>
    <?php rodape() ?>
</body>
</html>