<%-- 
    Document   : comoIniciar
    Created on : 01/06/2015, 09:06:05
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p>Aqui você encontra informações de como iniciar no projeto.</p>
<div class="tabcontrol" data-role="tabControl" style="margin-top: 20px">
    <ul class="tabs">
        <li class="active"><a href="#fluxo">${t["tab.fluxo"]}</a></li>
        <li><a href="#tarefaFacil" id="tab_tarefaFacil">${t["tab.tarefa"]}</a></li>
        <li><a href="#especialista">${t["tab.mentor"]}</a></li>
    </ul>
    <div class="frames">

        <!-- fluxo de contribuição -->
        <div class="frame bg-white" id="fluxo">
            <c:import url="../componentes/projeto_show/inicio/fluxo.jsp"/>
        </div>

        <!-- Encontrar tarefa fácil -->
        <div class="frame bg-white" id="tarefaFacil">
            <c:import url="../componentes/projeto_show/inicio/tarefa.jsp"/>
        </div>

        <!-- Encontrar especialista -->    
        <div class="frame bg-white" id="especialista">
            <c:import url="../componentes/projeto_show/inicio/auxilio.jsp"/>
        </div>
    </div>
</div>
