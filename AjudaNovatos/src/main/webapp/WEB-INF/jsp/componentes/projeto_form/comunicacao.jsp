<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="projeto.comunicacao.id" value="${projeto.comunicacao.id}"/>
<div class="grid fluid">
    <input type="hidden" name="projeto.comunicacao.pesquisa.id" value="${projeto.comunicacao.pesquisa.id}"/>
    <!-- canal de comunicação IRC -->
    <input type="hidden" name="projeto.comunicacao.irc.id" value="${projeto.comunicacao.irc.id}"/>
    <p class="text-bold fg-blue">O projeto possui IRC?
        <label class="input-control radio">
            <input type="radio" name='f1' onclick="escondeElemento('#rowIrc', true);" ${projeto.comunicacao.irc!=null?'checked':''}/>
            <span class="check"></span>
            <span class="caption">Sim</span>
        </label>
        <label class="input-control radio">
            <input type="radio" name='f1' onclick="escondeElemento('#rowIrc', false);" ${projeto.comunicacao.irc==null?'checked':''}/>
            <span class="check"></span>
            <span class="caption">Não</span>
        </label>
    </p>
    <div id="rowIrc" <c:if test="${projeto.comunicacao.irc==null}">style="display: none"</c:if>>
            <label>Informe o endereço para a página do chat do projeto.</label>
            <div class="input-control text full-size" data-role="input-control">
                <input name='projeto.comunicacao.irc.url'  type="text" placeholder="URL para o Chat IRC do projeto" value="${projeto.comunicacao.irc.url}"/>
            <button class="button helper-button clear" ><span class="mif-cross"></span></button>
        </div>
        <p>Consideracões sobre o IRC.</p>
        <textarea class="tiny" name="projeto.comunicacao.irc.texto">
            ${projeto.comunicacao.irc.texto}
        </textarea>
    </div>
    <!-- lista de discussão -->
    <input type="hidden" name="projeto.comunicacao.lista.id" value="${projeto.comunicacao.lista.id}"/>
    <p class="text-bold fg-blue">O projeto possui Lista de Discussão?
        <label class="input-control radio">
            <input type="radio" name='f2' onclick="escondeElemento('#rowLista', true)" ${projeto.comunicacao.lista!=null?'checked':''}/>
            <span class="check"></span>
            <span class="caption">Sim</span>
        </label>
        <label class="input-control radio">
            <input type="radio" name='f2' onclick="escondeElemento('#rowLista', false)" ${projeto.comunicacao.lista==null?'checked':''}/>
            <span class="check"></span>
            <span class="caption">Não</span>
        </label>
    </p>
    <div id="rowLista" style="display: none">
        <label>Informe o link para lista de discussão.</label>
        <div class="input-control text full-size">
            <input id="dados-dono" name="projeto.comunicacao.lista.link" type="text" placeholder="Link para lista de discussão"/>
            <button class="button helper-button clear"><span class="mif-cross"></span></button>
        </div>
        <p>Como é realizada a subscrição na Lista de Discussão.</p>
        <textarea class="tiny" id="listaT" name="projeto.comunicacao.lista.subscricao">
            ${projeto.comunicacao.lista.subscricao}
        </textarea>
        <br/>
        <p>Considerações sobre como se comportar na Lista de Discussão.</p>
        <textarea class="tiny"  name="projeto.comunicacao.lista.informacao">
            ${projeto.comunicacao.lista.informacao}
        </textarea>
    </div>
</div>