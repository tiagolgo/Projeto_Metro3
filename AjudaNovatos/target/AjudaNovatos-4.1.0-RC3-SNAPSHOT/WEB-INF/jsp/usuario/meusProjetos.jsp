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
            <div class="panel" style="margin-top: 50px">
                <div class="heading">
                    <span class="title text-bold">Meus Projetos</span>
                </div>
                <div class="content">        
                    <c:choose>
                        <c:when test="${projetosUser.size()==0}">
                            <p style="font-size: 20px">${t["sem.projeto"]}</p>
                            <p style="margin-top: 50px">
                                <a href='<c:url value="${t['url.novo.projeto']}"/>'>${t["cadastar.projeto"]}</a>
                            </p>
                        </c:when>
                        <c:otherwise>
                            <div class="grid">
                                <c:forEach var="projeto" items="${projetosUser}">
                                    <div class="row border-bottom cells2">
                                        <a href="<c:url value="${t['url.buscar.projeto.id']}?id=${projeto.id}"/>" class="tile">
                                            <div class="tile-content">
                                                <div class="image-container">
                                                    <img src="<c:url value="/images/logo/"/>${projeto.logotipo}"/>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="cell">
                                            <h4>${projeto.nome}</h4>
                                            <p>Criacao: ${projeto.dataCriacao}</p>
                                            <form action="<c:url value="${t['url.remove.projeto']}"/>" method="post">
                                                <input type="hidden" name="projeto.id"  value="${projeto.id}"/>
                                                <input type="hidden" name="_method" value="DELETE"/>
                                                <button class="button  bg-orange"><a class="fg-white" href='<c:url value="${t['url.editar.projeto.id']}?id=${projeto.id}"/>'> Editar</a></button>
                                                <button class="button  bg-red fg-white remove-projeto" type="button">Remover</button>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <script>
                $(function () {
                    $(".remove-projeto").on("click", function () {
                        var c = confirm("Deseja realmente remover o projeto?");
                        if (c) {
                            var form = $(this).closest("form");
                            console.log(form);
                            form.submit();
                        }
                    });
                });
            </script>
        </div>
    </body>
</html>
