
<?php
require_once '../conex/conex.php';


$conexao = Conexao::conectar();
$idpergunta = array();
$idmunicipio = array();
$pergunta = array();
$respostacerta = array();
$respostaerrada1 = array();
$respostaerrada2 = array();
$respostaerrada3 = array();
$respostaerrada4 = array();


$sql = "SELECT municipio_idmunicipios, idperguntas, pergunta, respostacerta, respostaerrada1, respostaerrada2, respostaerrada3 FROM perguntas";
$result = $conexao->query($sql);

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
    echo "Nenhum resultado encontrado.";
}
echo json_encode($data);
?>