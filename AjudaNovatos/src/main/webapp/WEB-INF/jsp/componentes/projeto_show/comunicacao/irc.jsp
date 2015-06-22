<%-- 
    Document   : irc
    Created on : 01/06/2015, 09:17:05
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h4 class="fg-darkBlue">${t["tab.irc.titulo1"]} <span class="fg-green rating_nota"></span></h4>
<p>${projeto.comunicacao.irc.texto}</p>
<div class="fg-red">
    <iframe src="${projeto.comunicacao.irc.url}" style="border: none;width:100%;height: 500px"></iframe>
</div>

<!-- Área de Comentários -->
<div class="row coment-area" style="margin-top: 100px">
    <h5 class="padding10" style="border-bottom: 2px solid lightgray">Comentarios
        <c:if test="${userLogado.logado==true}">
            <span class="element place-right"><a href="#" onclick="exibirFormComentario(${projeto.comunicacao.irc.id}, 'chat', this);"><i class="icon-plus"> </i> Novo</a></span>
        </c:if>
    </h5>

    <div class="listview-outlook" data-role="listview" id='comentarios'>
        <c:forEach var="comentario" items="${projeto.comunicacao.irc.comentarios}">
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