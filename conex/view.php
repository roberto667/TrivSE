<?php
require_once 'conex.php';

$conexao = Conexao::conectar();
$class = $_POST["class"] ?? null;
if($class == "quest"){

  $idpergunta = array();
  $idmunicipio = array();
  $pergunta = array();
  $respostacerta = array();
  $respostaerrada1 = array();
  $respostaerrada2 = array();
  $respostaerrada3 = array();
  $respostaerrada4 = array();
  $idprofessor = $_POST["idprofessor"];
  $ativo = $_POST["ativo"];
  $perfil = $_POST["perfil"];
  $muni = $_POST["muni"];

  
      
  if($perfil == 1){
    $sql = "SELECT perguntas.idperguntas, municipios.nomemunicipio, perguntas.pergunta, perguntas.respostacerta, perguntas.respostaerrada1, perguntas.respostaerrada2, perguntas.respostaerrada3 FROM perguntas INNER JOIN municipios ON perguntas.municipio_idmunicipios = municipios.idmunicipios INNER JOIN professor ON perguntas.professor_idprofessor = professor.idprofessor WHERE professor.ativo = 1 and municipio_idmunicipios = $muni  ORDER BY  municipios.nomemunicipio, perguntas.idperguntas;
  ";
  }else if($perfil == 0){
    $sql = "SELECT perguntas.idperguntas, municipios.nomemunicipio, perguntas.pergunta, perguntas.respostacerta, perguntas.respostaerrada1, perguntas.respostaerrada2, perguntas.respostaerrada3, professor.cpf FROM perguntas INNER JOIN municipios ON perguntas.municipio_idmunicipios = municipios.idmunicipios INNER JOIN professor ON perguntas.professor_idprofessor = professor.idprofessor WHERE professor.ativo = 1 and municipio_idmunicipios = $muni  ORDER BY  municipios.nomemunicipio, perguntas.idperguntas;
  ";
  }
  
  
  $result = $conexao->query($sql);
  
  if ($result->num_rows > 0) {
    if($perfil == 0){
      while ($row = $result->fetch_assoc()) {

          echo"<div class='questoes' id='questoes'>
         <h2>Pergunta: ".$row['pergunta']."</h2>
             <div id='container'>

      <h3>Pergunta: ".$row['pergunta']."</h3>
      <div id='resposta'>
      <p>".$row['respostacerta']."✅</p>
      <p>".$row['respostaerrada1']."❌</p>
      <p>".$row['respostaerrada2']."❌</p>
      <p>".$row['respostaerrada3']."❌</p>
      </div>
      
      </div>
      <p id = 'cpftodo'>".$row['cpf']."</p>
        </div>";
      }
    }else{
      while ($row = $result->fetch_assoc()) {

        echo"<div class='questoes' id='questoes'>
       <h2>Pergunta: ".$row['pergunta']."</h2>
           <div id='container'>

    <h3>Pergunta: ".$row['pergunta']."</h3>
    <div id='resposta'>
    <p>".$row['respostacerta']."✅</p>
    <p>".$row['respostaerrada1']."❌</p>
    <p>".$row['respostaerrada2']."❌</p>
    <p>".$row['respostaerrada3']."❌</p>
    </div>
    
    </div>
      </div>";
    }
    }
  } else {
  }
}else if ($class == "prof"){
  
$sql = "SELECT `idprofessor`, `cpf`, `senha`, `nomeprofessor`, `perfil`, `ativo` FROM `professor` ORDER BY  nomeprofessor, idprofessor;
";

$result = $conexao->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      $ativo = "Não";
      if($row['ativo'] == 1){
        $ativo = "Sim";
      }

        echo"<div class='questoes' id='questoes'>
      <h2>Nome professor: ".$row['nomeprofessor']." </h2>
            <div id='containerprof'>

      <h3>CPF: ".$row['cpf']."</h3>
      <div id='resposta'>
      <p> Ativo: ".$ativo."</p>
      
      </div></div>
      <button class='alterar' id='".$row['idprofessor']."'>Alterar</button>
      </div>";
    }
} else {
}
}

?>