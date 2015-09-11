<%-- 
    Document   : pesquisarAntes
    Created on : 01/06/2015, 09:15:45
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3 class="fg-darkBlue">${t["tab.pesquisa.titulo1"]} <span class="fg-green rating_nota"></span></h3>
<div class="grid">
    <div class="row cells2">
        <div class="cell">
            <h4 class="fg-darkBlue">${t["tab.pesquisa.titulo2"]}</h4>
            <p>Tente procurar nos arquivos das listas de discussão e wiki antes de 
                fazer sua pergunta. É uma boa prática tentar, vc mesmo, encontrar uma solução.</p>
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

        <div class="cell">
            <!--
            <h4 class="fg-darkBlue">    {t["tab.pesquisa.titulo3"]}</h4>
            <p>
                Veja outros documentos disponibilizados pelo projeto:
            </p>
            <div class="button-dropdown">
                <button class="link">Link</button>
            </div>
            -->
        </div>
    </div>
</div>

<!-- Área de Comentários -->
<div class="row coment-area" style="margin-top: 100px">
    <h5 class="padding10" style="border-bottom: 2px solid lightgray">Comentarios
        <c:if test="${userLogado.logado==true}">
            <span class="element place-right"><a href="#" onclick="exibirFormComentario(${projeto.comunicacao.pesquisa.id}, 'pesquisa', this);"><i class="icon-plus"> </i> Novo</a></span>
        </c:if>
    </h5>

    <div class="listview-outlook" data-role="listview" id='comentarios'>
        <c:forEach var="comentario" items="${projeto.comunicacao.pesquisa.comentarios}">
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
