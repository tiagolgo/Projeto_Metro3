<%-- 
    Document   : tarefa
    Created on : 31/05/2015, 15:41:51
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" name="projeto.comoIniciar.tarefaFacil.id" value="${projeto.comoIniciar.tarefaFacil.id}"/>
<p>Nesta área você pode informar aos usuários onde e como eles podem encontrar tarefas fáceis para iniciarem.</p>
<p>Uma sugestão é você filtrar/pesquisar na lista de arquivo do projeto, as terafas fáceis para um iniciante e disponibilizar aqui, caso possua, os feeds dos arquivos.</p>
<p class="fg-darkBlue text-bold">O projeto possui Feeds para tarefas fáceis?
    <label class="input-control radio">
        <input type="radio" name='f1' onclick="escondeElemento('#rowTarefa', true);" ${projeto.comoIniciar.tarefaFacil.feeds!=null?'checked':''}/>
        <span class="check"></span>
        <span class="caption">Sim</span>
    </label>
    <label class="input-control radio">
        <input type="radio" name='f1' onclick="escondeElemento('#rowTarefa', false);" ${projeto.comoIniciar.tarefaFacil.feeds==null?'checked':''}/>
        <span class="check"></span>
        <span class="caption">Não</span>
    </label>
</p>
<div class="row" id="rowTarefa"  style=" ${projeto.comoIniciar.tarefaFacil.feeds==null?'display: none;':''} margin-bottom: 2%">
    <div class="row feeds-container">
        <div class="panel">
            <div class="heading">
                <span class="title">Inserir feed</span>
            </div>
            <div class="content">
                <div class="input-control text full-size" data-role="input-control">
                    <input class="feed-title"  type="text" placeholder="Título para do feed" value=""/>
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>
                <div class="input-control text full-size" data-role="input-control">
                    <input class="feed-url" type="text" placeholder="URL para do feed" value=""/>
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>

                <button type="button" class="button mini-button success feeds-insert">Inserir</button>

                <table class="table striped hovered table-feeds" style="width: 100%" id="feeds-tabela">
                    <thead></thead>
                    <tbody>
                    <c:forEach var="feed_add" items="${projeto.comoIniciar.tarefaFacil.feeds}" varStatus="cont">
                        <tr>
                            <td>
                                <input type="hidden"  value="${feed_add.titulo}" name="projeto.comoIniciar.tarefaFacil.feeds[${cont.count-1}].titulo"/> 
                                ${feed_add.titulo}
                            </td>
                            <td>
                                <input type="hidden"  value="${feed_add.url}" name="projeto.comoIniciar.tarefaFacil.feeds[${cont.count-1}].url"/> 
                                ${feed_add.url}
                            </td>
                            <td><button type='button' value="${feed_add.id}" class='small bg-red fg-white' onclick="removeObjetos(this,'/AjudaNovatos/removeFeed')">Excluir</button></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<p>Consideracões sobre outras formas de encontrar uma tarefa fácil para iniciar.</p>
<textarea class="tiny" name="projeto.comoIniciar.tarefaFacil.texto">
    ${projeto.comoIniciar.tarefaFacil.texto}
</textarea> 
