/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 * @author Tiago Luiz Gomes
 * @param <T>
 */
public class DaoBasic<T> implements Dao<T> {

    protected static Class classe;
    protected static Session session;

    @Override
    public void persiste(T o) throws HibernateException{
        try {
            session.persist(o);
            session.beginTransaction().commit();
            session.flush();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    public void atualiza(T o) throws HibernateException{
        Transaction tr = session.beginTransaction();
        session.update(o);
        tr.commit();
    }

    @Override
    public T getPorId(Long id) throws HibernateException{
        return (T) session.createCriteria(classe).add(Restrictions.eq("id", id)).uniqueResult();
    }

    @Override
    public boolean delete(T o) throws HibernateException{
        try {
            session.delete(o);
            session.beginTransaction().commit();
            //session.flush();
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public List<T> lista() throws HibernateException{
        try {
            Criteria c = session.createCriteria(classe);
            List list = c.list();
            return list;
        } catch (HibernateException e) {
            return null;
        }
    }

    @Override
    public boolean deletePorId(String classe, Long id) throws HibernateException{
        try {
            SQLQuery q = session.createSQLQuery("delete from "+classe+" where id = "+id);
            q.executeUpdate();
            session.beginTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
