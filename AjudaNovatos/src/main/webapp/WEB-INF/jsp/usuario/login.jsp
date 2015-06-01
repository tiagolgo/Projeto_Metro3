<%-- 
    Document   : login
    Created on : 26/03/2015, 14:35:33
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page errorPage="../erros/404.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS -->
        <link href="/AjudaNovatos/css/metro.css" rel="stylesheet">
        <link href="/AjudaNovatos/css/metro-icons.css" rel="stylesheet">

        <script src="/AjudaNovatos/js/jquery.min.js"></script>
        <script src="/AjudaNovatos/js/metro.js"></script>
        <style>
            .login-form {
                width: 400px;
                height: 50%;
                position: fixed;
                top: 50%;
                margin-top: -150px;
                left: 50%;
                margin-left: -200px;
                background-color: #ffffff;
                opacity: 0;
                -webkit-transform: scale(.8);
                transform: scale(.8);
            }
        </style>

        <script>
            $(function () {
                var form = $(".login-form");
                form.css({
                    opacity: 1,
                    "-webkit-transform": "scale(1)",
                    "transform": "scale(1)",
                    "-webkit-transition": ".5s",
                    "transition": ".5s"
                });
            });
        </script>
    </head>
    <body class="op-black">
        <div class="login-form padding20 block-shadow">
            <form action="<c:url value="/login"/>" method="POST" id="formLogin">
                <h1 class="text-light">Formulário de Login</h1>
                <hr class="thin"/>
                <c:if test="${errors!=null}">
                    <div class="fg-red padding5 ">
                        <c:forEach var="error" items="${errors}">
                            ${error.message}<br />
                        </c:forEach>
                    </div>
                </c:if>
                <br />
                <div class="input-control text full-size" data-role="input">
                    <label for="user_login">User email:</label>
                    <input type="text" name="login" id="user_login">
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>
                <br />
                <br />
                <div class="input-control password full-size" data-role="input">
                    <label for="user_password">User password:</label>
                    <input type="password" name="senha" id="user_password">
                    <button class="button helper-button reveal"><span class="mif-looks"></span></button>
                </div>
                <br />
                <br />
                <div class="form-actions">
                    <input type="submit" class="button primary" value="Login to.."/>
                    <a class="button" href="/AjudaNovatos">Cancel</a>
                </div>
            </form>
        </div>

    </body>
</html>
