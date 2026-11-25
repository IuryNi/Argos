<head>
  <link rel="stylesheet" href="styles/cabecalho-rodape-style.css">
</head>
<body>
    <?php
    function cabecalho(int $tipo){
      $header = 
      "<header class='cabecalho'>
      <h1>Argos</h1>";
      if ($tipo == 1) {
        $header .= "<a href='indefinido'><div id='perfil'></div></a>";
      }
      $header .= "</header>";
      echo $header;
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