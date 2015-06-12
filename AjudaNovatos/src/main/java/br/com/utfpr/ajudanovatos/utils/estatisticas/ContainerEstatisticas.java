/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils.estatisticas;

import br.com.utfpr.ajudanovatos.entidades.projeto.EstatisticasOpenHub;
import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author Tiago Luiz Gomes
 */
@SessionScoped
@Named("container_estatisticas")
public class ContainerEstatisticas implements Serializable {

    @Inject
    EstatisticasOpenHub estatisticasOpenHub;

    public EstatisticasOpenHub getEstatisticasOpenHub(){
        return estatisticasOpenHub;
    }

    public void setEstatisticasOpenHub(EstatisticasOpenHub estatisticasOpenHub){
        this.estatisticasOpenHub = estatisticasOpenHub;
    }

}
