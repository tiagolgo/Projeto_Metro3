<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<form class='form-autenticacao' method="post" data-role="validator" data-hint-mode="line" >
    <h3 class="text-light">Autentique-se</h3>
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
               placeholder="Email"
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
               placeholder="Senha"
               />
        <span class="input-state-error mif-warning"></span>
        <span class="input-state-success mif-checkmark"></span>
    </div>
    <!--
    <label class="input-control checkbox small-check">
        <input type="checkbox">
        <span class="check"></span>
        <span class="caption">Remember me</span>
    </label>
    -->
    <div class="form-actions" style="margin-top: 20px">
        <button class="button bg-green">${t["btn.enviar"]}</button>
        <button class="button bg-orange cancel-autenticacao" type="button">${t["btn.cancelar"]}</button>
    </div>
    <div class="row" style="margin-top: 20px">
        <a class="button link" href='<c:url value="${t['url.form.usuario']}"/>' > ${t["login.label.cadastro"]}</a>
    </div>
</form>    

<script>
    $(function () {

        $(".form-autenticacao").on("submit", function (event) {
            var form = $(this);
            var op = form.closest(".form-login-container").find(".opcao").text();
            console.log("opção " + op);
            if (form.find(".a").val() !== "" && form.find(".b").val() !== "") {
                event.preventDefault();
                $.ajax({
                    type: "post",
                    url: "/AjudaNovatos/login",
                    data: form.serialize()
                }).done(function (data) {
                    if (data.list[0]) {
                        // $(form).closest("div").find(".opcao").text() === "dialog" ? $("#formulario1").submit() : location.reload();
                        $("#dialog_form_login").hide();
                        //showDialog("#dialog_buscar_open_hub");
                        if (op == "menu") {
                            window.location.reload();
                        } else {
                            $("#form_carregarBuscarDados").submit();
                        }
                    } else {
                        var s = $(form).find(".msg-erros");
                        s.empty();
                        s.show();
                        s.append(data.list[1]);
                    }
                });
            }
        });
    });
</script>
