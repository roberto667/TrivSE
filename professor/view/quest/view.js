$(document).ready(function () {
  var session = sessionStorage.getItem("idprofessor");
  var sessionativo = sessionStorage.getItem("ativo");
  var sessionperfil = sessionStorage.getItem("perfil");
  var menuitem = document.querySelectorAll(".item-menu");
  var btnex = document.getElementsByClassName("menu-btn");
  var add = document.querySelector("#add");
  const ulElement = document.getElementById("ul");
  const global = document.querySelector("#view");
  var tbody = document.getElementById("questoes");  
  var logout = document.querySelector("#logout");
  var muni = document.getElementById("municipios");
  muni.selectedIndex = 0; 

  muni.addEventListener("change", () => {
      var valueselected = muni.value;
       (valueselected);
       // Enviar o valor da sessão para o script PHP usando AJAX
  $.ajax({
    url: "../../../conex/view.php",
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

  
  });

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
    "../prof/view.html"
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
  // Corrigido `geItem` para `getItem`
  
  
  
});
function toggleMenu() {
  const sidebar = document.getElementById('sidebar');
  sidebar.classList.toggle('collapsed');
}
