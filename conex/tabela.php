<?php
require_once 'conex.php';

$conexao = Conexao::conectar();

$sql = "SELECT nomejogador, pontuacao FROM jogador ORDER BY pontuacao DESC";
$result = $conexao->query($sql);

$data = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = array(
            'nomejogador' => $row["nomejogador"],
            'pontuacao' => $row["pontuacao"]
        );
    }
} else {
    $data = array();
}

header('Content-Type: application/json');
echo json_encode($data);
?>
