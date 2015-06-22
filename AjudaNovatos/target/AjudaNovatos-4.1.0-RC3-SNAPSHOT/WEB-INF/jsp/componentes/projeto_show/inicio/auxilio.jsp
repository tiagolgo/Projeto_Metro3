<%-- 
    Document   : auxilio
    Created on : 01/06/2015, 09:22:20
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3 class="fg-darkBlue">${t["mentor.titulo"]} <span class="fg-green rating_nota"></span></h3>
<p>${projeto.comoIniciar.mentor.texto}</p>
<p>
    Here you can find a list of mentors engaged to help newcomers to Amarok: Mentors of Amarok by OpenHatch

    Other than this:

    It is possible to solve doubts and get support from developers using mailing list and IRC
    When you choose a task you can ask for help and mentorship in bugzilla, by commenting the task and asking for proper support.
    You can check who are the experts by looking at the CC list of the task (as you can observe in the Figure below).
</p>
<img src="http://localhost:8080/AjudaNovatos/images/projeto/find_mentor.png" alt="encontre um mentor" style="width: 100%;height: 300px"/>

<!-- Área de Comentários -->
<div class="row coment-area" style="margin-top: 100px">
    <h5 class="padding10" style="border-bottom: 2px solid lightgray">Comentarios
        <c:if test="${userLogado.logado==true}">
            <span class="element place-right"><a href="#" onclick="exibirFormComentario(${projeto.comoIniciar.mentor.id}, 'mentor', this);"><i class="icon-plus"> </i> Novo</a></span>
        </c:if>
    </h5>

    <div class="listview-outlook" data-role="listview" id='comentarios'>
        <c:forEach var="comentario" items="${projeto.comoIniciar.mentor.comentarios}">
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
