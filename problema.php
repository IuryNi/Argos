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
    <?php cabecalho(2);
        if(isset($_GET['modo'])){
            echo "<h1>Vizualizar</h1>";
        }
    ?>
    
    <p><a href="principal.php"><button>< Voltar</button></a></p>

    <p>
        <form action="valida_problema.php" method="post">
            <p><input type="text" name="txt_titulo" value="Titúlo do problema: (ex: Cadeira quebrada)"></p>

            <p>Selecione a date de Hoje: <br>
                <input type="date" name="date_data" value="Data"></p>

            <p>Selecione o laboratório: <br>
            <select name="sel_ambiente">
                <option value="id_ambiente">lugares</option>
            </select></p>

            <p>Selecione a categoria do iten com problema:<br>
                <input type="radio" name="rad_categoria_iten" id="?">Categorias dos equipamentos do lab
            </p>

            <p>Selecione o equipamento: <br>
            <select name="sel_ambiente">
                <option value="id_ambiente">equipamentos do lab com a categoria</option>
            </select></p>

            <p><input type="text" name="txt_descricao" value="Descreva o problema"></p>

            <p>Selecione uma imagem do Problema: <br>
                <input type="file" name="file_imagem" accept=".png,.jpg"></p>

            <p><input type="submit" value="Registrar problema"></p>
        </form>
    </p>

    <p><?php rodape() ?></p>
</body>
</html>