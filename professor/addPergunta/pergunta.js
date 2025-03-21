var sessionperfil = sessionStorage.getItem("perfil");

$(document).ready(function () {
    if(sessionperfil){

    }else{
      window.location.href = "../professor.html";
  
    }
  });
function insertPergunta() {
  var session = sessionStorage.getItem("idprofessor");
  var data = new FormData();

  // Cria um novo FormData e adiciona os dados
  var data = new FormData();
  data.append("class", "addquest");
  data.append("idprofessor", session);
  data.append("pergunta", document.getElementById("pergunta").value);
  data.append("repCerta", document.getElementById("repCerta").value);
  data.append("repErrada1", document.getElementById("repErrada1").value);
  data.append("repErrada2", document.getElementById("repErrada2").value);
  data.append("repErrada3", document.getElementById("repErrada3").value);
  data.append("idmunicipio", document.getElementById("municipios").value);

  // Verifica se todos os campos estão preenchidos
  if (
    !data.get("pergunta") ||
    !data.get("repCerta") ||
    !data.get("repErrada1") ||
    !data.get("repErrada2") ||
    !data.get("repErrada3") ||
    !data.get("idmunicipio")
  ) {
    Swal.fire({
      icon: "warning",
      title: "Campos incompletos",
      text: "Por favor, preencha todos os campos.",
    });
    return;
  }

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
        title: "Pergunta inserida!",
        text: "Sua pergunta foi adicionada com sucesso.",
      });
    } else {
      // Erro
      Swal.fire({
        icon: "error",
        title: "Erro",
        text: "Não foi possível adicionar a pergunta. Tente novamente mais tarde.",
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
  document.getElementById("pergunta").value = "";
  document.getElementById("repCerta").value = "";
  document.getElementById("repErrada1").value="";
  document.getElementById("repErrada2").value="";
  document.getElementById("repErrada3").value="";
  document.getElementById("municipios").value="";
}
