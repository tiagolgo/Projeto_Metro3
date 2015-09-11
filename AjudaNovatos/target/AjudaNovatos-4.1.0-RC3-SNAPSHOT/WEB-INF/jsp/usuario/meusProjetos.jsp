<%-- 
    Document   : meusProjetos
    Created on : 11/12/2014, 17:36:48
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../erros/404.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp" />
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>
            <div class="row margin50">
                <h1>Meus Projetos</h1>
            </div>
            <div class="row margin50">
                <c:choose>
                    <c:when test="${projetosUser.size()==0}">
                        <div class="fg-green">
                            <h2>${t["sem.projeto"]}</h2>
                            <p style="margin-top: 50px">
                                <a href="#" class="button success autenticar">${t["btn.novo.projeto"]}</a>
                            </p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="grid">
                            <c:forEach var="projeto" items="${projetosUser}">
                                <div class="row border-bottom cells2 set-border">
                                    <a href="<c:url value="${t['url.buscar.projeto.id']}?id=${projeto[0]}"/>" class="tile">
                                        <div class="tile-content">
                                            <div class="image-container">
                                                <!--<img src="c:url value="/images/logo/"/>{projeto.logotipo}"/>-->
                                                <img src="<c:url value="${projeto[2]}"/>"/>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="cell">
                                        <h4>${projeto[1]}</h4>
                                        <p>Criacao: ${projeto[3]}</p>
                                        <form action="<c:url value="${t['url.remove.projeto']}"/>" method="post">
                                            <input type="hidden" name="id"  value="${projeto[0]}"/>
                                            <a class="button  bg-blue" href='<c:url value="${t['url.editar.projeto.id']}?id=${projeto[0]}"/>'><span class="mif-pencil"></span> Editar</a>
                                            <a class="button  bg-red remove-projeto"><span class="mif-bin"></span>Remover</a>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="padding20 dialog" data-role="dialog" id="dialogRemoveProjeto" data-overlay="true" data-overlay-color="op-dark" data-close-button="true" data-windows-style="true">
                <div class="container" style="padding-left: 100px;padding-right: 100px">
                    <h1>Confirma a exclusão do projeto?</h1>
                    <p>
                        O projeto será removido permanentemente.
                    </p>
                    <button class="button warning" id="removerProjetoSim">Sim</button>
                    <button class="button info" id="removerProjetoNao">Não</button>
                </div>
            </div>
            <script>
                $(function () {
                    var form_remover;
                    $(".remove-projeto").on("click", function () {
                        form_remover = $(this).closest("form");
                        showDialog("#dialogRemoveProjeto");
                    });

                    $("#removerProjetoSim").on("click", function () {
                        $(form_remover).submit();
                    });

                    $("#removerProjetoNao").on("click", function () {
                        $(".dialog-close-button").click();
                    });
                });
            </script>
        </div>
    </body>
</html>
