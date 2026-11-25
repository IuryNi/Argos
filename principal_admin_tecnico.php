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

    <p><h2>Chamadas em aberto:</h2>
    <table border="1">
        <tr>
            <th>Titúlo</th>
            <th>Data</th>
            <th>Relatado por</th>
        </tr>
        <tr>
            <td>----------------</td>
            <td>25/08/2006</td>
            <td>Fulano</td>
            <td><a href="problema.php?modo=view">Vizualizar</a></td>
            <td><a href="?">Excluir</a></td>
        </tr>
    </table>
    </p>

   <p><h2>Chamadas em aberto:</h2>
    <table border="1">
        <tr>
            <th>Titúlo</th>
            <th>Data</th>
            <th>Relatado por</th>
        </tr>
        <tr>
            <td>----------------</td>
            <td>25/08/2006</td>
            <td>Fulano</td>
            <td><a href="problema.php?modo=view">Vizualizar</a></td>
            <td><a href="?">Excluir</a></td>
        </tr>
    </table>
    </p>

    <div border="2">Dashboard</div>
    
    <?php rodape() ?>
</body>
</html>