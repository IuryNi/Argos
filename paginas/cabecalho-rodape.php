<head>
  <link rel="stylesheet" href="../styles/cabecalho_rodape_style.css">
</head>
<body>
  <?php
    if(session_status() != 2){
      session_start();
    }

    function cabecalho(int $tipo){
      if(isset($_SESSION['nome'])){
        $nome = $_SESSION['nome'];
        $nomes = explode(' ',$nome);
        $primeiro_nome = ucfirst($nomes[0]);
    }
      echo 
      "<header class='cabecalho'>
      <div>
        <h1>Argos</h1>";
        if($tipo == 1){
          echo
          "<a href='login.php'><img src='../imagens/perfil_nulo.png' heigth=50px width=50px></a><br>".
          $primeiro_nome;
        }
      echo
      "</div>
      </header>";
    }
    function rodape(){
      echo "
      <footer class='rodape'>
          <p>&copy; 2026 Argos. Todos os direitos reservados.</p>
      </footer>";
    }
  ?>
</body>