<?php
    session_start();
    require_once("cabecalho-rodape.php");
    require_once("../conecta.php");

    $dadoslab = mysqli_query($con, "SELECT id_laboratorio, descritivo FROM tb_laboratorios;");
    $labs = mysqli_fetch_all($dadoslab,2);

    $dadoscat = mysqli_query($con, "SELECT id_categoria, descritivo FROM tb_categorias;");
    $cats = mysqli_fetch_all($dadoscat,2);

    $id_lab = isset($_GET['sel_ambiente']) ? (int) $_GET['sel_ambiente'] : 0;

    if ($id_lab > 0) {
        $stmt = mysqli_prepare($con, "SELECT id_equipamento, identificacao FROM tb_equipamentos WHERE fk_id_laboratorio = ?");
        mysqli_stmt_bind_param($stmt, "i", $id_lab);
        mysqli_stmt_execute($stmt);
        $dadosdisp = mysqli_stmt_get_result($stmt);
        $dispositivos = mysqli_fetch_all($dadosdisp,2);
    } else {
        $dadosdisp = false;
    }
    print_r($_SESSION);
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
    <?php cabecalho(2);
    
        if(isset($_GET['modo'])){
            echo "<h1>Vizualizar</h1>";
        }
    ?>

    <?php 
        if(isset($_FILES)){
            print_r($_FILES);
        }
    ?>
    
    <p><a href="principal.php"><button>< Voltar</button></a></p>

    <p>
        <form action="problema.php" method="get">
            <p>Selecione o laboratório: <br>
            <select name="sel_ambiente">
            <?php 
                foreach ($labs as $lab) {
                    echo "<option value=$lab[0]>$lab[1]</option>";
                }
            ?>
            </select>
            <input type="submit" value="pesquisar">
            </p>
        </form>

        <form action="../validacoes/valida_problema.php" method="post" enctype="multipart/form-data">

            <p>Selecione a categoria do problema:<br>
            <?php 
                foreach ($cats as $cat) {
                    echo "<input type='radio' name='rad_categoria' value='$cat[0]'>$cat[1]";
                }
            ?>
            </p>

            <p>Selecione o equipamento: <br>
            <select name="sel_ambiente">
            <?php 
                foreach ($dispositivos as $dispositivo) {
                    echo "<option value='$dispositivo[0]'>$dispositivo[1]</option>";
                }
            ?>

            </select></p>

            <p><input type="text" name="txt_descricao" value="Descreva o problema"></p>

            <p>Selecione uma imagem do Problema: <br>
                <input type="file" name="file_imagem"></p>
            
            <input type="hidden" name="id_usuario" value='<?php echo $_SESSION['id_user']; ?>'>
            <input type="hidden" name="id_laboratorio" value='<?php echo $_GET['sel_ambiente']; ?>'>
            
            <p><input type="submit" value="Registrar problema"></p>
        </form>
    </p>

    <p><?php rodape() ?></p>
</body>
</html>