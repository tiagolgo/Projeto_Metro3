<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h3>Novo comentário</h3>
<span>Avaliação</span>
<div class="rating full-size" data-role='rating' data-show-score='false' id='comentario-nota'></div>
<label>Comentário</label>
<textarea class="input-control textarea full-size" style="width: 300px;height: 200px" id="comentario-texto"></textarea>
<button type="button" value="${userLogado.nome}" class="button success" id='enviar-comentario'>Enviar</button>
<input type="button" value="Cancelar" class="warning" id='cancelar-comentario'/>
