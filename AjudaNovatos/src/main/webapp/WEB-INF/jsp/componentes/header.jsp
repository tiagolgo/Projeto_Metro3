<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/AjudaNovatos/css/metro.css" rel="stylesheet">
<link href="/AjudaNovatos/css/metro-icons.css" rel="stylesheet">
<script src="/AjudaNovatos/js/jquery.min.js"></script>
<script src="/AjudaNovatos/js/metro.js"></script>
<script src="/AjudaNovatos/js/select2.min.js"></script>
<style type="text/css">
    .container{width: 90%;}
</style>
<div id="menu-topo">
    <div class="app-bar" data-role="app-bar">
        <a href="<c:url value="${t['url.home']}"/>" class="app-bar-element branding text-shadow text-bold bg-darkBlue" style="font-size: 1.2rem;"> AJUDA NOVATOS</a>
        <span class="app-bar-divider"></span>
        <div class="app-bar-pullbutton automatic"></div>
        <ul class="app-bar-menu">
            <li>
                <a class="dropdown-toggle " href="" style="font-size: 20px"> ${t["menu.projetos"]}</a>
                <ul class="d-menu" data-role="dropdown">
                    <li>
                        <a href="" class="dropdown-toggle">${t["menu.sub.linguagem"]}</a>
                        <ul class="d-menu" data-role="dropdown">
                            <c:forEach items="${informacoesProjetos.linguagens}" var="linguagem">
                                <c:if test="${!linguagem.contains('Other')}">  
                                    <li>
                                        <a href='<c:url value='${t["url.projeto.linguagem"]}?q=${linguagem}'/>' >
                                            <c:out value="${linguagem}"/>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="divider"></li>
                    <li><a href='<c:url value="${t['url.projeto.todos']}"/>'>${t["menu.sub.todos"]}</a></li>
                </ul>
            </li>
        </ul>
        <ul class="app-bar-menu" data-flexdirection="reverse">
            <li>
                <div class="input-control text">
                    <form action="<c:url value='${t["url.nome.projeto"]}'/>" method="get">
                        <select id="select" style="min-width: 300px;" name="projeto">
                            <option value="">-</option>
                            <c:forEach var="nome" items="${informacoesProjetos.nomes}">
                                <option>${nome}</option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
            </li>
        </ul>
        <span class="app-bar-divider"></span>
        <ul class="app-bar-menu bg-red">
            <li id="btn_novoProjeto"><span style="font-size: 1.2rem;" class="text-shadow text-bold metro-title">${t["btn.novo.projeto"]}</span></li>
        </ul>
        <span class="app-bar-divider"></span>
        <c:choose>
            <c:when test="${userLogado.logado==false}">
                <div class="app-bar-element place-right">
                    <div class="dropdown-toggle" >
                        <a class=" fg-white" href=""><span class="mif-enter"> </span> Enter</a>
                    </div>
                    <div class="app-bar-drop-container bg-white fg-dark place-right" data-role="dropdown" data-no-close="true" id="form-top" style="width: 350px">
                        <div class="padding10 form-login-container">
                            <c:import url="../componentes/formLogin.jsp"/>
                            <span class="opcao" hidden>menu</span>
                        </div>
                    </div>
                </div>
                <ul class="app-bar-menu place-right"  >
                    <li><a  href='<c:url value="${t['url.form.usuario']}"/>'> <span class="text-shadow text-light metro-title">${t["btn.cadastrar"]}</span></a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <!-- Se estiver logado -->
                <div class="app-bar-element place-right">
                    <div class="dropdown-toggle">
                        <a  href="" style="font-size: 20px" class="fg-white"><span class="mif-user"></span> <c:out value='${userLogado.nome}'/></a>
                    </div>
                    <ul class="d-menu" data-role="dropdown" style="width: 100%">
                        <li><a href="<c:url value="${t['url.perfil.usuario']}"/>" >Meus Dados</a></li>
                        <li><a href="<c:url value="${t['url.projetos.usuario']}"/>" >Meus Projetos</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/logout"/>" ><span class="mif-exit"></span> Logout</a></li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- dialog para login -->
<div data-role="dialog" class="padding20 form-login-container" data-width="500px" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" id="dialog_form_login" style="display: none">
    <c:import url="../componentes/formLogin.jsp"/>
    <span class="opcao" hidden>dialog</span>
</div>
    
<!-- dialog de comentario -->
<div data-role="dialog" class="padding20" data-width="500px" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" id="dialog2" style="display: none;">
    <c:import url="../componentes/comentario.jsp"/>
</div>
<!-- dialog de para buscar dados no openhub -->
<!--
<div id="dialog_buscar_open_hub" data-role="dialog" class="padding20" data-width="500px" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="display: none;">
    <label class="text-bold">Nome do Projeto</label>
    <p>Se você possui um projeto cadastrado no <a href="https://www.openhub.net/" target="_blank">BlackDyck|OpenHub</a> nós podemos encontrar algumas informações importantes sobre o seu projeto.</p>

    <form id="formNomeProjeto" action="c:url value="/buscarDadosProjeto"/>" method="get" >
        <div class="input-control text full-size" data-role="input">
            <input id="nome" name="nome" type="text"/>
            <button class="button helper-button clear"><span class="mif-cross"></span></button>
        </div>
        <input type="button" value="Buscar" id="submitFormNomeProjeto" class="success"/>
        <input type="button" value="Não possuo Projeto no OpenHub." id="nao_possue_projeto" class="warning"/>
    </form>
    <div data-role="preloader" data-type="metro" data-style="dark" hidden="true" id="preload"></div>
</div>
-->
<form method="get" action="<c:url value="${t['url.novo.projeto']}"/>" id="formulario1"></form>
<form method="get" action="<c:url value="${t['url.home']}"/>" id="formulario2"></form>
<form method="get" action="<c:url value="/carregarDados"/>" id="form_carregarBuscarDados"></form>

<script>
    $(function () {
        $("#nao_possue_projeto").on("click", function () {
            $("#formulario1").submit();
        });

        $("#select").select2();

        $("#select").on("change", function () {
            var projeto = $(this).val();
            if (projeto !== "") {
                $(this).closest("form").submit();
                console.log("change " + projeto);
            }
        });

        $(".cancel-autenticacao").on("click", function () {
            var dialog = $("#dialog1").data('dialog');
            dialog.close();
            $("#form-top").toggle();
        });

        $("#btn_novoProjeto").on("click", function () {
            $.ajax({
                type: "get",
                url: "/AjudaNovatos/isLogado"
            }).done(function (data) {
                if (data.logado) {
                    $("#form_carregarBuscarDados").submit();
                    //showDialog("#dialog_buscar_open_hub");
                } else {
                    $(".msg-erros").empty();
                    showDialog("#dialog_form_login");
                }
            });
        });

    });

    function showDialog(id) {
        var dialog = $(id).data('dialog');
        dialog.open();
    }
</script>
