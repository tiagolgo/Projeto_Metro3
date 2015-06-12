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
    private Dados informacoes;

    @Path(value = {"/"})
    public void index() {
        if (!this.informacoes.isAtualizado()) {
            this.informacoes.setAtualizado(true);
            this.informacoes.setLinguagens(this.dp.listLinguagens());
            this.informacoes.setProjetosAntigo(this.dp.getPaginacao(0, 10, false));
            this.informacoes.setProjetosRecente(this.dp.getPaginacao(0, 10, true));
        }
    }
}
