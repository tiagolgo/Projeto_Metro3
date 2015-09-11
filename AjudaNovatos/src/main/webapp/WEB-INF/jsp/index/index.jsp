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
            <div class="row align-center margin60">
                <h1 style="font-size: 4.5rem; line-height: 1" class="text-shadow metro-title">AjudaNovatos</h1>
                <div class="padding20 sub-leader text-light">
                    ${t["index.texto1"]}
                </div>
                <h3 class="text-light">${t["index.texto2"]}</h3>
                <h4 class="text-light">${t["index.texto3"]}</h4>
            </div>
            <div class="row margin60">
                <div class="grid" >
                    <div class="row cells2">

                        <!-- PROJETOS ADICIONADOS -->
                        <c:if test="${projetosIndex.size()>0}">
                            <div class="cell">
                                <div class="panel">
                                    <div class="heading"><span class="title">${t["index.list.projetos"]}</span></div>
                                    <div class="content bg-white">
                                        <div class="listview">
                                            <c:forEach var="projeto" items="${projetosIndex}">
                                                <a class="list" href="<c:url value="${t['url.buscar.projeto.id']}?id=${projeto.id}"/>" >
                                                    <img src="${projeto.small_logo_url}" class="list-icon"/>
                                                    <span class="list-title full-size text-bold"><c:out value="${projeto.name}"/></span><br/>
                                                    <span class="text-light"></span>
                                                </a>  
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <!-- LINGUAGENS MAIS USADAS -->
                        <c:if test="${informacoesProjetos.linguagens.size()>0}">
                            <div class="cell">
                                <div class="panel">
                                    <div class="heading"><span class="title">${t["index.list.linguagens"]}</span></div>
                                    <div class="content bg-white">
                                        <div class="listview">
                                            <c:forEach var="linguagem" items="${informacoesProjetos.linguagens}">
                                                <c:if test="${!linguagem.contains('Other')}">
                                                    <a class="list" href="<c:url value='${t["url.projeto.linguagem"]}?q=${linguagem}'/>">
                                                        <img src="" class="list-icon"/>
                                                        <span class="list-title text-bold"><c:out value="${linguagem}"/></span><br/>
                                                        <!--<span class="text-light">Utilizada em c:out value="{linguagem.quantidade}"/> projeto(s)</span>-->
                                                    </a>
                                                </c:if>
                                            </c:forEach>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <!-- PROJETOS RECENTES -->
                        <!--
                        <div class="cell">
                             <div class="panel">
                                 <div class="heading"><span class="title">{t["index.list.novidades"]}</span></div>
                                 <div class="content bg-white">
                                     <div class="listview">
                                         c:forEach var="recente" items="{informacoesProjetos.projetosRecente}">
                                             <a class="list" href="c:url value="{t['url.buscar.projeto.id']}?id={recente.id}"/>" >
                                                 <img src="{recente.small_logo_url}" class="list-icon"/>
                                                 <span class="list-title text-bold">c:out value="{recente.name}"/></span><br/>
                                                 <span class="text-light">xxcvxc</span>
                                             </a>
                                         /c:forEach>
                                     </div>  
                                 </div>
                             </div>
                         </div>
                        -->
                    </div>
                </div>
            </div>
            <div class="row bg-red">
             
            </div>
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