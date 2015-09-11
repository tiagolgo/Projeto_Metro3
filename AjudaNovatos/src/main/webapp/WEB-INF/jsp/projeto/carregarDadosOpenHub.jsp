<%-- 
    Document   : carregarDadosOpenHub
    Created on : 13/07/2015, 14:20:30
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Projeto no OpenHub</title>
    </head>
    <body>
        <c:import url="../componentes/header.jsp" />
        <div id="preload" data-role="preloader" data-type="metro" class="bg-dark" hidden="true"></div>
        <div class="container" style="padding-top: 50px;padding-left: 300px;padding-right: 300px;padding-top: 100px">

            <c:if test="${not empty err}">
                <div class="fg-red" style="border: red">
                    ${err}
                </div>
            </c:if>

            <h1>Carregar dados do OpenHub</h1>
            <p>Se você possui um projeto cadastrado no <a href="https://www.openhub.net/" target="_blank">BlackDyck|OpenHub</a> nós podemos encontrar algumas informações importantes sobre o seu projeto.</p>
            <form id="formNomeProjeto" action="<c:url value="/buscarDadosProjeto"/>" method="get" >
                <div class="input-control text full-size" data-role="input">
                    <input id="nome" name="nome" type="text"/>
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>
                <input type="button" value="Buscar" id="submitFormNomeProjeto" class="success"/>
                <input type="button" value="Não possuo Projeto no OpenHub" id="nao_possue_projeto" class="warning"/>
            </form>
        </div>
        <script>
            $(function () {
                $("#submitFormNomeProjeto").on("click", function () {
                    console.log("carregando...");
                    var form = $(this).closest("form");
                    var nome = form.find("#nome").val();
                    if (nome !== "") {
                        $.ajax({
                            type: "get",
                            url: "/AjudaNovatos/ifProjetoExiste.json?nome=" + nome
                        }).done(function (data) {
                            if (data.existe) {
                                alert("Já existe um projeto cadastrado com esse nome.");
                            } else {
                                form.submit();
                            }
                        });
                    } else {
                        alert("Informe o nome do projeto!");
                    }
                });

                $("#formNomeProjeto").on("submit", function () {
                    $("#preload").attr("hidden", false);
                    //showDialog("#modal_carregar");
                });
            });
        </script>
    </body>
</html>
