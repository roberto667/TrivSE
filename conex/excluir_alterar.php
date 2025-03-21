<?php
require_once 'conex.php';

$conexao = Conexao::conectar();

$id = $_POST["id"] ?? null;
$class = $_POST["class"] ?? null;
$idmunicipio = $_POST["idmunicipio"] ?? null;
$pergunta = $_POST["pergunta"] ?? null;
$respostacerta = $_POST["repCerta"] ?? null;
$respostaerrada1 = $_POST["repErrada1"] ?? null;
$respostaerrada2 = $_POST["repErrada2"] ?? null;
$respostaerrada3 = $_POST["repErrada3"] ?? null;
$nome = $_POST["nome"] ?? null;
$cpf = $_POST["cpf"] ?? null;
$senha = $_POST["senha"] ?? null;
$ativo = $_POST["ativo"] ?? null;



if (!empty($id) && !empty($class)) {
    if ($class == "1-1") {
        // Prepare statement to prevent SQL injection
        $stmt = $conexao->prepare("DELETE FROM perguntas WHERE idperguntas = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $stmt->close();
    } elseif ($class == "1-2.ini") {
        $stmt = $conexao->prepare("
            SELECT perguntas.idperguntas, municipios.nomemunicipio, perguntas.pergunta, perguntas.respostacerta, perguntas.respostaerrada1, perguntas.respostaerrada2, perguntas.respostaerrada3
            FROM perguntas
            INNER JOIN municipios ON perguntas.municipio_idmunicipios = municipios.idmunicipios
            INNER JOIN professor ON perguntas.professor_idprofessor = professor.idprofessor
            WHERE perguntas.idperguntas = ?
            ORDER BY municipios.nomemunicipio, perguntas.idperguntas
        ");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<form>
                    <label for='municipios'>Município:</label><br>
                    <select name='municipios' id='municipios' readonly>
                        <option value='" . $id . "'>" . $row['nomemunicipio'] . "</option>
                    </select> <br>
                    <label for='pergunta'>Pergunta:</label><br>
                    <input type='text' id='pergunta' name='pergunta' value='" . htmlspecialchars($row['pergunta'], ENT_QUOTES) . "' > <br>
                    <label for='repCerta'>Resposta Certa:</label><br>
                    <input type='text' id='repCerta' name='repCerta' value='" . htmlspecialchars($row['respostacerta'], ENT_QUOTES) . "' ><br>
                    <label for='repErrada1'>Resposta Errada 1:</label><br>
                    <input type='text' id='repErrada1' name='repErrada1' value='" . htmlspecialchars($row['respostaerrada1'], ENT_QUOTES) . "' ><br>
                    <label for='repErrada2'>Resposta Errada 2:</label><br>
                    <input type='text' id='repErrada2' name='repErrada2' value='" . htmlspecialchars($row['respostaerrada2'], ENT_QUOTES) . "' ><br>
                    <label for='repErrada3'>Resposta Errada 3:</label><br>
                    <input type='text' id='repErrada3' name='repErrada3' value='" . htmlspecialchars($row['respostaerrada3'], ENT_QUOTES) . "' ><br>
                </form>
                <button class='btn' onclick='insertPergunta()'>Alterar Pergunta</button>
                <a href='../../telamain/telamain.html'>
                    <button class='btn'>Voltar</button>
                </a>";
            }
        } else {
            echo "Nenhuma pergunta encontrada.";
        }
        $stmt->close();
    } elseif ($class === "1-2") {
        $stmt = $conexao->prepare("
            UPDATE perguntas
            SET pergunta = ?, respostacerta = ?, respostaerrada1 = ?, respostaerrada2 = ?, respostaerrada3 = ?
            WHERE idperguntas = ?
        ");
        $stmt->bind_param("sssssi", $pergunta, $respostacerta, $respostaerrada1, $respostaerrada2, $respostaerrada3, $id);
        $stmt->execute();
        $stmt->close();
    } elseif ($class == "2-2.ini") {
        $stmt = $conexao->prepare("
            SELECT `idprofessor`, `cpf`, `senha`, `nomeprofessor`, `perfil`, `ativo` FROM `professor` WHERE  idprofessor = ? ORDER BY  nomeprofessor, idprofessor
        ");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "
    <label for='nomeprofessor'>Nome:</label><br>
        <input tupe='text' id='nomeprofessor' name='nomeprofessor' value='".$row["nomeprofessor"]."'><br>
        <label for='cpf'>CPF:</label><br>
        <input tupe='text' name='cpf' id='cpf' maxlength='14' placeholder='000.000.000-00' value='".$row["cpf"]."'><br>
        <label for='senha'>Senha:</label><br>
        <input type='password' name='senha' id='senha' placeholder='senha' value='".$row["senha"]."'><br>
        <label for='ativo'>Ativo:</label><br>
        <select name='ativo' id='ativo'>
                        <option value=-1> </option>
                        <option value=1> Ativo</option>
                        <option value=0> Inativo</option>
                    </select> <br>
        
      <button class='btn' id='btn' onclick='insertProfessor()'>Alterar Professor</button>      
      <a href='../../view/prof/view.html'>
        <button class='btn'>Voltar</button>
      </a>";
            }
        } else {
            echo "Nenhuma pergunta encontrada.";
        }
        $stmt->close();
    } else if ($class == "2-2") {
       
         // Atualiza as informações do professor
         $stmt = $conexao->prepare("
         UPDATE professor
         SET cpf = ?, senha = ?, nomeprofessor = ?, ativo = ?
         WHERE idprofessor = ?
     ");

     $stmt->bind_param("ssssi", $cpf, $senha, $nome, $ativo, $id);
     $stmt->execute();
     $stmt->close();
     echo json_encode(value: ['success' => 'Professor alterado com sucesso!']);
    }else {
        echo "Classe inválida.";
    }
} else {
    echo "ID ou classe inválidos.";
}

$conexao->close();

?>