<%-- 
    Document   : workspace
    Created on : 01/06/2015, 09:09:10
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3 class="fg-darkBlue">${t["tab.workspace.titulo1"]} <span class="fg-green rating_nota"></span></h3>
<div class="grid fluid">
    <div class="row cells2">
        <div class="cell">
            <h4 class="fg-darkBlue">${t["tab.workspace.titulo2"]}</h4>
            ${projeto.configurarWorkspace.texto}
        </div>
        <div class="cell">
            <!--<h4 class="fg-darkBlue">{t["tab.workspace.titulo3"]}</h4>-->
            <p>Perguntar se o projeto possui endereço do histórico de arquivos da lista de email </p>
            <!-- SiteSearch Google -->
            <p>Buscar uma solução no Google.</p>
            <form class="google-search">
                <div class="input-control text full-size">
                    <input type="hidden" id="url" value="${projeto.comunicacao.lista.link}"/>
                    <input type="text" class="text-busca" placeholder="Buscar no Google"/>
                    <button type="submit" class="button"><span class="mif-search"></span></button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Área de Comentários -->
<div class="row coment-area" style="margin-top: 100px">
    <h5 class="padding10" style="border-bottom: 2px solid lightgray">Comentarios
        <c:if test="${userLogado.logado==true}">
            <span class="element place-right"><a href="#" onclick="exibirFormComentario(${projeto.configurarWorkspace.id}, 'workspace', this);"><i class="icon-plus"> </i> Novo</a></span>
        </c:if>
    </h5>

    <div class="listview-outlook" data-role="listview" id='comentarios'>
        <c:forEach var="comentario" items="${projeto.configurarWorkspace.comentarios}">
            <a class="list" href="#">
                <div class="list-content">
                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                    <span class="list-remark">${comentario.texto}</span>
                </div>
            </a>
        </c:forEach>
    </div>
</div>