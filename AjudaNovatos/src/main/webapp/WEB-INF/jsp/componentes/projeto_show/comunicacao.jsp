<%-- 
    Document   : comunicacao
    Created on : 01/06/2015, 09:07:30
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="tabcontrol" data-role="tabControl">
    <ul class="tabs">
        <li class="active"><a href="#pesquiseAntes">${t["tab.pesquisa"]}</a> </li>
        <li><a href="#batePapo">${t["tab.irc"]}</a></li>
        <li><a href="#listaDiscussao">${t["tab.lista.discussao"]}</a></li>
    </ul>
    <div class="frames">
        <!--pesquise antes -->
        <div class="frame bg-white" id="pesquiseAntes">
            <c:import url="../componentes/projeto_show/comunicacao/pesquisa.jsp"/>
        </div>

        <!-- Canal de comunicação IRC -->
        <div class="frame bg-white" id="batePapo">
            <c:import url="../componentes/projeto_show/comunicacao/irc.jsp"/>
        </div>

        <!-- Lista de discussão -->
        <div class="frame bg-white" id="listaDiscussao">
            <c:import url="../componentes/projeto_show/comunicacao/lista.jsp"/>
        </div>
    </div>
</div>
