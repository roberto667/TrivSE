var session = sessionStorage.getItem("idprofessor");
  var sessionativo = sessionStorage.getItem("ativo");
  var sessionperfil = sessionStorage.getItem("perfil");
  var menuitem = document.querySelectorAll(".item-menu");
  var valueselected  = 0;
  var tbody;
$(document).ready(function () {
  session = sessionStorage.getItem("idprofessor");
  sessionativo = sessionStorage.getItem("ativo");
  sessionperfil = sessionStorage.getItem("perfil");
  menuitem = document.querySelectorAll(".item-menu");
  var btnex = document.getElementsByClassName("menu-btn");
  var add = document.querySelector("#add");
  const ulElement = document.getElementById("ul");
  const global = document.querySelector("#view");
  tbody = document.getElementById("questoes");
  var logout = document.querySelector("#logout");
  var muni = document.getElementById("municipios");
  muni.selectedIndex = 0; 
  valueselected = muni.value; // Move a declaração aqui


  muni.addEventListener("change", () => {
    valueselected = muni.value; // Atualiza a variável ao mudar o município
     (valueselected);
       // Enviar o valor da sessão para o script PHP usando AJAX
  $.ajax({
    url: "../../conex/telamain.php",
    method: "POST",
    data: {
      idprofessor: session,
      ativo: sessionativo,
      perfil: sessionperfil,
      class: "quest",
      muni: valueselected

    },
    success: function (response) {
      tbody.innerHTML = response;
    },
    error: function (xhr, status, error) {
      console.error("Erro na solicitação AJAX:", status, error);
    }
  });

  // Delegação de evento para botões excluir
  tbody.addEventListener("click", function (event) {

   if (event.target.classList.contains("alterar")) {
      const perguntaId = event.target.getAttribute('id'); // Supondo que o ID da pergunta é necessário
      localStorage.setItem('perguntaId', perguntaId); // Armazena o ID no localStorage
      localStorage.setItem('alterar', "1-2")
      window.location.href = "../alterar/alterarpergunta/alterar.html"; // Redireciona para alterar.html
    }
  });
  });

  if(sessionperfil){

  }else{
    window.location.href = "../professor.html";

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
    "../addprof/addprof.html"
  );
  const viewprof = createMenuItem(
    "viewprof",
    "bi bi-person-video",
    "Ver professores",
    "../view/prof/view.html"
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
    window.location.href = "../addPergunta/addpergunta.html";
  });

 


  global.addEventListener("click", () => {
    window.location.href = "../view/quest/view.html"; // Defina o URL apropriado se necessário
  });
  logout.addEventListener("click", () =>{
    
    sessionStorage.clear();
    localStorage.clear();
    location.reload();
    window.location.href = "../professor.html";
  })
  // Corrigido `geItem` para `getItem`
  

 
});
function toggleMenu() {
  const sidebar = document.getElementById('sidebar');
  sidebar.classList.toggle('collapsed');
}
function excluir(){
  const perguntaId = event.target.getAttribute('id');
  
  // Chama o SweetAlert de confirmação
  if(perguntaId){
     (session);
    Swal.fire({
      title: 'Você tem certeza?',
      text: "Esta ação não pode ser desfeita!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sim, excluir!',
      cancelButtonText: 'Não, cancelar!'
    }).then((result) => {
      if (result.isConfirmed) {
        // Se o usuário confirmar, prossegue com a exclusão
        fetch("../../conex/excluir_alterar.php", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: new URLSearchParams({
            id: perguntaId,
            class: "1-1"
          })
        })
        .then(response => response.text())
        .then(text => {
          Swal.fire({
            icon: "success",
            title: "Pergunta excluída!",
          });
          // Atualizar a lista de perguntas ou o conteúdo do tbody
          $.ajax({
            url: "../../conex/telamain.php",
            method: "POST",
            data: {
              idprofessor: session,
              ativo: sessionativo,
              class: "quest",
              perfil: sessionperfil,
              muni: valueselected
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
            text: error.message // Mostra o erro que foi capturado
          });
        });
      } else {
        // Se o usuário cancelar
        Swal.fire({
          title: 'Cancelado',
          text: 'A pergunta não foi excluída.',
          icon: 'info'
        });
      }
    });
  }
}