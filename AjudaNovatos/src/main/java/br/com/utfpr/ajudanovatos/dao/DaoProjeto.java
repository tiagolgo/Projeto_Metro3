/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.dao;

import br.com.utfpr.ajudanovatos.entidades.projeto.Projeto;
import br.com.utfpr.ajudanovatos.beans.ProjetoBean;
import br.com.utfpr.ajudanovatos.utils.estatisticas.EstatisticasOpenHub;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoProjeto extends DaoBasic<Projeto> {

    @Inject
    public DaoProjeto(Session sessao){
        session = sessao;
        classe = Projeto.class;
    }

    public List listPropriedadesProjetos() throws HibernateException{
        Criteria cri = session.createCriteria(classe);
        ProjectionList prolist = Projections.projectionList();
        prolist.add(Projections.property("name"));
        prolist.add(Projections.property("homepage_url"));
        prolist.add(Projections.property("codFonte"));
        prolist.add(Projections.property("gestorBug"));
        cri.setProjection(prolist);
        List list = cri.list();
        return list;
    }

    public List getPaginacao(int inicial, int maximo, boolean ordenar) throws HibernateException{
        Criteria c = session.createCriteria(Projeto.class);
        ProjectionList prolist = Projections.projectionList();
        prolist.add(Projections.property("id"), "id");
        prolist.add(Projections.property("name"), "name");
        prolist.add(Projections.property("small_logo_url"), "small_logo_url");
        c.setProjection(prolist);
        if (ordenar) {
            c.addOrder(Order.desc("created_at"));
        }
        c.setFirstResult(inicial);
        c.setMaxResults(maximo);
        c.setResultTransformer(Transformers.aliasToBean(ProjetoBean.class));
        List r = c.list();
        session.flush();
        return r;
    }

    public List listProjetos(String trecho) throws HibernateException{
        Criteria c = session.createCriteria(classe);
        c.add(Restrictions.ilike("name", trecho, MatchMode.START));
        return c.list();
    }

    public Projeto buscaPorNome(String nomeProjeto) throws HibernateException{
        Criteria c = session.createCriteria(classe);
        c.add(Restrictions.eq("name", nomeProjeto));
        return (Projeto) c.uniqueResult();
    }

    public List pesquisarTrechoJson(String trecho) throws HibernateException{
        SQLQuery c = session.createSQLQuery("select id, name from projeto where name like '"+trecho+"%'");
        return c.list();
    }

    public List getProjetoLinguagem(String linguagem) throws HibernateException{
        Criteria c1 = session.createCriteria(classe);
        Criteria c2 = c1.createCriteria("linguagens");
        c2.add(Restrictions.eq("texto", linguagem));
        List list = c1.list();
        return list;
    }

    public Object projetoCount() throws HibernateException{
        Criteria c = session.createCriteria(classe);
        c.setProjection(Projections.rowCount());
        return c.uniqueResult();
    }

    public boolean seProjetoExiste(String nome) throws HibernateException{
        SQLQuery c = session.createSQLQuery("select id from projeto where name='"+nome+"';");
        return c.uniqueResult()!=null;
    }

    public Object getProjetoId(Long id) throws HibernateException{
        SQLQuery c = session.createSQLQuery("select*from projeto where id="+id).addEntity(Projeto.class);
        return c.uniqueResult();
    }

    public void persisteLogo(String logo, String projeto) throws HibernateException{
        SQLQuery c = session.createSQLQuery("update projeto set logo='"+logo+"' where name='"+projeto+"';");
        c.executeUpdate();
        session.beginTransaction().commit();
        session.flush();
    }

    public Object getEstatisticaProjeto(Long id) throws HibernateException{
        SQLQuery c = session.createSQLQuery("select*from estatisticasopenhub where id_projeto="+id).addEntity(EstatisticasOpenHub.class);
        return c.uniqueResult();
    }

    public List retornaNomeProjetos(){
        Criteria c1 = session.createCriteria(Projeto.class);
        c1.setProjection(Projections.property("name"));
        List list = c1.list();
        return list;
    }
}
