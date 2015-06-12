/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 * @author Tiago Luiz Gomes
 * @param <T>
 */
public class Dao_Basic<T> implements Dao<T> {

    protected static Class classe;
    protected static Session session;

    @Override
    public void persiste(T o) throws HibernateException{
        Transaction tr = null;
        try {
            tr = session.beginTransaction();
            session.saveOrUpdate(o);
            session.flush();
            tr.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            if (tr!=null) {
                tr.rollback();
            }
        }
    }

    @Override
    public T getPorId(Long id) throws HibernateException{
        return (T) session.createCriteria(classe).add(Restrictions.eq("id", id)).uniqueResult();
    }

    @Override
    public boolean delete(T o) throws HibernateException{
        Transaction tr=null;
        try {
            tr=session.beginTransaction();
            session.delete(o);
            session.flush();
            tr.commit();
            return true;
        } catch (HibernateException e) {
            session.beginTransaction().rollback();
            System.out.println(e.getCause());
            return false;
        }
    }

    @Override
    public List<T> lista() throws HibernateException{
        try {
            return session.createCriteria(classe).list();
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
            session.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
