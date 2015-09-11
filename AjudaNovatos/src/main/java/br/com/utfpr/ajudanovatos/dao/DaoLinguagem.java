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
import org.hibernate.criterion.Projections;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoLinguagem extends DaoBasic<Linguagem> {

    @Inject
    public DaoLinguagem(Session s){
        session = s;
        classe = Linguagem.class;
    }

    public List listLinguagens() throws HibernateException{
        Criteria c = session.createCriteria(Linguagem.class);
        c.setProjection(Projections.distinct(Projections.property("texto")));
        c.setMaxResults(10);
        return c.list();
    }

    public List listLinguagensId(Long id) throws HibernateException{
        SQLQuery c = session.createSQLQuery("select texto, id from linguagem where projeto="+id);
        return c.list();
    }
}
