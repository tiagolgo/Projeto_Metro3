<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="projeto.comoIniciar.id" value="${projeto.comoIniciar.id}"/>
<div class="tabcontrol" data-role='tabControl'>
    <div class="tabs">
        <li class="active"><a href="#tab-inicio-1">Fluxo de Contribuicao</a></li>
        <li><a href="#tab-inicio-2">Encontrar uma tarefa facil</a></li>
        <li><a href="#tab-inicio-3">Encontrar um auxiliador</a></li>
    </div>
    <div class="frames">
        <!-- Fluxo de contribuicao -->
        <input type="hidden" name="projeto.comoIniciar.fluxo.id" value="${projeto.comoIniciar.fluxo.id}"/>
        <div class="frame bg-white" id="tab-inicio-1">
            <c:import url="../componentes/projeto_form/auxilio/fluxo.jsp"/>                        
        </div>
        <!-- Encontrar tarefa facil -->
        <div class="frame bg-white" id="tab-inicio-2">
            <c:import url="../componentes/projeto_form/auxilio/tarefa.jsp"/>                        
        </div>
        <!-- Encontrar orientador -->
        <div class="frame bg-white" id="tab-inicio-3">
            <c:import url="../componentes/projeto_form/auxilio/auxiliador.jsp"/>                     
        </div>
    </div>
</div>