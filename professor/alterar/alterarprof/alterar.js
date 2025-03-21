var idpergunta = localStorage.getItem("perguntaId")
var sessionperfil = sessionStorage.getItem("perfil");


$(document).ready(function () {
  if(sessionperfil){

  }else{
    window.location.href = "../../professor.html";

  }
  var tbody = document.getElementById("div");

  
    // Enviar o valor da sessão para o script PHP usando AJAX
    $.ajax({
      url: "../../../conex/excluir_alterar.php",
      method: "POST",
      data: {
        class: "2-2.ini",
        id: idpergunta
      },
      success: function (response) {
        // Lidar com a resposta do servidor
        tbody.innerHTML = response

      },
      error: function (xhr, status, error) {
        // Lidar com erros, se houver
        console.error("Erro na solicitação AJAX:", status, error);
      }
    });
    tbody.addEventListener("input", function (e) {
      if (e.target.id.includes("cpf")) {
        let cpf = e.target.value.replace(/\D/g, ""); // Remove tudo que não é dígito
  cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2"); // Adiciona ponto após os primeiros 3 dígitos
  cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2"); // Adiciona ponto após os segundos 3 dígitos
  cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2"); // Adiciona traço antes dos últimos 2 dígitos
  e.target.value = cpf;
      }
      
    });
    
    
  });
  function insertProfessor() {
    // Obtém os valores dos campos e verifica se estão preenchidos
    const nome = document.getElementById("nomeprofessor").value.trim();
    const cpf = document.getElementById("cpf").value.trim();
    const senha = document.getElementById("senha").value.trim();
    const ativo = document.getElementById("ativo").value.trim();

    // Verifica se todos os campos estão preenchidos
    if (!nome || !cpf || !senha || !ativo || !idpergunta) {
        Swal.fire({
            icon: "warning",
            title: "Campos incompletos",
            text: "Por favor, preencha todos os campos.",
        });
        return;
    }

    // Cria um novo FormData e adiciona os dados
    const data = new FormData();
    data.append("class", "2-2");
    data.append("id", idpergunta); // Certifique-se de que idpergunta está definido
    data.append("nome", nome);
    data.append("cpf", cpf);
    data.append("senha", senha);
    data.append("ativo", ativo);

    // Cria o XMLHttpRequest
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "../../../conex/excluir_alterar.php", true);

    // Manipula a resposta do servidor
    xhr.onload = function() {
        Swal.close(); // Fecha o alerta de carregamento

        if (xhr.status >= 200 && xhr.status < 300) {
            const response = JSON.parse(xhr.responseText);
            if (response.success) {
                Swal.fire({
                    icon: "success",
                    title: "Professor alterado!",
                    text: response.success,
                }).then(() => {
                    // Opcional: redirecionar ou atualizar a página
                    window.location.href =  "../../view/prof/view.html";

                    // window.location.reload();
                });
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Erro",
                    text: response.error || "Não foi possível alterar o professor. Tente novamente mais tarde.",
                });
            }
        } else {
            Swal.fire({
                icon: "error",
                title: "Erro",
                text: "Não foi possível alterar o professor. Tente novamente mais tarde.",
            });
        }
    };

    // Manipula erros de rede
    xhr.onerror = function() {
        Swal.close(); // Fecha o alerta de carregamento
        Swal.fire({
            icon: "error",
            title: "Erro de rede",
            text: "Não foi possível conectar ao servidor. Verifique sua conexão e tente novamente.",
        });
    };

    // Envia os dados
    xhr.send(data);

}


