<?php
    require_once("conecta.php");
    session_start();
    $email = strtolower(trim($_POST['txt_email']));
    $hash  = hash('sha256', $_POST['pas_senha'] . $email);
    
    $stmt = mysqli_prepare($con, "SELECT id_user, nome, senha, fk_tb_nivel_users_id_nivel_user FROM tb_users WHERE email = ?");
    mysqli_stmt_bind_param($stmt, "s", $email);
    mysqli_stmt_execute($stmt);
    $user = mysqli_fetch_all(mysqli_stmt_get_result($stmt));

    print_r($user);
    
    if ($user && hash_equals($user[0][2], $hash)) {
        session_regenerate_id(true);
        $_SESSION['id_user'] = $user[0][0];
        $_SESSION['nome']    = $user[0][1];
        $_SESSION['nivel']   = $user[0][3];
        if ($_SESSION['nivel'] == 1 or $_SESSION['nivel'] == 2){
            header('Location: principal_admin_tecnico.php');
        }else{
            header('Location: principal.php');
        }
    } else {
        header('Location: login.php?falha=1');
    }
?>