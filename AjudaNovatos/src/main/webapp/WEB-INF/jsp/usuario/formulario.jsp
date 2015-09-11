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
            <div style="padding-left: 120px;padding-right: 120px">
                <div class="panel" style="margin-top: 5%; text-align: left">
                    
                        <h1>${t["cadastro.div.titulo"]}</h1>
                    
                    <div class="content padding10">
                        <c:if test="${errors!=null}">
                            <div class="fg-red padding5 ">
                                <c:forEach var="error" items="${errors}">
                                    ${error.message}<br />
                                </c:forEach>
                            </div>
                        </c:if>

                        <form method="post" action="<c:url value="${t['url.salvar.usuario']}"/>"  data-role="validator" data-hint-mode="line">
                            <div class="grid">
                                <div class="row cells2">
                                    <div class="cell">
                                        <label>*Nome</label>
                                        <div class="input-control text full-size">
                                            <input type="text" value="" id="nome" name="usuario.nome"
                                                   data-validate-func="required" 
                                                   data-show-error-hint="false"
                                                   data-validate-hint="Campo requerido!"
                                                   data-validate-arg="6" 
                                                   class="required"
                                                   />
                                            <span class="input-state-error mif-warning"></span>
                                            <span class="input-state-success mif-checkmark"></span>
                                        </div>
                                        <label>*Email</label>
                                        <div class="input-control text full-size">
                                            <input type="text" value="" id="email" name="usuario.email"
                                                   data-validate-func="required" 
                                                   data-show-error-hint="false"
                                                   data-validate-hint="Campo requerido!"
                                                   data-validate-arg="6" 
                                                   class="required"
                                                   />
                                            <span class="input-state-error mif-warning"></span>
                                            <span class="input-state-success mif-checkmark"></span>                                        </div>
                                    </div>
                                    <div class="cell">
                                        <label>*Senha</label>
                                        <div class="input-control password full-size">
                                            <input type="password" value="" id="senha" name="usuario.password.senha"
                                                   data-validate-func="required" 
                                                   data-show-error-hint="false"
                                                   data-validate-hint="Campo requerido!"
                                                   data-validate-arg="6" 
                                                   class="required"
                                                   />
                                            <span class="input-state-error mif-warning"></span>
                                            <span class="input-state-success mif-checkmark"></span>                                        </div>
                                        <label>*Confirmação de Senha</label>
                                        <div class="input-control password full-size">
                                            <input type="password" value="" id="verificacaoSenha"
                                                   data-validate-func="required" 
                                                   data-show-error-hint="false"
                                                   data-validate-hint="Campo requerido!"
                                                   data-validate-arg="6" 
                                                   class="required"
                                                   />
                                            <span class="input-state-error mif-warning"></span>
                                            <span class="input-state-success mif-checkmark"></span>                                        </div>
                                    </div>
                                    <label class="text-info text-italic">* Campos de preenchimento obrigatório</label>
                                    <div class="row form-actions" style="margin-top: 15px">
                                        <button class="button bg-green">${t["btn.enviar"]}</button>
                                        <a href="<c:url value="${t['url.home']}"/>" class="button bg-orange fg-white"> ${t["btn.cancelar"]}</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
            /* $('#salvarUser').on('click', function () {
             var nome = $('#nome').val();
             var login = $('#login').val();
             var email = $('#email').val();
             var senha = $('#senha').val();
             var verificacaoSenha = $('#verificacaoSenha').val();
             var submitForm = true;
             if (nome === '') {
             $('#nome').parent(".input-control").addClass("error-state");
             submitForm = false;
             }
             if (login === '') {
             $('#login').parent(".input-control").addClass("error-state");
             submitForm = false;
             }
             if (email === '') {
             $('#email').parent(".input-control").addClass("error-state");
             submitForm = false;
             }
             if (verificacaoSenha === '') {
             $('#verificacaoSenha').parent(".input-control").addClass("error-state");
             submitForm = false;
             }
             if (senha === '') {
             $('#senha').parent(".input-control").addClass("error-state");
             submitForm = false;
             } else {
             if (senha != verificacaoSenha) {
             $('#verificacaoSenha').parent(".input-control").addClass("error-state");
             submitForm = false;
             }
             }
             if (submitForm) {
             $("#form-novo-usuario").submit();
             }
             });
             //REMOVER ALERTAS DE ERRO
             $('#nome, #login, #email, #senha, #verificacaoSenha').focusin(function () {
             $(this).parent(".input-control").removeClass('error-state');
             });*/
            });
        </script>
    </body>
</html>
