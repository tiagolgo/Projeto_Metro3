/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import br.com.utfpr.ajudanovatos.entidades.usuario.Usuario;
import java.io.Serializable;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoUsuario extends DaoBasic<Usuario> {

    @Inject
    public DaoUsuario(Session sessao){
        session = sessao;
        classe = Usuario.class;
    }
    
    public Serializable salvarUsuario(Usuario usuario){
        Transaction tr = session.beginTransaction();
        Serializable id = session.save(usuario);
        tr.commit();
        return id;
    }

    public Usuario usuarioAutenticado(String email, String senha){
        try {
            Criteria c = session.createCriteria(Usuario.class);
            c.add(Restrictions.eq("email", email));
            Criteria c2 = c.createCriteria("password");
            c2.add(Restrictions.eq("senha", senha));
            return (Usuario) c.uniqueResult();
        } catch (HibernateException e) {
            return null;
        }
    }

    public List usuarioProjetos(Long id) throws HibernateException{
        SQLQuery c = session.createSQLQuery("select id, name, medium_logo_url, created_at from projeto where usuario="+id);
        List list = c.list();
        return list;
    }

    public boolean seUsuarioExiste(String email){
        Criteria c = session.createCriteria(classe);
        c.add(Restrictions.eq("email", email));
        Object r = c.uniqueResult();
        return r!=null;
    }

}
