<%-- 
    Document   : novo
    Created on : 15/11/2014, 20:02:39
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="erro.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Adicionar Projeto</title>
        <script type="text/javascript" src="/AjudaNovatos/js/tinymce/tinymce.min.js"></script>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp" />
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>
            <div style="margin-top: 2%;; font-size: 3.5rem;">
                <c:choose>
                    <c:when test="${projeto!=null}">
                        Alterar meu projeto
                    </c:when>
                    <c:otherwise>
                        Adicionar meu projeto
                    </c:otherwise>
                </c:choose>
                <span class="place-right">
                    <input type="button" class="button bg-green fg-white" value="Salvar Projeto" id='salvar-projeto'/>
                    <a href='<c:url value="${t['url.home']}"/>' class="button bg-orange fg-white"> Cancelar</a>
                </span>
                <script type="text/javascript">
                    $(function () {
                        $("#salvar-projeto").on("click", function () {
                            $("#dados-form").submit();
                        });
                    });
                </script>
            </div>

            <form id="dados-form" method="POST" action="<c:url value="${t['url.salvar.projeto']}"/>" enctype="multipart/form-data" style='margin-top: 2%'>
                <input type="hidden" name="projeto.id" value="${projeto.id}"/>
                <div class="tabcontrol" data-role="tabControl">
                    <ul class="tabs">
                        <li class="active"><a href="#tab_1">Dados</a></li>
                        <li id="tab2"><a href="#tab_2">Requisitos</a></li>
                        <li id="tab3"><a href="#tab_3">Por onde começar?</a></li>
                        <li id="tab4"><a href="#tab_4">Espaço de Trabalho</a></li>
                        <li id="tab5"><a href="#tab_5">Comunicação</a></li>
                        <li id="tab6"><a href="#tab_6">Entender Código</a></li>
                        <li id="tab7"><a href="#tab_7">Submissão de Mudanças</a></li>
                    </ul>
                    <div class="frames" >
                        <!-- DADOS DO PROJETO -->
                        <div class="frame bg-white" id="tab_1">
                            <p>Informe os dados referentes ao projeto.</p>
                            <c:import url="../componentes/projeto_form/dados.jsp"/>                               
                        </div>
                        <!-- REQUISITOS -->
                        <div class="frame bg-white" id="tab_2">
                            <c:import url="../componentes/projeto_form/requisitos.jsp"/>                               
                        </div> 
                        <!-- COMO INICIAR -->
                        <div class='frame bg-white' id='tab_3'>
                            <c:import url="../componentes/projeto_form/auxilio.jsp"/>                               
                        </div>
                        <!-- CONFIGURAÇÃO DE ESPAÇO DE TRABALHO -->
                        <div class="frame bg-white" id="tab_4">
                            <c:import url="../componentes/projeto_form/workspace.jsp"/>                                                                            
                        </div>
                        <!-- COMUNICACAO -->
                        <div class="frame bg-white" id="tab_5">
                            <c:import url="../componentes/projeto_form/comunicacao.jsp"/>                                                                            
                        </div>
                        <!-- ENTENDER CODIGO -->
                        <div class="frame bg-white" id="tab_6">
                            <c:import url="../componentes/projeto_form/codigo.jsp"/>                                                                            
                        </div>
                        <!-- SUBMISSÃO DE MUDANÇAS -->
                        <div class="frame bg-white" id="tab_7">
                            <c:import url="../componentes/projeto_form/submissao.jsp"/>                                                                            
                        </div>
                    </div>
                </div>              
            </form>
        </div>
        <script>
            tinymce.init({
                selector: ".tiny",
                theme: "modern", height: 300,
                plugins: [
                    "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                    "save table contextmenu directionality emoticons template paste textcolor"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link | forecolor backcolor",
                style_formats: [
                    {title: 'Bold text', inline: 'b'},
                    {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
                    {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
                    {title: 'Example 1', inline: 'span', classes: 'example1'},
                    {title: 'Example 2', inline: 'span', classes: 'example2'},
                    {title: 'Table styles'},
                    {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
                ]
            });
        </script>
        <script type="text/javascript" src="/AjudaNovatos/js/projeto-form.js"></script>
    </body>
</html>