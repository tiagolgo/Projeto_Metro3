<%-- 
    Document   : novo-usuario
    Created on : 12/11/2014, 22:04:25
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../erros/404.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Ajuda Novatos</title>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp"/>
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>
            <center>
                <div class="success">
                    <c:out value="${successo}"/>
                </div>
                <div class="panel text-left" style="margin-top: 80px">
                    <div class="panel-header">
                        <h1> Meus Dados</h1>
                    </div>
                    <div class="panel-content padding10">
                        <form method="post" action="<c:url value="${t['url.salvar.usuario']}"/>" id="form-novo-usuario" style='text-align: left'>
                            <div class="grid">
                                <div class="row cells2">
                                    <div class="cell border padding10">
                                        <label class="text-bold">Nome</label>
                                        <div class="input-control text full-size">
                                            <input type="text" id="nome" name="usuario.nome" value="${usuario.nome}" placeholder="Nome" disabled="true"/>
                                            <button class="button helper-button clear"><span class="mif-cross"></span></button>
                                        </div>
                                        <label class="text-bold">Email</label>
                                        <div class="input-control text full-size">
                                            <input type="text" value="${usuario.email}" id="email" name="usuario.email" placeholder="E-mail" disabled="true"/>
                                            <button class="button helper-button clear"><span class="mif-cross"></span></button>
                                        </div>
                                        <div class="input-control switch">
                                            <label class="fg-blue">
                                                Alterar Nome e Email
                                                <input type="checkbox" id="dados-pessoais"/>
                                                <span class="check"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="cell border padding10">
                                        <label class="text-bold">Senha</label>
                                        <div class="input-control password full-size">
                                            <input type="password" value="" id="senha" name="usuario.password.senha" placeholder="Senha" disabled="true"/>
                                            <button class="button helper-button reveal"><span class="mif-looks"></span></button>
                                        </div>
                                        <label class="text-bold">Confirmação de Senha</label>
                                        <div class="input-control password full-size">
                                            <input type="password" value="" id="versenha" placeholder="Repita a senha" disabled="true"/>
                                            <button class="button helper-button reveal"><span class="mif-looks"></span></button>
                                        </div>
                                        <div class="input-control switch">
                                            <label class="fg-blue">
                                                Alterar Senha 
                                                <input type="checkbox" id="dados-autenticacao"/>
                                                <span class="check"></span>
                                            </label>
                                        </div>
                                    </div>                
                                    <script type="text/javascript">
                                        $(function () {
                                            $("#dados-pessoais").on("change", function () {
                                                var x = document.getElementById("dados-pessoais").checked;
                                                if (x) {
                                                    $("#nome,#email").attr("disabled", false);
                                                } else {
                                                    $("#nome,#email").attr("disabled", true);
                                                }
                                            });

                                            $("#dados-autenticacao").on("change", function () {
                                                var x = document.getElementById("dados-autenticacao").checked;
                                                if (x) {
                                                    $("#senha,#versenha").attr("disabled", false);
                                                } else {
                                                    $("#senha,#versenha").attr("disabled", true);
                                                }
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="row">
                                <input type="button" class="bg-green fg-white" value="Salvar" id="salvar-dados"/>
                                <input type="button" class="bg-orange fg-white" value="Cancelar"/>
                            </div>
                        </form>
                    </div>
                </div>
            </center>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#salvar-dados').on('click', function (event) {
                    var nome = $('#nome').val();
                    var mail = $('#email').val();
                    var senha = $('#senha').val();
                    var versenha = $("#versenha").val();
                    var submit = true;
                    if (nome === "") {
                        $('#nome').parent(".input-control").addClass("error-state");
                        submit = false;
                    }
                    if (mail === "") {
                        $('#email').parent(".input-control").addClass("error-state");
                        submit = false;
                    }
                    if (senha === "") {
                        $('#senha').parent(".input-control").addClass("error-state");
                        submit = false;
                    } else {
                        if (senha !== versenha) {
                            $('#versenha').parent(".input-control").addClass("error-state");
                            submit = false;
                        }
                    }
                    if (submit) {
                        submit = true;
                        alert("submeter ");
                    }
                });

                //REMOVER ALERTAS DE ERRO
                $('#nome, #email, #senha, #versenha').focusin(function () {
                    $(this).parent(".input-control").removeClass('error-state');
                });
            });
        </script>
    </body>
</html>
