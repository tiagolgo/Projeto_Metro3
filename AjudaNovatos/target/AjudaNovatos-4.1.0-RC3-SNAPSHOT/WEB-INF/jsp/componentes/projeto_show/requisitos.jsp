<%-- 
    Document   : requisitos
    Created on : 01/06/2015, 09:04:12
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="grid">
    <div class="row cells2">
        <div class="cell">
            <h3 class="fg-darkBlue">${t["requisito.basico"]} <span class="default fg-green rating_nota"></span></h3>                                        
                ${projeto.requisito.requisitosBasico}
                
        </div>

        <!-- Requisitos adicionais -->
        <div class="cell" style="float: right">
            <h3 class="fg-darkBlue">${t["requisito.adicional"]}<span class="default fg-green rating_nota"></span></h3>
                ${projeto.requisito.requisitosAdicionais}
        </div>
    </div>
</div>

<!-- Área de Comentários -->
<div class="row coment-area" style="margin-top: 100px">
    <h5 class="padding10" style="border-bottom: 2px solid lightgray">Comentarios
        <c:if test="${userLogado.logado==true}">
            <span class="element place-right"><a href="#" onclick="exibirFormComentario(${projeto.requisito.id}, 'requisito', this);"><i class="icon-plus"> </i> Novo</a></span>
        </c:if>
    </h5>

    <div class="listview-outlook" data-role="listview" id='comentarios'>
        <c:forEach var="comentario" items="${projeto.requisito.comentarios}">
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
