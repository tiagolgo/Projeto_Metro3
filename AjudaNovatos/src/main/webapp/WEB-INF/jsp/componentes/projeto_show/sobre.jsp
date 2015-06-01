<%-- 
    Document   : sobre
    Created on : 01/06/2015, 09:02:19
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<p style="font-size: 25px; line-height: 100%">
<c:out value="${projeto.descricao}"/>
</p>
<div class="grid">
    <div class="row cells2">
        <div class="cell">
            <p><span class="text-bold">${t["projeto.pagina"]}</span><a href="http://<c:out value="${projeto.site}"/>" target="_blank"> ${projeto.site}</a></p>
            <p><span class="text-bold">${t["projeto.bug"]}</span> <a href="http://<c:out value="${projeto.gestorBug}"/>" target="_blank"> ${projeto.gestorBug}</a></p>
            <p><span class="text-bold">${t["projeto.repositorio"]}</span><a href="http://<c:out value="${projeto.repositorio.link}"/>" target="_blank"> ${projeto.repositorio.link}</a></p>
            <p><span class="text-bold">${t["projeto.lista"]}</span><a href="<c:out value="${projeto.listaDiscussao}"/>" target="_blank"> ${projeto.listaDiscussao}</a></p>
            <p><span class="text-bold">${t["projeto.wiki"]}</span><a href="<c:out value="${projeto.wiki}"/>" target="_blank"> ${projeto.wiki}</a></p>
            <p><span class="text-bold">${t["projeto.plataforma"]}</span>                                        
                <span class="fg-lightBlue"><c:out value="${projeto.plataformas.toString().replace('[','').replace(']','')}"/></span>
            </p>
            <p><span class="text-bold">${t["projeto.linguagem"]}</span>
                <span class="fg-lightBlue"><c:out value="${projeto.linguagens.toString().replace('[','').replace(']','')}"/></span>
            </p>
        </div>
        <div class="cell">
            <c:if test="${projeto.openHub}">
                <script type='text/javascript' src='https://www.openhub.net/p/${fn:toLowerCase(projeto.nome)}/widgets/project_factoids_stats.js'></script>
            </c:if>
        </div>
    </div>
</div>