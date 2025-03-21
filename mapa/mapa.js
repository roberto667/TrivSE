let popupQuestion = document.getElementById("popupQuestion");
let popupScore = document.getElementById("popupScore");
let popupSContent = document.getElementById("popupSContent");
let map = document.getElementById("myMap");
let popupAswer = document.getElementById("popupaswer");
var main = document.getElementById("main");

const insertpointsbtn = document.getElementById("insertpoints");
var sergipe = document.getElementById("sergipe");
// Obtém todos os botões de rádio com o nome "opcao"
var radios = document.getElementsByClassName("pergunta");
var sergipe = document.getElementById("sergipe");


var check = false;
var time = 300000;
var numberValue = 0;
var muni;
var tabela = false;
var muniselec;
var score = 0;
var acertos = 0;
var finaltime = 0;
var minutes = 0;
var respcert;
var seconds = 0;
var end = false;
var resposta = [];
var opselect = [];
var opcao = [];
var perguntas = [];
var resp = false;
var cliclavel;
var cont2 = 0;
var Nomemunicipio = [];

document
  .getElementById("mostrarOpcaoBtn")
  .addEventListener("click", mostrarValorRadio);

var x = setInterval(function () {
  if (end == false) {
    time = time - 1000;
  }
  

  minutes = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));
  seconds = Math.floor((time % (1000 * 60)) / 1000);

  if (end == false) {
    document.getElementById("timer").innerHTML = minutes + "m " + seconds + "s";
  }

  if (time <= 0) {
    clearInterval(x);
    time = 0;
    if (end == false) {
      document.getElementById("timer").innerHTML = "0m " + "0s";
      openPopupS();
    }
  }
}, 1000);

document.getElementById("acertos").innerHTML = acertos;

function scores() {
  score = acertos * time;
  if (score > 0) {
    return score;
  } else {
    return acertos*1;
  }
}

function scorebtn() {
  insertScore();

  document.getElementById('popupPContent').classList.add('popupPContentshow');
  $.ajax({
    url: "../conex/tabela.php", 
    type: "GET",
    dataType: "json",
    success: function (resposta) {
      if (resposta.length > 0) {
        var tablepoints = $("#tablepoint");
  
        tablepoints.empty();
  
        resposta.forEach(function(item, index) {
          var novalinha = $("<tr>" +
                            "<td>" + item.nomejogador + "</td>" +
                            "<td>" + item.pontuacao + "</td>" +
                            "</tr>");
          tablepoints.append(novalinha);
          setTimeout(function() {
            novalinha.css("opacity", "1");
            novalinha.css("transform", "scaleY(1)");
          }, index * 1000); // Atraso de 200ms entre cada linha
        });
      } else {
        alert("Nenhum jogador encontrado.");
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log("Erro na solicitação AJAX: " + textStatus + ", " + errorThrown);
      alert("Ocorreu um erro ao tentar carregar os dados.");
    }
  });
  Swal.fire({
    icon: "success",
    showConfirmButton: false,
    text: "Pontuação inserida",
    timer: 2500,
  });
  insertpointsbtn.setAttribute("disabled", "");
}


function restart() {
  window.location.reload();
  document.getElementById("nome").value = "";
}

function openPopupQ() {
  $.ajax({
    url: "../conex/pergunta.php",
    type: "GET",
    dataType: "json",
    data: { id: numberValue },
    success: function (resposta) {
      muni = resposta;
      for (var i = 0; i < muni.length; i++) {
        perguntas[i] = muni[i];
      }

      var perguntaselect = perguntas.length;
      var perguntarandom = Math.floor(Math.random() * perguntaselect);

      muniselec = numberValue;
      popupQuestion.classList.add("open-popup");
      map.classList.add("Mymap");

      sergipe.classList.add("click");
      main.classList.add("click");
      

      document.getElementById("pergunta").innerHTML =
        perguntas[perguntarandom].pergunta;

      resposta[1] = perguntas[perguntarandom].respostacerta;
      respcert = resposta[1];
      resposta[2] = perguntas[perguntarandom].respostaerrada1;
      resposta[3] = perguntas[perguntarandom].respostaerrada2;
      resposta[4] = perguntas[perguntarandom].respostaerrada3;

      for (let i = 1; i < 5; i++) {
        var op = Math.floor(Math.random() * 4) + 1;
        if (!opselect.find((num) => num === op)) {
          opselect[i] = op;
          document.getElementById("opcao" + i).innerHTML =
            opcao[i] + resposta[op];
          document.getElementById("pergunta" + i).value = resposta[op];
        } else {
          i--;
        }
      }
    },

    error: function (jqXHR, textStatus, errorThrown) {
    },
  });
}

function closePopupQ() {
  abrir = true;
  mostrarValorRadio();
  if (check == true) {
    popupQuestion.classList.remove("open-popup");
    map.classList.remove("Mymap");
    sergipe.classList.remove("click")
    
    main.classList.remove("click");


    sergipe.style.textAlign = "center";

    if (resp == true) {
      acertos++;
      const municolo = document.getElementById("path" + muniselec);
      municolo.style.fill = "#65fca2";
      document.getElementById("acertos").innerHTML = acertos;
      Swal.fire({
        title: "Acertou!",
        icon: "success",
        timer: 2500,
        showConfirmButton: false,
      });
    } else {
      const municolo = document.getElementById("path" + muniselec);
      municolo.style.fill = "#fc6565";
      Swal.fire({
        icon: "error",
        showConfirmButton: false,
        title: "Errou!",
        text: "Resposta certa: " + respcert,
        timer: 3500,
      });
    }
    opselect.fill(0);
    cont2 = cont2 + 1;
    //alert(cont2)
    if (cont2 == quant || acertos == quant) {
      openPopupS();
    }
    const radioButtons = document.querySelectorAll('input[type="radio"]');
    radioButtons.forEach((radio) => {
      radio.checked = false;
      radio.parentElement.classList.remove("checked");
    });
  } else {
    Swal.fire({
      title: "Não marcou nenhuma alternativa!",
      icon: "question",
      showConfirmButton: false,
    });
  }
}

function openPopupS() {
  document.getElementById("score").innerHTML = scores();
  end = true;
  popupScore.classList.add("open-popupS");
  popupSContent.classList.add("open-popupSC");
}

function closePopupS() {
  popupScore.classList.remove("open-popupS");
  popupSContent.classList.remove("open-popupSC");
}

function openPopupA() {
  popupAswer.classList.add("open-popup");
}
function hint(){
  const hintMessage = document.getElementById('hintMessage'); 
  hintMessage.classList.toggle('visible');
  end = true
}

function hintback(){
  const hintMessage = document.getElementById('hintMessage'); 
  hintMessage.classList.remove('visible');
  end = false
}

$(document).ready(function () {
  
  opcao[1] = document.getElementById("opcao1").innerHTML;
  opcao[2] = document.getElementById("opcao2").innerHTML;
  opcao[3] = document.getElementById("opcao3").innerHTML;
  opcao[4] = document.getElementById("opcao4").innerHTML;

  muni; // Declare a variável muni fora do escopo da função AJAX
  $.ajax({
    url: "../conex/muni.php",
    type: "GET",
    dataType: "json",
    success: function (resposta) {
      // Aqui, resposta é um array de nomes de municípios
      muni = resposta;
      // Faça o que você precisa fazer com esses dados
    },
    error: function (jqXHR, textStatus, errorThrown) {
    },
  });
  

});

function mostrarValorRadio() {
  // Itera sobre os botões de rádio para encontrar o selecionado
  for (var i = 0; i < radios.length; i++) {
    if (radios[i].checked) {
      check = true;
      if (radios[i].value == respcert) {
        resp = true;
        return resp;
      } else {
        return (resp = false);
      }
    } else {
      check = false;
    }
  }

  // Se nenhum botão estiver selecionado
}

function date() {
  let yourDate = new Date();
  const offset = yourDate.getTimezoneOffset();
  yourDate = new Date(yourDate.getTime() - offset * 60 * 1000);
  return yourDate.toISOString().split("T")[0];
}

function Time() {
  var t = new Date();
  var r = t.toLocaleTimeString();
  return r;
}

function insertScore() {
  const data = new FormData();
  data.append("name", document.getElementById("nome").value);
  data.append("score", document.getElementById("score").innerHTML);
  data.append("date", date());
  data.append("time", Time());

  axios
    .post("../conex/score.php", data)
    .then((response) => {
    })
    .catch((error) => {
      console.error("Erro na solicitação AJAX: ", error);
      if (error.response) {
        console.error("Dados da resposta: ", error.response.data);
        console.error("Status: ", error.response.status);
        console.error("Cabeçalhos: ", error.response.headers);
      }
    });
}



const items = document.querySelectorAll('.carousel-item');
let currentIndex = 0;

function showItem(index) {
    items.forEach((item, i) => {
        item.classList.remove('active');
        if (i === index) {
            item.classList.add('active');
        }
    });
}

document.querySelector('.next').addEventListener('click', () => {
    currentIndex = (currentIndex + 1) % items.length;
    showItem(currentIndex);
});

document.querySelector('.prev').addEventListener('click', () => {
    currentIndex = (currentIndex - 1 + items.length) % items.length;
    showItem(currentIndex);
});

// Inicializa o carrossel mostrando o primeiro item
showItem(currentIndex);
