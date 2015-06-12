/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.utfpr.ajudanovatos.dao.DaoUsuario;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.utfpr.ajudanovatos.entidades.usuario.Usuario;
import br.com.utfpr.ajudanovatos.utils.usuario.UsuarioLogado;
import br.com.utfpr.ajudanovatos.utils.encriptacao.EncriptacaoPassword;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class LoginController {

    @Inject
    private Result result;
    @Inject
    private Validator validator;
    @Inject
    private DaoUsuario du;
    @Inject
    private UsuarioLogado ul;
    @Inject
    private EncriptacaoPassword encript;

    @Path("/acessar")
    public void acessar(String login, String senha){
        Usuario user = du.usuarioAutenticado(login, this.encript.encripta(senha));
        this.validator.addIf(user==null, new SimpleMessage("user-login", "Usuário não encontrado"));
        this.validator.onErrorForwardTo(UsuarioController.class).login();
        if (user!=null) {
            this.ul.setLogado(true);
            this.ul.setNome(user.getNome());
            this.ul.setId(user.getId());
        }
        this.result.forwardTo(IndexController.class).index();
    }

    @Post("/login")
    public void login(String login, String senha){
        List<Object> r = new ArrayList<>();
        Usuario user;
        if (login==null||senha==null) {
            r.add(0, false);
            r.add(1, "Login ou senha inválidos!");
        } else if ((user = du.usuarioAutenticado(login, this.encript.encripta(senha)))==null) {
            r.add(0, false);
            r.add(1, "Usuário não encontrado");
        } else if (user!=null) {
            this.ul.setLogado(true);
            this.ul.setNome(user.getNome());
            this.ul.setId(user.getId());
            r.add(0, true);
        }
        this.result.use(Results.json()).from(r).serialize();
    }

    @Path("/logout")
    public void logout(){
        this.ul.setLogado(false);
        this.result.redirectTo(IndexController.class).index();
    }
}
