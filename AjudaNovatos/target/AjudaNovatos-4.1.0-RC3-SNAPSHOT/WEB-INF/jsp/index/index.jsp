<%-- 
    Document   : index
    Created on : 01/10/2014, 17:44:58
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page errorPage="../erros/404.jsp" %>


<!DOCTYPE html> 
<html lang="pt">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ajuda Novatos</title>
    </head>
    <body class="metro">
        <!-- menu topo -->
        <c:import url="../componentes/header.jsp"/>
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>
            <div class="row align-center">
                <h1 style="font-size: 4.5rem; line-height: 1" class="text-shadow metro-title">AjudaNovatos</h1>
                <div class="padding20 sub-leader text-light">
                    The front-end framework for developing projects on the web in Windows Metro Style
                </div>
                <h3>${t["index.dash.titulo"]}</h3>
                <p>${t["index.dash.texto"]}</p>
            </div>
            <div class="row">
                <div class="grid" >
                    <div class="row cells3">
                        <!-- PROJETOS ADICIONADOS -->
                        <div class="cell">
                            <div class="panel">
                                <div class="heading"><span class="title">${t["index.list.projetos"]}</span></div>
                                <div class="content bg-white">
                                    <div class="listview">
                                        <c:forEach var="projeto" items="${informacoesProjetos.projetosAntigo}">
                                            <a class="list" href="<c:url value="${t['url.buscar.projeto.id']}?id=${projeto.id}"/>" >
                                                <img src="<c:url value="/images/logo/"/>${projeto.logotipo}" class="list-icon"/>
                                                <span class="list-title full-size text-bold"><c:out value="${projeto.nome}"/></span><br/>
                                                <span class="text-light">sdfsdf</span>
                                            </a>  
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- LINGUAGENS MAIS USADAS -->
                        <div class="cell">
                            <div class="panel">
                                <div class="heading"><span class="title">${t["index.list.linguagens"]}</span></div>
                                <div class="content bg-white">
                                    <div class="listview">
                                        <c:forEach var="linguagem" items="${informacoesProjetos.linguagens}">
                                            <div class="list">
                                                <img src="<c:url value="/images/logo_linguagens/"/>${linguagem.texto}.png" class="list-icon"/>
                                                <span class="list-title text-bold"><c:out value="${linguagem.texto}"/></span><br/>
                                                <span class="text-light">Utilizada em <c:out value="${linguagem.quantidade}"/> projeto(s)</span>
                                            </div>
                                        </c:forEach>
                                    </div>  
                                </div>
                            </div>
                        </div>
                        <!-- PROJETOS RECENTES -->
                        <div class="cell">
                            <div class="panel">
                                <div class="heading"><span class="title">${t["index.list.novidades"]}</span></div>
                                <div class="content bg-white">
                                    <div class="listview">
                                        <c:forEach var="recente" items="${informacoesProjetos.projetosRecente}">
                                            <a class="list" href="<c:url value="${t['url.buscar.projeto.id']}?id=${recente.id}"/>" >
                                                <img src="<c:url value="/images/logo/"/>${recente.logotipo}" class="list-icon"/>
                                                <span class="list-title text-bold"><c:out value="${recente.nome}"/></span><br/>
                                                <span class="text-light">xxcvxc</span>
                                            </a>
                                        </c:forEach>
                                    </div>  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <iframe src="https://github.com/tiagolgo/Projeto-TCC/graphs/commit-activity" style='width: 100%;height: 300px'></iframe>
        </div>         
        <!--
<footer class='border-top' style="left: 0;bottom: 0;position: absolute;width: 100%;height: 110px">
<div class="container">
<div class="grid">
<div class="row cells5">
<div class="cell">
    <div class="tile tile-small-y tile-square-x">
        <div class="tile-content">
            <div class="image-container">
                <img src="c:url value="/images/projeto/ccsl.png"/>" class="cell" width="100%"/>
            </div>
        </div>
    </div>
</div>
<div class="cell">
    <div class="tile tile-small-y">
        <div class="tile-content">
            <div class="image-container">
                <img src="c:url value="/images/projeto/napsol.png"/>" class="cell" width="100%"/>
            </div>
        </div>
    </div>
</div>
<div class="cell">
    <div class="tile tile-small-y">
        <div class="tile-content">
            <div class="image-container">
                <img src="c:url value="/images/projeto/naweb.gif"/>" class="cell" width="100%"/>
            </div>
        </div>
    </div>
</div>
<div class="cell">
    <div class="tile tile-small-y">
        <div class="tile-content">
            <div class="image-container">
                <img src="c:url value="/images/projeto/usp.png"/>" class="cell" width="100%"/>
            </div>
        </div>
    </div>
</div>
<div class="cell">
    <div class="tile tile-small-y">
        <div class="tile-content">
            <div class="image-container">
                <img src="c:url value="/images/projeto/utfpr.png"/>" class="cell" width="100%"/>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</footer>
        -->
        <script>
            $(function () {
                var nota;
                $("#rating_1").rating({
                    static: false, score: 2, stars: 5, showHint: true, showScore: true,
                    click: function (value, rating) {
                        rating.rate(value);
                        nota = value;
                    }
                });
            });
        </script>
    </body>
</html>