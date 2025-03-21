var nome = [];
var cpf = [];
var senha = [];
var resposta = [];
var CPFhtml = document.getElementById("CPF").value;
var Senhahtml = document.getElementById("Senha").value;
document.addEventListener("DOMContentLoaded", function () {
  // Limpar sessionStorage ao carregar o documento
  sessionStorage.clear();
});

// Formatação do CPF
document.getElementById("CPF").addEventListener("input", function (e) {
  let cpf = e.target.value.replace(/\D/g, ""); // Remove tudo que não é dígito
  cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2"); // Adiciona ponto após os primeiros 3 dígitos
  cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2"); // Adiciona ponto após os segundos 3 dígitos
  cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2"); // Adiciona traço antes dos últimos 2 dígitos
  e.target.value = cpf;
});
function voltar(){
  window.location.href =  "../opbuttons/index.html";
}

function login() {
  // Criação do objeto FormData e adição dos dados
  var data = new FormData();
  data.append("CPF", document.getElementById("CPF").value);
  data.append("Senha", document.getElementById("Senha").value);

  // Criação do XMLHttpRequest
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "../conex/loginprofessor.php", true);
  xhr.onload = function () {
    if (xhr.status >= 200 && xhr.status < 300) { // Verifica se a resposta foi bem-sucedida
      try {
        var resposta = JSON.parse(xhr.responseText);

        if (resposta.VERIFY) {
          var dados = resposta.data;
          if (dados.ativo == 1) {
            // Se o login for bem-sucedido, salve os dados na sessionStorage
            sessionStorage.setItem("idprofessor", dados.idprofessor);
            sessionStorage.setItem("ativo", dados.ativo);
            sessionStorage.setItem("perfil", dados.perfil);
            // Redirecionar para a página de adicionar pergunta
            window.location.href = "telamain/telamain.html";
          } else {
            Swal.fire({
              icon: "error",
              showConfirmButton: false,
              title: "Usuário inativo",
              timer: 1500,
            });
          }
        } else {
          Swal.fire({
            icon: "error",
            showConfirmButton: false,
            title: "CPF ou Senha incorretos",
            timer: 1500,
          });
        }
      } catch (e) {
        Swal.fire({
          icon: "error",
          showConfirmButton: false,
          title: "Erro ao processar a resposta do servidor",
          timer: 1500,
        });
      }
    } else {
      Swal.fire({
        icon: "error",
        showConfirmButton: false,
        title: "Erro na conexão com o servidor",
        timer: 1500,
      });
    }
  };

  xhr.onerror = function () {
    Swal.fire({
      icon: "error",
      showConfirmButton: false,
      title: "Erro de rede",
      timer: 1500,
    });
  };

  xhr.send(data);
}
