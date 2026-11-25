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
    <?php cabecalho(1) ?>
    <h1>Bem Vindo fulano</h1>

    <p><h2>Suas chamadas em aberto</h2>
    <table border="1">
        <tr>
            <th>Titúlo</th>
            <th>Data</th>
        </tr>
        <tr>
            <td>----------------</td>
            <td>25/08/2006</td>
            <td><a href="problema.php?modo=view">Vizualizar</a></td>
        </tr>
    </table>
    </p>

    <p><h2>Suas chamadas concluidas</h2>
    <table border="1">
        <tr>
            <th>Titúlo</th>
            <th>Data</th>
        </tr>
        <tr>
            <td>----------------</td>
            <td>25/08/2006</td>
            <td><a href="problema.php?modo=view">Vizualizar</a></td>
        </tr>
    </table></p>

    <a href="problema.php"><button>Relatar Problema</button></a>
    
    <?php rodape() ?>
</body>
</html>