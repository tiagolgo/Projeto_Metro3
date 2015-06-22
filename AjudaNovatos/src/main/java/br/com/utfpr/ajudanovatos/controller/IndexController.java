/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.utfpr.ajudanovatos.utils.dados_globais.Dados;
import br.com.utfpr.ajudanovatos.dao.DaoProjeto;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.utfpr.ajudanovatos.dao.DaoLinguagem;
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class IndexController {

    @Inject
    private DaoProjeto dp;
    @Inject
    private DaoLinguagem dl;
    @Inject
    private Dados informacoes;
    @Inject
    private Result result;

    @Path(value = {"/"})
    public void index(){
        this.informacoes.setLinguagens(this.dl.listLinguagens());
        this.informacoes.setNomes(this.dp.retornaNomeProjetos());
        this.result.include("projetosIndex",this.dp.getPaginacao(0, 10, false));
    }
}
