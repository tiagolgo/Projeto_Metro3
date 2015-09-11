/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.utfpr.ajudanovatos.utils.upload.UploadImagem;
import br.com.utfpr.ajudanovatos.utils.dados_globais.Dados;
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
import br.com.utfpr.ajudanovatos.utils.estatisticas.EstatisticasOpenHub;
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
    private EstatisticasOpenHub estatisticas;

    @Get(value = {"pt/novo/projeto", "en/new/project"})
    public void formulario(){
        this.validator.addIf(!this.usuario.isLogado(), new I18nMessage("login", "login.necessario"));
        this.validator.onErrorForwardTo(UsuarioController.class).login();
    }

    @Get(value = {"pt/visualizar/projeto", "en/show/project"})
    public void retorna(Long id){
        Projeto p = (Projeto) this.dao.getProjetoId(id);
        this.result.include("projeto", p);
        this.result.forwardTo(this).projeto();
    }

    public void projeto(){
    }

    public void projetos(){
    }

    @Post(value = {"pt/salvar/projeto", "en/save/project"})
    public void salvar(Projeto projeto, Logotipo logo){
        projeto.setAtividade_mensal(this.estatisticas.getAtividade_mensal());
        projeto.setContribuintes(this.estatisticas.getContribuintes());
//        projeto.setNivel_de_atividade(this.estatisticas.getNivel_de_atividade());
        projeto.setTotal_code_lines(this.estatisticas.getTotal_code_lines());
        projeto.setTotal_commit_count(this.estatisticas.getTotal_commit_count());
        projeto.setTotal_contributor_count(this.estatisticas.getTotal_contributor_count());
        projeto.setMain_language_name(this.estatisticas.getMain_language_name());
        projeto.setUser_count(this.estatisticas.getUser_count());

        projeto.setUsuario(this.usuario.getId());
        if (projeto.getId()==null) {
            this.dao.persiste(projeto);
        } else {
            this.dao.atualiza(projeto);
        }
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
        this.estatisticas.setAtividade_mensal(p.getAtividade_mensal());
        this.estatisticas.setContribuintes(p.getContribuintes());
        this.estatisticas.setMain_language_name(p.getMain_language_name());
        //this.estatisticas.setNivel_de_atividade(p.getNivel_de_atividade());
        this.estatisticas.setTotal_code_lines(p.getTotal_code_lines());
        this.estatisticas.setTotal_commit_count(p.getTotal_commit_count());
        this.estatisticas.setTotal_contributor_count(p.getTotal_contributor_count());
        this.estatisticas.setUser_count(p.getUser_count());
        this.result.include("projeto", p);
        this.result.of(this).formulario();
    }

    @Post(value = {"pt/remove/projeto", "en/remove/project"})
    public void remover(Long id){
        this.dao.delete(this.dao.getPorId(id));
        this.result.redirectTo(UsuarioController.class).meusProjetos();
    }

    @Get(value = {"pt/projetos/lista", "en/projects/list"})
    public void listaProjetos(){
        List<Projeto> lista = this.dao.lista();
        this.result.include("projetos", lista);
        this.result.forwardTo(this).projetos();
    }

    @Get(value = {"/pt/lista/projetos/linguagem", "en/list/projects/language"})
    public void listProjetosLinguagem(String q){
        List lista = this.dao.getProjetoLinguagem(q.trim());
        this.result.include("projetos", lista).forwardTo(this).projetos();
    }

    @Get(value = {"pt/projeto/nome", "en/project/name"})
    public void projetoPorNome(String projeto){
        Projeto proj = this.dao.buscaPorNome(projeto);
        this.result.include("projeto", proj);
        this.result.forwardTo(this).projeto();
    }

    @Get("/paginacao.json")
    public void paginacao(){
        this.result.use(json()).from(this.dao.getPaginacao(1, 10, false)).serialize();
    }

    @Get("/projetos.json")
    public void listProjetosJson(String trecho){
        if (trecho!=null) {
            this.result.use(json()).from(this.dao.pesquisarTrechoJson(trecho)).serialize();
        }
    }

    @Get("/upload/form")
    public void uploadImagem(){
    }

    @Get("/ifProjetoExiste.json")
    public void projetoExisteJson(String nome){
        this.result.use(json()).from(this.dao.seProjetoExiste(nome), "existe").serialize();
    }
    
    @Get("/carregarDados")
    public void carregarDadosOpenHub(){}
}
