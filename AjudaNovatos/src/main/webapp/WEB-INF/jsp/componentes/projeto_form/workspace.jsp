<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="projeto.configurarWorkspace.id" value="${projeto.configurarWorkspace.id}"/>
<p>
    Aqui você deve mostrar ao novato quais são os recursos disponibilizados pelo projeto. Tais como, ajuda
    ajuda para configurar espaço de trabalho e como enviar suas mudanças.
</p>
<p>Aqui você deve fornecer os recursos disponibilizados pelo projeto</p>
<textarea class="tiny" name="projeto.configurarWorkspace.texto">
    ${projeto.configurarWorkspace.texto}
</textarea>  