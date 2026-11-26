<?php
    if(session_status() != 2){
      session_start();
    }
    if(isset($_SESSION['nome'])){
        $nome = $_SESSION['nome'];
        $nomes = explode(' ',$nome);
        $primeiro_nome = ucfirst($nomes[0]);
    }
    require_once("cabecalho-rodape.php");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Argos</title>
    <link rel="stylesheet" href="../styles/geral_temporario_style.css">
</head>
<body>
    <?php cabecalho(1) ?>
    
    <h1>Bem Vindo <?php echo $primeiro_nome ?></h1>

    <p><h2>Seus Relatos de problemas:</h2>
    <table border="1">
        <tr>
            <th>Id_Relato</th>
            <th>Data</th>
            <th>Descritivo</th>
            <th>status</th>
        </tr>
        <tr>
            <td>----------------</td>
            <td>25/08/2006</td>
            <td><a href="problema.php?modo=view">Vizualizar</a></td>
        </tr>
    </table>
    </p>

    <a href="problema.php"><button>Relatar Problema</button></a>
    
    <?php rodape() ?>
</body>
</html>