<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="projeto.entendendoCodigo.id" value="${projeto.entendendoCodigo.id}"/>
<p>Forneça informações para auxiliar o novato a entender o Código. Pode ser links para documentação e tutoriais, além de dicas.</p>
<textarea class="tiny" name="projeto.entendendoCodigo.documentacao">
    ${projeto.entendendoCodigo.documentacao}
</textarea>