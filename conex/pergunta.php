<?php
require_once 'conex.php';

$conexao = Conexao::conectar();
$id = $_GET["id"] ?? null;

$sql = "SELECT municipio_idmunicipios, idperguntas, pergunta, respostacerta, respostaerrada1, respostaerrada2, respostaerrada3 FROM perguntas INNER JOIN professor ON perguntas.professor_idprofessor = professor.idprofessor WHERE municipio_idmunicipios = $id AND professor.ativo = 1 ORDER BY idperguntas";
$result = $conexao->query($sql);

$data = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = array(
            'idmunicipio' => $row["municipio_idmunicipios"],
            'idpergunta' => $row["idperguntas"],
            'pergunta' => $row["pergunta"],
            'respostacerta' => $row["respostacerta"],
            'respostaerrada1' => $row["respostaerrada1"],
            'respostaerrada2' => $row["respostaerrada2"],
            'respostaerrada3' => $row["respostaerrada3"],
        );
    }
} else {
    $data = array();
}

header('Content-Type: application/json');
echo json_encode($data);
?>
