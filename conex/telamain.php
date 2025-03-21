<?php
require_once 'conex.php';

$conexao = Conexao::conectar();
$idpergunta = array();
$idmunicipio = array();
$pergunta = array();
$respostacerta = array();
$respostaerrada1 = array();
$respostaerrada2 = array();
$respostaerrada3 = array();
$respostaerrada4 = array();
$idprofessor = $_POST["idprofessor"];
$muni = $_POST["muni"];

$ativo = $_POST["ativo"];
$perfil = $_POST["perfil"];
if($perfil == 1){
    
$sql = "SELECT perguntas.idperguntas, municipios.nomemunicipio, perguntas.pergunta, perguntas.respostacerta, perguntas.respostaerrada1, perguntas.respostaerrada2, perguntas.respostaerrada3 FROM perguntas INNER JOIN municipios ON perguntas.municipio_idmunicipios = municipios.idmunicipios INNER JOIN professor ON perguntas.professor_idprofessor = professor.idprofessor WHERE perguntas.professor_idprofessor = $idprofessor AND professor.ativo = 1 and municipio_idmunicipios = $muni ORDER BY municipios.nomemunicipio, perguntas.idperguntas;
";
}else{
    
$sql = "SELECT perguntas.idperguntas, municipios.nomemunicipio, perguntas.pergunta, perguntas.respostacerta, perguntas.respostaerrada1, perguntas.respostaerrada2, perguntas.respostaerrada3 FROM perguntas INNER JOIN municipios ON perguntas.municipio_idmunicipios = municipios.idmunicipios INNER JOIN professor ON perguntas.professor_idprofessor = professor.idprofessor WHERE professor.ativo = 1 and municipio_idmunicipios = $muni  ORDER BY  municipios.nomemunicipio, perguntas.idperguntas;
";
}

$result = $conexao->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo"<div class='questoes' id='questoes'>
       <button class='excluir' id='".$row['idperguntas']."' onclick='excluir()'>❌</button>
       <h2>Pergunta: ".$row['pergunta']."</h2>
            <div id='container'>

      
      <div id='resposta'>
      <p>".$row['respostacerta']."✅</p>
      <p>".$row['respostaerrada1']."❌</p>
      <p>".$row['respostaerrada2']."❌</p>
      <p>".$row['respostaerrada3']."❌</p>
      </div></div>
      <button class='alterar' id='".$row['idperguntas']."'>Alterar</button>
      </div>";
    }
} else {
}

?>