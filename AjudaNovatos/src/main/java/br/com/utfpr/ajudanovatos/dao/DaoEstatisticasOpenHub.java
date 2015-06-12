/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import br.com.utfpr.ajudanovatos.entidades.projeto.EstatisticasOpenHub;
import javax.inject.Inject;
import org.hibernate.Session;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoEstatisticasOpenHub extends Dao_Basic<EstatisticasOpenHub> {

    @Inject
    public DaoEstatisticasOpenHub(Session sessao){
        session = sessao;
        classe = EstatisticasOpenHub.class;
    }

}
