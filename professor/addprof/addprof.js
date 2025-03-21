
var sessionperfil = sessionStorage.getItem("perfil");

$(document).ready(function () {
    if(sessionperfil){

    }else{
      window.location.href = "../professor.html";
  
    }
});
// Função para inserir professor
function insertProfessor() {
    // Obtém os valores dos campos
    var cpf = document.getElementById("cpf").value.trim();
    var senha = document.getElementById("senha").value.trim();
    var nome = document.getElementById("nomeprofessor").value.trim();

    // Verifica se todos os campos estão preenchidos
    if (!cpf || !senha || !nome) {
        Swal.fire({
            icon: "warning",
            title: "Campos incompletos",
            text: "Por favor, preencha todos os campos.",
        });
        return;
    }

    // Cria um novo FormData e adiciona os dados
    var data = new FormData();
    data.append("class", "addprof");
    data.append("cpf", cpf);
    data.append("senha", senha);
    data.append("nomeprofessor", nome);

    // Cria o XMLHttpRequest
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../../conex/add.php", true);


    // Manipula a resposta do servidor
    xhr.onload = function () {
        Swal.close(); // Fecha o alerta de carregamento

        if (xhr.status >= 200 && xhr.status < 300) {
            // Sucesso
            Swal.fire({
                icon: "success",
                title: "Professor adicionado!",
                text: "O professor foi adicionado com sucesso.",
            });
        } else {
            // Erro
            Swal.fire({
                icon: "error",
                title: "Erro",
                text: "Não foi possível adicionar o professor. Tente novamente mais tarde.",
            });
        }
    };

    // Manipula erros de rede
    xhr.onerror = function () {
        Swal.close(); // Fecha o alerta de carregamento
        Swal.fire({
            icon: "error",
            title: "Erro de rede",
            text: "Não foi possível conectar ao servidor. Verifique sua conexão e tente novamente.",
        });
    };

    // Envia os dados
    xhr.send(data);
    document.getElementById("cpf").value= "";
    document.getElementById("senha").value= "";
    document.getElementById("nomeprofessor").value = "";
}
document.getElementById("cpf").addEventListener("input", function (e) {
    let cpf = e.target.value.replace(/\D/g, ""); // Remove tudo que não é dígito
    cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2"); // Adiciona ponto após os primeiros 3 dígitos
    cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2"); // Adiciona ponto após os segundos 3 dígitos
    cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2"); // Adiciona traço antes dos últimos 2 dígitos
    e.target.value = cpf;
});