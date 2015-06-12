/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import java.util.List;
import org.hibernate.HibernateException;

/**
 * @author Tiago Luiz Gomes
 * @param <T>
 */
public interface Dao<T> {

    public T getPorId(Long id) throws HibernateException;

    public boolean deletePorId(String classe, Long id) throws HibernateException;

    public boolean delete(T o) throws HibernateException;

    public List<T> lista() throws HibernateException;

    public void persiste(T o) throws HibernateException;

}
