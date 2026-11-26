<?php
    require_once("../conecta.php");

    session_start();
    $nome  = $_POST['txt_nome'];
    $email = $_POST['txt_email'];
    $curso = $_POST['curso'];
    $nivel = 3;

    $hash = hash('sha256', $_POST['pas_senha'] . $_POST['txt_email']);

    $stmt = mysqli_prepare($con, "INSERT INTO `tb_users` (`nome`, `email`, `senha`, `fk_id_curso`, `fk_id_nivel_user`) VALUES (?, ?, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt, "sssii", $nome, $email, $hash, $curso, $nivel);

    try {
        mysqli_stmt_execute($stmt);
        
        $_SESSION['nome'] = $nome;
        header("Location: ../paginas/principal.php");
        exit();

    } catch (mysqli_sql_exception $e) {
        $_SESSION['falha'] = 1;
        header("location: ../paginas/cadastro.php?email=repetido");
    }
?>