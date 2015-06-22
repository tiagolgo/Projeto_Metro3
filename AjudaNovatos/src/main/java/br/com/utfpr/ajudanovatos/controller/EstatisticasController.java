/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.utfpr.ajudanovatos.dao.DaoLinguagem;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.utfpr.ajudanovatos.entidades.projeto.Contribuinte;
import br.com.utfpr.ajudanovatos.utils.estatisticas.EstatisticasOpenHub;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class EstatisticasController {

    @Inject
    DaoLinguagem de;
    @Inject
    Result result;
    @Inject
    EstatisticasOpenHub estatisticas;

    @Get("/linguagem_estatisticas.json")
    public void linguagemPercentage(Long id){
        
        List list = this.de.listLinguagensId(id);
        this.result.use(Results.json()).withoutRoot().from(list).serialize();
    }
    
    @Get("/dadosUsuario.json")
    public void getDadosUsuario(int id){
        Contribuinte retorno = null;
        for(Contribuinte c: this.estatisticas.getContribuintes()){
            if(c.getId()==id){
                retorno=c;
                break;
            }
        }
        this.result.use(Results.json()).withoutRoot().from(retorno).serialize();
    }
}
