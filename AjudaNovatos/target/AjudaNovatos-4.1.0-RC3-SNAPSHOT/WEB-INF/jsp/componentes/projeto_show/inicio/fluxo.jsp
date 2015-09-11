<%-- 
Document   : fluxo
Created on : 01/06/2015, 09:21:45
Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .fluxo-tile{        
        padding: 5%;
        margin: 2%;
        border-radius: 5px;
        text-align: center;
        background-color: #ce352c;
        color:#eeeeee;
    }
    .fluxo-tile:hover{
        cursor: pointer;
        background-color: #eeeeee;
        color: #ce352c;
        border:2px solid #ce352c;
    }
    .flecha{       
        border-bottom:10px solid transparent;  /* izquierda flecha */
        border-top:10px solid transparent; /* derecha flecha */
        border-left:5px solid lightgray; /* base flecha y color*/
        float: right;
    }
    .suporte-div{
        padding: 1%;
        text-align: center;
        background-color: #008a00;
        border:2px solid lightgray;
    }
    .suporte-div:hover{
        background-color: #eeeeee;
        color: #008a00;
        border:2px solid #008a00;
        cursor: pointer;
    }

</style>
<h3 class="fg-darkBlue">${t["fluxo.titulo"]} <span class="fg-green rating_nota"></span></h3>
<p>${projeto.comoIniciar.fluxo.texto}</p>
<div class="grid">
    <div class="row cells3">
        <div class="cell">
            <div class="fluxo-tile" onclick="ativaAba('#tab2')" >
                1. ${t["fluxo.habilidades"]}<span class="flecha"></span>
            </div>
        </div>
        <div class="cell">
            <div class="fluxo-tile" onclick="ativaAba('#tab5')">
                2. ${t["fluxo.workspace"]}<span class="flecha"></span>
            </div>
        </div>
        <div class="cell">
             <div class="fluxo-tile" onclick="ativaAba('#tab_tarefaFacil')">
                3. ${t["fluxo.tarefa"]}<span class="flecha"></span>
            </div>
        </div>
    </div>
    <div class="row cells2">
        <div class="cell">
            <div class="fluxo-tile" onclick="ativaAba('#tab6')">
                4. ${t["fluxo.codigo"]}<span class="flecha"></span>
            </div>
        </div>
        <div class="cell">
            <div class="fluxo-tile" onclick="ativaAba('#tab7')">
                5. ${t["fluxo.contribuicao"]}<span class="flecha"></span>
            </div>
        </div>
    </div>
</div>

<div class="row suporte-div" style="border-radius: 5px" onclick="ativaAba('#tab4')">
    ${t["fluxo.suporte"]}
</div>

<!-- Área de Comentários -->
<div class="row area">
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