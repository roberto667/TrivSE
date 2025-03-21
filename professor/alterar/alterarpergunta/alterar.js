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
        class: "1-2.ini",
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
  });
  
  function insertPergunta() {
    // Obtém os valores dos campos e verifica se estão preenchidos
    const pergunta = document.getElementById("pergunta").value.trim();
    const repCerta = document.getElementById("repCerta").value.trim();
    const repErrada1 = document.getElementById("repErrada1").value.trim();
    const repErrada2 = document.getElementById("repErrada2").value.trim();
    const repErrada3 = document.getElementById("repErrada3").value.trim();
    const idmunicipio = document.getElementById("municipios").value.trim();

    // Verifica se todos os campos estão preenchidos
    if (!pergunta || !repCerta || !repErrada1 || !repErrada2 || !repErrada3 || !idmunicipio) {
        Swal.fire({
            icon: "warning",
            title: "Campos incompletos",
            text: "Por favor, preencha todos os campos.",
        });
        return;
    }

    // Cria um novo FormData e adiciona os dados
    const data = new FormData();
    data.append("class", "1-2");
    data.append("id", idpergunta); // Certifique-se de que idpergunta está definido
    data.append("pergunta", pergunta);
    data.append("repCerta", repCerta);
    data.append("repErrada1", repErrada1);
    data.append("repErrada2", repErrada2);
    data.append("repErrada3", repErrada3);
    data.append("idmunicipio", idmunicipio);

    // Cria o XMLHttpRequest
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "../../../conex/excluir_alterar.php", true);

    // Mostra um alerta de carregamento
    Swal.fire({
        title: 'Enviando...',
        text: 'Sua pergunta está sendo adicionada.',
        allowOutsideClick: false,
        onBeforeOpen: () => {
            Swal.showLoading();
        }
    });

    // Manipula a resposta do servidor
    xhr.onload = function() {
        Swal.close(); // Fecha o alerta de carregamento

        if (xhr.status >= 200 && xhr.status < 300) {
            // Sucesso
            Swal.fire({
                icon: "success",
                title: "Pergunta alterada!",
                text: "A pergunta foi alterada com sucesso.",
            }).then(() => {
                // Opcional: redirecionar ou atualizar a página
                window.location.href =  "../../telamain/telamain.html";

                // window.location.reload();
            });
        } else {
            // Erro
            Swal.fire({
                icon: "error",
                title: "Erro",
                text: "Não foi possível alterar a pergunta. Tente novamente mais tarde.",
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
