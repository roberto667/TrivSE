var path = [];
path [0]= 0;
let quant = 10;
var sergipe = document.getElementById("sergipe");
let numberselect = [];
var abrir = true;
var main = document.getElementById("main");
var colors = ['#fc6565'/**vermelho */, '#fca265'/**laranja */, '#fcde65'/**amarelo */, '#defc65'/**verde */, '#a2fc65'/**verde-forte */, '#65fc65'/**verde-muito-forte */, '#65fca2'/**verde-aqua */, '#65fcde'/**azul-claro */, '#65defc'/**azul*/, '#65a2fc'/**azul-forte */, '#6565fc'/**roxo-forte */, '#a265fc'/**roxo */, '#de65fc'/**rosa */, '#fc65de'/**rosa-claro */, '#fc65a2'/**rosa-sangue */]
const generatedNumbers = [];

$(document).ready(function () {
    
    var pathid = document.querySelectorAll('.allPaths');
    
    pathid.forEach(function(elemento) {
        path.push(elemento.id);
    });
    for (let i = 0; i < quant; i++) {
        var numberAleatori = Math.floor(Math.random() * 75) + 1; 
        // (numberselect[i])
        
        if(!numberselect.find((num) => num === numberAleatori) ){
            // (numberAleatori)
            numberselect[i] = numberAleatori;
            const idalvo = document.getElementById("path"+numberAleatori);
            idalvo.setAttribute("cliclavel", 'true');
            idalvo.style.fill = "#66b6ab";
        }else{
            i--
        }
        
    }
    
    // (path.length);
    var elemnet = document.getElementById("box");
    var width = elemnet.offsetWidth;
    var height = elemnet.offsetHeight;
    sergipe.classList.remove("width", "height");
   

     (width+", "+height)
    if(width> height){
        sergipe.classList.add("width");
        main.classList.add("width")
    }else{
        sergipe.classList.add("height");
        main.classList.add("height")

    }
   
    

});

setInterval(() => {
    var elemnet = document.getElementById("box");
    var width = elemnet.offsetWidth;
    var height = elemnet.offsetHeight;
    sergipe.classList.remove("width", "height");
   

     (width+", "+height)
    if(width> height){
        sergipe.classList.add("width");
    }else{
        sergipe.classList.add("height");

    }
}, 500);

    document.querySelectorAll(".allPaths").forEach(e => {
        
        e.setAttribute('class', `allPaths ${e.id}`);
        
        
        e.addEventListener("mouseover", function () {
            if(e.getAttribute('cliclavel') === 'true'){
            window.onmousemove=function (j) {
                x = j.clientX
                y = j.clientY
            }
            const classes=e.className.baseVal.replace(/ /g, '.')     
            const matches = e.id.match(/\d+/); // Extrai os números da string
            numberValue = matches ? matches[0] : null; // Obtém o primeiro conjunto de números
    
            document.querySelectorAll(`.${classes}`).forEach(country =>{
                const hasBeenClicked = e.getAttribute('data-clicked') === 'true';
                // Verifique se o elemento já foi clicado
            
            })
            // (Nomemunicipio[numberValue])
        }
            
        });
        e.addEventListener("mouseleave", function () {
            if(e.getAttribute('cliclavel') === 'true'){
            const classes=e.className.baseVal.replace(/ /g, '.')
            document.querySelectorAll(`.${classes}`).forEach(country =>{
                const hasBeenClicked = e.getAttribute('data-clicked') === 'true';
                // Verifique se o elemento já foi clicado
            
            })
        }
            
        })

        e.addEventListener("click",function(){
            if(e.getAttribute('cliclavel') === 'true'){
            const hasBeenClicked = e.getAttribute('data-clicked') === 'true';
            // Verifique se o elemento já foi clicado
        if (!hasBeenClicked && abrir) {
            abrir = false;
            openPopupQ();
            
            // Marque o elemento como clicado
            e.setAttribute('data-clicked', 'true');
            e.setAttribute("cliclavel", 'false');
            e.style.fill = colorpicker();
            //#fc7965////e.style.fill = colorpicker(); 
        }
        }
        })

    });

    function colorpicker(){        
          let randomNum;
          do {
            randomNum = Math.floor(Math.random() * 15);
          } while (generatedNumbers.includes(randomNum));
      
          generatedNumbers.push(randomNum);
          return colors[randomNum];
        };