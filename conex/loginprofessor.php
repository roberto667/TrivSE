<?php
require_once 'conex.php';

$conexao = Conexao::conectar();

// Inicializa variáveis
$senha = $_POST["Senha"] ?? '';
$cpf = $_POST["CPF"] ?? '';
$VERIFY = false;
$data = [];

// Verifica se as variáveis estão definidas e não estão vazias
if (!empty($senha) && !empty($cpf)) {
    // Prepara a consulta para evitar SQL Injection
    $stmt = $conexao->prepare("SELECT idprofessor, ativo, perfil FROM professor WHERE cpf = ? AND senha = ?");
    $stmt->bind_param("ss", $cpf, $senha); // 'ss' indica que ambos os parâmetros são strings

    // Executa a consulta
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data = [
                'idprofessor' => $row['idprofessor'],
                'ativo' => $row['ativo'],
                'perfil' => $row['perfil']
            ];
        }
        $VERIFY = true;
    } else {
        $VERIFY = false;
    }

    $stmt->close();
} else {
    // Caso CPF ou Senha não sejam fornecidos
    $VERIFY = false;
}

// Responde com um JSON contendo a chave "data"
header('Content-Type: application/json'); // Define o tipo de conteúdo da resposta
echo json_encode(['VERIFY' => $VERIFY, 'data' => $data]);

// Fecha a conexão com o banco de dados
$conexao->close();
