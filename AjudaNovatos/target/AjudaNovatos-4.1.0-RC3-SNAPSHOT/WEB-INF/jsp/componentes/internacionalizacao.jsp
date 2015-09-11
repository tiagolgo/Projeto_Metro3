<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .redondo{margin-left: 10px;height: 15px;}
</style>
<div class="row" style=" width: 100%;text-align: right">
    <a href="" title="PT" onclick="alterarLinguagem('pt');"><img src="/AjudaNovatos/images/bandeira_brasil.jpg" class="redondo"></a>
    <a href="" title="EN" onclick="alterarLinguagem('en');"><img src="/AjudaNovatos/images/bandeira_eua.jpg" class="redondo"></a>
</div>

<script type="text/javascript">
    function alterarLinguagem(linguagem) {
        $.ajax({
            type: "get",
            url: "/AjudaNovatos/alterarLocal.json",
            data:"lang="+linguagem
        }).done(function(){
            window.location.reload();
        });
    }
</script>