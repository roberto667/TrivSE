 // Função para ser chamada ao clicar no botão
 function mostrarValorRadio() {
    // Obtém todos os botões de rádio com o nome "opcao"
    var radios = document.getElementsByName('pergunta');

    // Itera sobre os botões de rádio para encontrar o selecionado
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            alert('Valor selecionado: ' + radios[i].value);
            return;
        }
    }

    // Se nenhum botão estiver selecionado
    alert('Nenhuma opção selecionada');
}

// Adiciona um ouvinte de evento ao botão
document.getElementById('mostrarOpcaoBtn').addEventListener('click', mostrarValorRadio);
