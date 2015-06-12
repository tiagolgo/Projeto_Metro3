/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.utfpr.ajudanovatos.utils.upload.UploadImagem;
import br.com.utfpr.ajudanovatos.utils.dados_globais.Dados;
import br.com.utfpr.ajudanovatos.dao.DaoEstatisticasOpenHub;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import static br.com.caelum.vraptor.view.Results.json;
import br.com.utfpr.ajudanovatos.dao.DaoProjeto;
import br.com.utfpr.ajudanovatos.entidades.projeto.Projeto;
import br.com.utfpr.ajudanovatos.utils.usuario.UsuarioLogado;
import br.com.utfpr.ajudanovatos.beans.Logotipo;
import br.com.utfpr.ajudanovatos.utils.estatisticas.ContainerEstatisticas;
import br.com.utfpr.ajudanovatos.entidades.projeto.EstatisticasOpenHub;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class ProjetoController {

    @Inject
    private Result result;
    @Inject DaoEstatisticasOpenHub de;
    @Inject
    private UsuarioLogado usuario;
    @Inject
    private Validator validator;
    @Inject
    private DaoProjeto dao;
    @Inject
    private Dados dados;
    @Inject
    UploadImagem upload;
    @Inject
    private ContainerEstatisticas estatisticas;

    @Get(value = {"pt/novo/projeto", "en/new/project"})
    public void formulario(){
        this.validator.addIf(!this.usuario.isLogado(), new I18nMessage("login", "login.necessario"));
        this.validator.onErrorForwardTo(UsuarioController.class).login();
    }

    @Get(value = {"pt/visualizar/projeto", "en/show/project"})
    public void retorna(Long id){
        Projeto p = (Projeto) this.dao.getProjetoId(id);
        EstatisticasOpenHub estatisticaProjeto = (EstatisticasOpenHub) this.dao.getEstatisticaProjeto(p.getId_estatistica_open_hub());
        this.estatisticas.setEstatisticasOpenHub(estatisticaProjeto);
        this.result.include("projeto", p);
        this.result.forwardTo(this).projeto();
    }

    public void projeto(){
    }

    @Post(value = {"pt/salvar/projeto", "en/save/project"})
    public void salvar(Projeto projeto, Logotipo logo){

        de.persiste(this.estatisticas.getEstatisticasOpenHub());
        long id_projeto = this.estatisticas.getEstatisticasOpenHub().getId_projeto();
        projeto.setId_estatistica_open_hub(id_projeto);
        projeto.setUsuario(this.usuario.getId());
        this.dao.persiste(projeto);
        this.validator.onErrorUse(Results.page()).of(ProjetoController.class).formulario();
        this.result.redirectTo(UsuarioController.class).meusProjetos();
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

    @Post(value = {"pt/remove/projeto", "en/remove/project"})
    public void remover(Long id){
        Projeto p = this.dao.getPorId(id);
        this.dao.delete(p);
        this.dados.removeProjetos(p.getName());
        this.dados.removeLinguagem(p.getLinguagens());
        this.result.forwardTo(UsuarioController.class).meusProjetos();

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

    @Get("/ifProjetoExiste.json")
    public void projetoExisteJson(String nome){
        boolean existe = this.dao.seProjetoExiste(nome);
        this.result.use(json()).from(existe,"existe").serialize();
    }
}


