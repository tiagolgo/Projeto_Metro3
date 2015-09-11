/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import br.com.utfpr.ajudanovatos.entidades.usuario.Usuario;
import br.com.utfpr.ajudanovatos.entidades.projeto.Projeto;
import javax.inject.Inject;
import org.hibernate.Session;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoUtils extends DaoBasic<Projeto> {

    @Inject
    public DaoUtils(Session sessao){
        session = sessao;
        classe = Usuario.class;
    }
}
