<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../erros/404.jsp" %>
<input type="hidden" name="projeto.requisito.id" value="${projeto.requisito.id}"/>
<p>
    Aqui você deve fornecer ao usuário informações sobre os requisitos necessários para que o novato tenha
    um bom desempenho no projeto. Esses requisitos abrangem desde linguagens, conhecimento técnico, sociais,
    proatividade, etc.                        
</p>
<!-- requisitos básicos -->
<div class="row">
    <h4>Requisitos básicos</h4>
    <textarea class="tiny" name="projeto.requisito.requisitosBasico">
        ${projeto.requisito.requisitosBasico}
    </textarea>
</div>
<div class="row" style="margin-top: 50px">
    <!-- requisitos adicionais -->
    <h4>Requisitos Adicionais</h4>
    <textarea class="tiny" name="projeto.requisito.requisitosAdicionais">
        ${projeto.requisito.requisitosAdicionais}
    </textarea>
</div> 