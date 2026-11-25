<?php
    print_r($_POST);
    if($_POST['pas_senha'] == "1234"){
        header('location: principal_admin_tecnico.php');
    }else{
        header('location: principal.php');
    }
    
?>