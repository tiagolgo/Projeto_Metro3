<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="projeto.entendendoCodigo.id" value="${projeto.entendendoCodigo.id}"/>
<p>Entender o Código</p>
<textarea class="tiny" name="projeto.entendendoCodigo.documentacao">
    ${projeto.entendendoCodigo.documentacao}
</textarea>