
// VALIDAÇÕES
//$(function () {
//$("#dados-form").on("submit", function (event) {
//dados do formulario                          
/* var nome = $("#dados-nome").val();
 var site = $("#dados-site").val();
 var licenca = $("#dados-licenca").val();
 var fonte = $("#dados-codigoFonte").val();
 var bug = $("#dados-gestorBug").val();
 var descricao = $("#dados-descricao").val();
 var msg = "";
 if (nome == "") {
 msg += "- Informe o Nome do Projeto."
 }
 if (site == "") {
 msg += "- Informe o Site do Projeto."
 }
 if (descricao == "") {
 msg += "- Insira uma Descrição do Projeto."
 }
 if (msg != "") {
 event.preventDefault();
 alert(msg);
 } else {
 $(this).submit();
 }*/
// });
//});

// INSERIR FEED
$(function () {
    $(".feeds-insert").on("click", function () {
        var linhas = document.getElementById("feeds-tabela").rows.length;
        var container = $(this).closest(".feeds-container");
        var titulo = $(container).find(".feed-title").val();
        var url = $(container).find(".feed-url").val();
        if (titulo === "" && url === "") {
            alert("Titulo e Url devem ser informados!");
        } else {
            $(".table-feeds tbody").append(
                    "<tr><td><input type='hidden' name='projeto.comoIniciar.tarefaFacil.feeds[" + linhas + "].titulo' value='" + titulo + "'/>" + titulo + "</td>" +
                    "<td><input type='hidden' name='projeto.comoIniciar.tarefaFacil.feeds[" + linhas + "].url' value='" + url + "'/>" + url + "</td>" +
                    "<td><button class='button link fg-red' onclick='removeObjetos(this, \"/AjudaNovatos/removeFeed\");'>Excluir</button></td></tr> "
                    );
        }
    });
});

// OPTION SE POSSUI IRC OU NÃO
// Exibe/esconnde opções de inserção das informações sobre o IRC do projeto 
function escondeElemento(elemento, mostrar) {
    mostrar ? $(elemento).slideDown() : $(elemento).slideUp();
}

// OPTION TIPO DE REPOSITÓRIO
// habilita/desabilita input para iserção/edição do link para o repositório
$(function () {
    $("#repos").on("change", function () {
        var aux = $(this).val();
        aux !== "-" ? $("#dados-codigoFonte").attr("disabled", false) : $("#dados-codigoFonte").attr("disabled", true);
    });
});

// ADICIONA PLATAFORMA AO PROJETO
$(function () {
    $("#add_plataforma").on("click", function () {
        var linhas = document.getElementById("tab_plataforma").rows.length;
        var plat = $("#plat").val();
        $("#tab_plataforma").append("<tr><td><input type='hidden' name='projeto.plataformas[" + linhas + "].texto' value='" + plat + "'/>" + plat + "</td><td><button class='button small-button link fg-red' onclick='removeObjetos(this, \"/AjudaNovatos/removePlataforma\");'>Remover</button></td></tr>");
    });
});

function removeObjetos(id, obj, url) {
    var linha = $(obj).closest("tr");
    if (id === 0) {
        $(linha).remove();
    } else {
        $.ajax({
            type: 'GET',
            url: url,
            data: "id=" + id
        }).done(function () {
            $(linha).remove();
        }).fail(function (data) {
            alert("Objeto não removido: " + data);
        });
    }
    return false;
}

// BUSCA NO GOOGLE
$(".google-search").on("submit", function (event) {
    event.preventDefault();
    var dominio = $(this).find("#url").val();
    var site = $(this).find("#url").val();
    var texto = $(this).find(".text-busca").val();
    if (texto.length > 0) {
        console.log("texto "+texto+"; url "+site);
        window.open("https://www.google.com.br/?gws_rd=ssl#q=" + texto + "&domains=" + dominio + "&sitesearch=" + site);
    }
});

