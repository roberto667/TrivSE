<?php
require_once 'conex.php';

$conexao = Conexao::conectar();

$sql = "SELECT idmunicipios, nomemunicipio FROM municipios";
$result = $conexao->query($sql);

$data = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = array(
            'idmunicipio' => $row["idmunicipios"],
            'nomemunicipio' => $row["nomemunicipio"]
        );
    }
} else {
    $data = array();
}

header('Content-Type: application/json');
echo json_encode($data);
?>
