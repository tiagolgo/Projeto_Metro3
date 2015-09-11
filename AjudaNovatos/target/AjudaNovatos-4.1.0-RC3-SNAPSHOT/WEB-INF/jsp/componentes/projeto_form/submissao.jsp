<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="projeto.submeterMudanca.id" value="${projeto.submeterMudanca.id}"/>
<p>Forneça ao novato informações de como ele pode realizar a sua primeira contribuição. Quais são os passos que ele deve seguir?</p>
<textarea class="tiny" name="projeto.submeterMudanca.texto">
    ${projeto.submeterMudanca.texto}
</textarea>