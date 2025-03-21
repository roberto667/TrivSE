<?php
require_once 'conex.php';

$conexao = Conexao::conectar();
$class = $_POST["class"] ?? null;

if($class == "addquest"){
    $idmunicipio =  $_POST["idmunicipio"];
$pergunta =  $_POST["pergunta"];
$respostacerta =  $_POST["repCerta"];
$respostaerrada1 =  $_POST["repErrada1"];
$respostaerrada2 =  $_POST["repErrada2"];
$respostaerrada3 =  $_POST["repErrada3"];
$idprofessor = $_POST["idprofessor"];


$sql = "insert into perguntas(professor_idprofessor, municipio_idmunicipios , pergunta, respostacerta, respostaerrada1, respostaerrada2, respostaerrada3)
values('$idprofessor', '$idmunicipio', '$pergunta', '$respostacerta', '$respostaerrada1', '$respostaerrada2', '$respostaerrada3')";
$result = $conexao->query($sql);
}



if($class == "addprof"){
// Obtenha os dados do formulário
$cpf = $_POST["cpf"];
$senha = $_POST["senha"];
$nomeprofessor = $_POST["nomeprofessor"];

// Construa a consulta SQL para inserir os dados na tabela `professor`
$sql = "INSERT INTO professor ( cpf, senha, nomeprofessor, perfil, ativo) 
        VALUES ('$cpf', '$senha', '$nomeprofessor', 1, 1)";

// Execute a consulta SQL
$result = $conexao->query($sql);

// Verifique se a consulta foi executada com sucesso
if ($result) {
    echo "Registro inserido com sucesso!";
} else {
    echo "Erro ao inserir o registro: " . $conexao->error;
}
}


?>