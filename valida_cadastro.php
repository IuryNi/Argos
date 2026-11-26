<?php
    require_once("conecta.php");

    $nome  = $_POST['txt_nome'];
    $email = $_POST['txt_email'];
    $curso = $_POST['curso'];
    $nivel = 3;

    $hash = hash('sha256', $_POST['pas_senha'] . $_POST['txt_email']);

    $stmt = mysqli_prepare($con, "INSERT INTO `tb_users` (`nome`, `email`, `senha`, `fk_tb_cursos_id_curso`, `fk_tb_nivel_users_id_nivel_user`) VALUES (?, ?, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt, "sssii", $nome, $email, $hash, $curso, $nivel);

    try {
        mysqli_stmt_execute($stmt);
        
        header("Location: principal.php");
        exit();

    } catch (mysqli_sql_exception $e) {
        header("location: cadastro.php?email=repetido");
    }
?>