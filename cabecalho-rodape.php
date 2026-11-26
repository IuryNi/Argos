<head>
  <link rel="stylesheet" href="styles/cabecalho_rodape_style.css">
</head>
<body>
  <?php
    function cabecalho(int $tipo){
      echo 
      "<header class='cabecalho'>
      <div>
        <h1>Argos</h1>";
        if($tipo == 1){
          echo
          "<a href='login.php'><img src='imagens/perfil_nulo.png' heigth=50px width=50px></a><br>
          usuario";
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
</html>