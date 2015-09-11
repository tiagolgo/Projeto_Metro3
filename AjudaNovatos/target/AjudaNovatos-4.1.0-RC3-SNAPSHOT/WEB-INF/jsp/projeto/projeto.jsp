<%-- 
    Document   : home
    Created on : 03/10/2014, 01:47:47
    Author     : Tiago Luiz Gomes
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Ajuda Novatos</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="description" content="Simple responsive css framework">
        <meta name="author" content="Tiago Luiz Gomes de Oliveira">
        <script>
            function ativaAba(aba) {
                $(aba).click();
            }
        </script>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp" />
        <div id="fb-root"></div>
        <div id="fb-root"></div>
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {
                    return;
                }
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.3&appId=273300429357640";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>

            <div style="margin-top: 2%;margin-bottom: 2%; padding: 5px;">
                <h1 class="text-bold"><img src=${projeto.medium_logo_url} width="70px"/> <c:out value="${projeto.name}"/></h1>
                <div class="fb-like place-right" data-href="https://developers.facebook.com/docs/plugins/" data-width="600" data-layout="button" data-action="like" data-show-faces="true" data-share="true"></div>
            </div>
            <div class="tabcontrol" data-role="tabControl">
                <ul class="tabs">
                    <li class="active"><a href="#tab_1" id="tab1">${t["tab.sobre"]}</a></li>
                    <li><a href="#tab_2" id="tab2">${t["tab.requisitos"]}</a></li>
                    <li><a href="#tab_3" id="tab3">${t["tab.comoiniciar"]}</a></li>
                    <li><a href="#tab_5" id="tab4">${t["tab.contato"]}</a></li>
                    <li><a href="#tab_4" id="tab5">${t["tab.workspace"]}</a></li>
                    <li><a href="#tab_6" id="tab6">${t["tab.entender"]}</a></li>
                    <li><a href="#tab_7" id="tab7">${t["tab.contribuicao"]}</a></li>
                </ul>

                <div class="frames" >
                    <!-- SOBRE -->
                    <div class="frame bg-white" id="tab_1">
                        <c:import url="../componentes/projeto_show/sobre.jsp"/>
                    </div>

                    <!-- REQUISITOS -->
                    <div class="frame bg-white" id="tab_2">
                        <c:choose>
                            <c:when test="${projeto.requisito.requisitosBasico!=null and projeto.requisito.requisitosAdicionais!=null}">
                                <c:import url="../componentes/projeto_show/requisitos.jsp"/>
                            </c:when>
                            <c:otherwise>
                                <h5>Este projeto nao possui...</h5>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- COMO INICIAR -->
                    <div class="frame bg-white" id="tab_3">
                        <c:import url="../componentes/projeto_show/comoIniciar.jsp"/>
                    </div>

                    <!-- COMUNICACAO -->
                    <div class="frame bg-white" id="tab_5">
                        <c:import url="../componentes/projeto_show/comunicacao.jsp"/>
                    </div>

                    <!-- CONFIGURAÇÃO DO ESPAÇO DE TRABALHO -->
                    <div class="frame bg-white" id="tab_4">
                        <c:import url="../componentes/projeto_show/workspace.jsp"/>
                    </div>

                    <!-- ENTENDENDO O CODIGO -->
                    <div class="frame bg-white" id="tab_6">
                        <c:import url="../componentes/projeto_show/codigo.jsp"/>
                    </div>

                    <!-- ENVIAR CONTRIBUICAO -->
                    <div class='frame bg-white' id='tab_7'>
                        <c:import url="../componentes/projeto_show/contribuicao.jsp"/>
                    </div>
                </div>
            </div>              
        </div>  
        <script type="text/javascript">
            var origemComentario, idComentario, tabelaComentario;
            function exibirFormComentario(id, tabela, obj) {
                showDialog("#dialog2");
                origemComentario = $(obj).closest(".coment-area");
                idComentario = id;
                tabelaComentario = tabela;
            }
            // AREA DE COMENTARIO ESCONDER/MOSTRAR
            $(function () {
                $("#enviar-comentario").on("click", function () {
                    var nota = 0, stars = '', texto = $("#comentario-texto").val(), data = new Date().toLocaleString(), usuario = $(this).val();

                    $("#comentario-nota").find(".on").each(function () {
                        nota++;
                        stars = stars + '<span class="star on"></span>';
                    });

                    $.ajax({type: 'GET', url: '/AjudaNovatos/adicionarComentario', data: "id_alvo=" + idComentario + "&alvo=" + tabelaComentario + "&comentario_autor=" + usuario + "&comentario_texto=" + texto + "&comentario_data=" + data + "&nota=" + nota
                    }).done(function () {
                        $(origemComentario.find("#comentarios")).append('<div class="list"> <div class="list-content"><span class="list-title"><span class="rating rating-criado small fg-yellow no-margin place-right">' + stars + '</span>' + usuario + '</span><span class="list-subtitle"> Data:' + data + '</span><span class="list-remark">' + texto + '</span></div></div>');
                    }).fail(function () {
                        alert("Não foi possível adicionar o comentario!");
                    });
                });
            });
            $(function () {
                $(".rating").rating();
            });
        </script>
        <script src="/AjudaNovatos/js/projeto-form.js"></script>
    </body>
</html>