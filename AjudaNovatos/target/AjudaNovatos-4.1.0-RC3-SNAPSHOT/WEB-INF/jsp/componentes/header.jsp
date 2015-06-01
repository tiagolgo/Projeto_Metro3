<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- CSS -->
        <link href="/AjudaNovatos/css/metro.css" rel="stylesheet">
        <link href="/AjudaNovatos/css/metro-icons.css" rel="stylesheet">

        <script src="/AjudaNovatos/js/jquery.min.js"></script>
        <script src="/AjudaNovatos/js/metro.js"></script>
        <script src="/AjudaNovatos/js/select2.min.js"></script>

        <style type="text/css">
            .container{
                width: 90%;
            }
        </style>
    </head>
    <body>
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
                                    <c:forEach items="${informacoesProjetos.getLinguagens()}" var="linguagem">
                                        <li >
                                            <a href="<c:url value="${t['url.projeto.linguagem']}?q=${linguagem.texto}"/>" >
                                                <c:out value="${linguagem.texto}"/>
                                            </a>
                                        </li>
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
                            <select id="select" style="min-width: 300px;">
                                <option>option</option>
                                <option>guiana</option>
                                <option>option</option>
                                <option>franca</option>
                            </select>
                        </div>
                    </li>
                </ul>

                <span class="app-bar-divider"></span>

                <ul class="app-bar-menu bg-red">
                    <li id="autenticar"><span style="font-size: 1.2rem;" class="text-shadow text-light metro-title">Cadastre seu projeto</span></li>
                </ul>

                <span class="app-bar-divider"></span>

                <c:choose>
                    <c:when test="${userLogado.logado==false}">
                        <div class="app-bar-element place-right">
                            <div class="dropdown-toggle" >
                                <a class=" fg-white" href=""><span class="mif-enter"> </span> Enter</a>
                            </div>
                            <div class="app-bar-drop-container bg-white fg-dark place-right" data-role="dropdown" data-no-close="true" id="form-top" style="width: 350px">
                                <div class="padding10">
                                    <c:import url="../componentes/formLogin.jsp"/>
                                    <span class="opcao" hidden>menu</span>
                                </div>
                            </div>
                        </div>
                        <ul class="app-bar-menu place-right"  >
                            <li><a  href='<c:url value="${t['url.form.usuario']}"/>'> <span class="text-shadow text-light metro-title">Cadastre-se</span></a></li>
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
                                <li><a href="<c:url value="/logout"/>" ><i class="icon-exit"></i> Logout</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- dialog para login -->
        <div data-role="dialog" class="padding20" data-width="500px" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" id="dialog1" style="display: none">
            <c:import url="../componentes/formLogin.jsp"/>
            <span class="opcao" hidden>dialog</span>
        </div>

        <!-- dialog de comentario -->
        <div data-role="dialog" class="padding20" data-width="500px" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" id="dialog2" style="display: none;">
            <c:import url="../componentes/comentario.jsp"/>
        </div>

        <form method="get" action="<c:url value="${t['url.novo.projeto']}"/>" id="formulario1"></form>
        <form method="get" action="<c:url value="${t['url.home']}"/>" id="formulario2"></form>
        
        <script>
            $(function () {
                $("#select").select2();
                $(".cancel-autenticacao").on("click", function () {
                    var dialog = $("#dialog1").data('dialog');
                    dialog.close();
                    $("#form-top").toggle();
                });

                $("#autenticar").on("click", function () {
                    $.ajax({
                        type: "get",
                        url: "/AjudaNovatos/isLogado"
                    }).done(function (data) {
                        if (data.logado) {
                            $("#formulario1").submit();
                        } else {
                            $(".msg-erros").empty();
                            showDialog("#dialog1");
                        }
                    });
                });

                $(".form-autenticacao").on("submit", function (event) {
                    var form = $(this);
                    if (form.find(".a").val() !== "" && form.find(".b").val() !== "") {
                        event.preventDefault();
                        $.ajax({
                            type: "post",
                            url: "/AjudaNovatos/login",
                            data: form.serialize()
                        }).done(function (data) {
                            if (data.list[0]) {
                                $(form).closest("div").find(".opcao").text() === "dialog" ? $("#formulario1").submit() : location.reload();
                            } else {
                                var s = $(form).find(".msg-erros");
                                s.empty();
                                s.show();
                                s.append(data.list[1]);
                            }
                        });
                    }
                });
            });

            function showDialog(id) {
                var dialog = $(id).data('dialog');
                dialog.open();
            }
        </script>

    </body>
</html>