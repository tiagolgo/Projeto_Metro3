/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import br.com.utfpr.ajudanovatos.entidades.projeto.Linguagem;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoLinguagem extends Dao_Basic<Linguagem> {

    @Inject
    public DaoLinguagem(Session s){
        session = s;
        classe = Linguagem.class;
    }

    public List listLinguagens() throws HibernateException{
        Criteria c = session.createCriteria(classe);
        return c.list();
    }

    public List listLinguagensId(Long id) throws HibernateException{
        //Criteria c = session.createCriteria(classe);
        SQLQuery c = session.createSQLQuery("select texto, id from linguagem where projeto="+id);
        return c.list();
    }

}
