<%-- 
    Document   : fluxo
    Created on : 01/06/2015, 09:21:45
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3 class="fg-darkBlue">${t["fluxo.titulo"]} <span class="fg-green rating_nota"></span></h3>
<p>${projeto.comoIniciar.fluxo.texto}</p>
<div class="grid fluid text-left ">
    <div class="row">
        <div class="span2 offset0">
            <a href="#" onclick="ativaAba('#tab2')" style="width: 100%;height: 20px;padding-bottom: 5px">${t["fluxo.habilidades"]}</a>
        </div>
    </div>
    <div class="row">
        <div class="span3 offset1">
            <a href="#" onclick="ativaAba('#tab5')" style="width: 100%;height: 20px;padding-bottom: 5px">${t["fluxo.workspace"]}</a>
        </div>
    </div>
    <div class="row">
        <div class="span4 offset2">
            <a href="#" onclick="ativaAba('#tab6')" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.codigo"]}</a>
        </div>
    </div>
    <div class="row">
        <div class="span5 offset3">
            <a href="#" onclick="ativaAba('#tab2')" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.requisito"]}</a>
        </div>
    </div>
    <div class="row">
        <div class="span6 offset4 ">
            <a href="#" onclick="ativaAba('#tab_tarefaFacil')" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.tarefa"]}</a>
        </div>
    </div>
    <div class="row">
        <div class="span7 offset5">
            <a href="#" onclick="ativaAba('#tab7')" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.contribuicao"]}</a>
        </div>
    </div>
    <div class="row text-center">
        <div class="span12">
            <a href="#" onclick="ativaAba('#tab4')" class="tile bg-lightGreen fg-white" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.suporte"]}</a>
        </div>
    </div>
</div>
        
<!-- Área de Comentários -->
<div class="row coment-area" style="margin-top: 100px">
    <h5 class="padding10" style="border-bottom: 2px solid lightgray">Comentarios
        <c:if test="${userLogado.logado==true}">
            <span class="element place-right"><a href="#" onclick="exibirFormComentario(${projeto.comoIniciar.fluxo.id}, 'fluxo', this);"><i class="icon-plus"> </i> Novo</a></span>
        </c:if>
    </h5>

    <div class="listview-outlook" data-role="listview" id='comentarios'>
        <c:forEach var="comentario" items="${projeto.comoIniciar.fluxo.comentarios}">
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