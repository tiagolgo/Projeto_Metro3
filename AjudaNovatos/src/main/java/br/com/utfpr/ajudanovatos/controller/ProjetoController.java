/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.utfpr.ajudanovatos.utils.SendMailController;
import br.com.utfpr.ajudanovatos.utils.UploadImagem;
import Dados_Globais.Dados;
import Dao.especificos.DaoProjeto;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import static br.com.caelum.vraptor.view.Results.json;
import br.com.utfpr.ajudanovatos.projeto.Projeto;
import br.com.utfpr.ajudanovatos.entidade.usuario.UsuarioLogado;
import br.com.utfpr.ajudanovatos.projeto.Logotipo;
import br.com.utfpr.ajudanovatos.projeto.beans.ProjetoBean;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.HibernateException;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class ProjetoController {

    @Inject
    private Result result;
    @Inject
    private DaoProjeto dao;
    @Inject
    private UsuarioLogado usuario;
    @Inject
    private Validator validator;
    @Inject
    private Dados dados;
    @Inject
    UploadImagem upload;
    @Inject
    SendMailController sendMail;
    @Inject
    HttpServletRequest request;

    @Get(value = {"pt/novo/projeto", "en/new/project"})
    public void formulario(){
        this.validator.addIf(!this.usuario.isLogado(), new I18nMessage("login", "login.necessario"));
        this.validator.onErrorForwardTo(UsuarioController.class).login();
    }

    @Get(value = {"pt/projeto", "en/project"})
    public void projeto(Long id){
        Projeto p = this.dao.getPorId(id);
        this.result.include("projeto", p);
    }

    @Post(value = {"pt/salvar/projeto", "en/save/project"})
    public void salvar(Projeto projeto, Logotipo logo){
        Long i = null;
        if (projeto.getId()==null) {
            this.validator.addIf(this.dao.seProjetoExiste(projeto.getNome()), new I18nMessage("error", "projeto.existente"));
            this.validator.onErrorForwardTo(this).formulario();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); //você pode usar outras máscaras 
            String data = sdf.format(new Date());
            projeto.setDataCriacao(data);
        } else {
            i = projeto.getId();
        }
        String nomeProjeto = projeto.getNome();
        try {
            String logotipo;
            if (logo.getArquivo()!=null) {
                logotipo = gravarImagem(nomeProjeto, logo.getArquivo());
            } else {
                logotipo = "default.jpg";
            }
           
            ProjetoBean pb = new ProjetoBean();
            pb.setNome(nomeProjeto);
            pb.setLogotipo(logotipo);
            
            projeto.setUsuario(this.usuario.getId());
            projeto.setLogotipo(logotipo);

            this.dao.persiste(projeto);
            this.result.include("nomeprojeto", nomeProjeto);
            if (i!=null) {
                pb.setId(projeto.getId());
            }
            this.dados.setProjetoAntigo(pb);
            this.dados.setProjetoRecente(pb);
            this.result.redirectTo(UsuarioController.class).meusProjetos();
        } catch (HibernateException e) {
            this.result.redirectTo(this).formulario();
        }
    }

    public String gravarImagem(String nomeprojeto, UploadedFile imagem){
        String type = imagem.getContentType();
        String ext = type.substring(type.lastIndexOf("/")+1);
        String logolabel = nomeprojeto+"."+ext;

        if (this.upload.gravarImagem(imagem, logolabel)) {
            return logolabel;
        }
        return null;
    }

    @Get(value = {"pt/editar/projeto", "en/edit/project"})
    public void alterar(Long id){
        Projeto p = this.dao.getPorId(id);
        this.result.include("projeto", p);
        this.result.of(this).formulario();
    }

    @Delete(value = {"pt/remove/projeto", "en/remove/project"})
    public void remover(Projeto projeto){
        try {
            this.dao.delete(projeto);
            this.result.include("msg", "Projeto removido com sucesso!");
        } catch (Exception e) {
            this.result.include("msg", "Erro ao tentar remover projeto");
        } finally {
            this.result.forwardTo(UsuarioController.class).meusProjetos();
        }
    }

    @Get(value = {"pt/projetos/lista", "en/projects/list"})
    public void projetos(){
        List<Projeto> lista = this.dao.lista();
        this.result.include("projetos", lista);
    }

    @Get(value = {"/pt/lista/projetos/linguagem", "en/list/projects/language"})
    public void listProjetosLinguagem(String q){
        List lista = this.dao.getProjetoLinguagem(q);
        this.result.include("projetos", lista);
        this.result.forwardTo(this).projetos();
    }

    @Get(value = {"pt/projeto/nome", "en/project/name"})
    public void projetoPorNome(String projeto){
        Projeto proj = this.dao.buscaPorNome(projeto);
        this.result.include("projeto", proj);
    }

    @Get("/paginacao.json")
    public void paginacao(){
        List list = this.dao.getPaginacao(1, 10, false);
        this.result.use(json()).from(list).serialize();
    }

    @Get("/projetos.json")
    public void listProjetosJson(String trecho){
        if (trecho!=null) {
            List list = this.dao.pesquisarTrechoJson(trecho);
            this.result.use(json()).from(list).serialize();
        }
    }

    @Get("/upload/form")
    public void uploadImagem(){
    }

}
