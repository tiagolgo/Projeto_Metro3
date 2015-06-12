<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<form class='form-autenticacao' method="post" data-role="validator" data-hint-mode="line" >
    <h3 class="text-light">Login to service</h3>
    <div class="input-control text-italic fg-red msg-erros" style="display: none">
    </div>
    <div class="input-control text full-size" style="font-size: 14px">
        <span class="mif-user prepend-icon"></span>
        <input type="text" 
               data-validate-func="required"
               data-validate-arg="6"
               data-validate-hint="Campo requerido!"
               class="required a"
               name="login"
               />
        <span class="input-state-error mif-warning"></span>
        <span class="input-state-success mif-checkmark"></span>
    </div>
    <div class="input-control text full-size" style="font-size: 14px; margin-top: 15px">
        <span class="mif-lock prepend-icon "></span>
        <input type="password"
               data-validate-func="required" 
               data-validate-arg="6" 
               data-validate-hint="Campo requerido!"
               class="required b"
               name="senha"
               />
        <span class="input-state-error mif-warning"></span>
        <span class="input-state-success mif-checkmark"></span>
    </div>
    <label class="input-control checkbox small-check">
        <input type="checkbox">
        <span class="check"></span>
        <span class="caption">Remember me</span>
    </label>
    <div class="form-actions" style="margin-top: 20px">
        <button class="button bg-green">Submit</button>
        <button class="button link cancel-autenticacao" type="button">Cancelar</button>
    </div>
    <div class="row" style="margin-top: 20px">
        <a class="button link" href='<c:url value="${t['url.form.usuario']}"/>' > ${t["login.label.cadastro"]}</a>
    </div>
</form>    
