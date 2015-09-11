/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import br.com.utfpr.ajudanovatos.entidades.projeto.Comentario;
import javax.inject.Inject;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoComentario extends DaoBasic<Comentario> {

    @Inject
    public DaoComentario(Session sessao) {
        session = sessao;
        classe = Comentario.class;
    }

    public boolean salvar(Long id, String alvo, String autor, String texto, String data, int nota) throws HibernateException{
        StringBuilder sb = new StringBuilder();
        sb.append("insert into comentario (autor, dataComentario, texto, nota,").append(alvo).append(") values ('").append(autor).append("','").append(data).append("','").append(texto).append("',").append(nota).append(",").append(id).append(")");
        String sql = sb.toString();
        try {
            SQLQuery query = session.createSQLQuery(sql);
            query.executeUpdate();
            session.beginTransaction().commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
