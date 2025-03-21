$(document).ready(function () {
  var menuitem = document.querySelectorAll(".item-menu");
  var btnex = document.getElementsByClassName("menu-btn");
  var add = document.querySelector("#add");
  const ulElement = document.getElementById("ul");
  const global = document.querySelector("#view");
  var session = sessionStorage.getItem("idprofessor");
  var sessionativo = sessionStorage.getItem("ativo");
  var sessionperfil = sessionStorage.getItem("perfil");
  var tbody = document.getElementById("questoes");
  var logout = document.querySelector("#logout");

  if(sessionperfil){

  }else{
    window.location.href = "../../professor.html";
  }


  if(sessionStorage.getItem("perfil") == 0){
    // Função para criar um item de menu
  function createMenuItem(id, iconClass, text, link) {
    // Cria o elemento li
    const li = document.createElement("li");
    li.className = "item-menu";
    li.id = id;

    // Cria o elemento a
    const a = document.createElement("a");
    a.href = link;

    // Cria o span com a classe icon
    const spanIcon = document.createElement("span");
    spanIcon.className = "icon";

    // Cria o i com a classe do ícone
    const i = document.createElement("i");
    i.className = iconClass;

    // Adiciona o i dentro do span
    spanIcon.appendChild(i);

    // Cria o span com a classe txt-link e adiciona o texto
    const spanText = document.createElement("span");
    spanText.className = "links-name";
    spanText.textContent = text;

    // Adiciona o spanIcon e o spanText dentro do a
    a.appendChild(spanIcon);
    a.appendChild(spanText);

    // Adiciona o a dentro do li
    li.appendChild(a);

    return li;
  }

  const addprof = createMenuItem(
    "addprof",
    "bi bi-person-add",
    "Adicionar professor",
    "../../addprof/addprof.html"
  );
  const viewprof = createMenuItem(
    "viewprof",
    "bi bi-person-video",
    "Ver professores",
    "#"
  );
  ulElement.appendChild(addprof);
  ulElement.appendChild(viewprof);
  
  }

  function selectLink() {
    menuitem.forEach((item) => item.classList.remove("ativo"));
    this.classList.add("ativo");
  }
  menuitem.forEach((item) => item.addEventListener("click", selectLink));

 
  add.addEventListener("click", () => {
    window.location.href = "../../addPergunta/addpergunta.html";
  });
  
  logout.addEventListener("click", () =>{
    
    sessionStorage.clear();
    localStorage.clear();
    location.reload();

    window.location.href = "../../professor.html";
  })

 // Delegação de evento para botões excluir
 tbody.addEventListener("click", function (event) {
  if (event.target.classList.contains("excluir")) {
    const perguntaId = event.target.getAttribute('id');
    
    fetch("../../../conex/excluir_alterar.php", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: new URLSearchParams({
        id: perguntaId,
        class: "2-1"
      })
    })
    .then(response => response.text())
    .then(text => {
      Swal.fire({
        icon: "sucsses",
        title: "Professor excluida!",
    });
      // Atualizar a lista de perguntas ou o conteúdo do tbody
      $.ajax({
        url: "../../../conex/view.php",
        method: "POST",
        data: {
          idprofessor: sessionStorage.getItem("idprofessor"),
          ativo: sessionStorage.getItem("ativo"),
          perfil: sessionStorage.getItem("perfil"),
          class: "prof"

        },
        success: function (response) {
          tbody.innerHTML = response;
        },
        error: function (xhr, status, error) {
          console.error("Erro na solicitação AJAX:", status, error);
        }
      });
    })
    .catch(error => {
      Swal.fire({
        icon: "error",
        title: "Erro",
    });
    });
  }
  else if (event.target.classList.contains("alterar")) {
    const perguntaId = event.target.getAttribute('id'); // Supondo que o ID da pergunta é necessário
    localStorage.setItem('perguntaId', perguntaId); // Armazena o ID no localStorage
    localStorage.setItem('alterar', "2-2")
    window.location.href = "../../alterar/alterarprof/alterar.html"; // Redireciona para alterar.html
  }
});



  global.addEventListener("click", () => {
    window.location.href = "../quest/view.html"; // Defina o URL apropriado se necessário
  });
  // Corrigido `geItem` para `getItem`
  

  // Enviar o valor da sessão para o script PHP usando AJAX
  $.ajax({
    url: "../../../conex/view.php",
    method: "POST",
    data: {
      idprofessor: session,
      ativo: sessionativo,
      perfil: sessionperfil,
      class: "prof"
    },
    success: function (response) {
      // Lidar com a resposta do servidor
      tbody.innerHTML = response;
    },
    error: function (xhr, status, error) {
      // Lidar com erros, se houver
      console.error("Erro na solicitação AJAX:", status, error);
    }
  });
});

function toggleMenu() {
  const sidebar = document.getElementById('sidebar');
  sidebar.classList.toggle('collapsed');
}
