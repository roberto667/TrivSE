<?php

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

require_once 'conex.php';

    // Conectando ao banco de dados
    $conexao = Conexao::conectar();

    // Obtendo dados do POST
    $nomejogador = $_POST["name"];
    $pontuacao = $_POST["score"];
    $date = $_POST["date"] ;
    $hora = $_POST["time"] ;

    
    $stmt = $conexao->prepare("INSERT INTO jogador (nomejogador, pontuacao, date, hora) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("siss", $nomejogador, $pontuacao, $date, $hora);
    
    // Executando a consulta
    if ($stmt->execute()) {
        echo "Dados inseridos com sucesso!";
    } else {
        echo "Erro ao inserir dados: " . $stmt->error;
    }
    
    $stmt->close();
    $conexao->close();
?>
