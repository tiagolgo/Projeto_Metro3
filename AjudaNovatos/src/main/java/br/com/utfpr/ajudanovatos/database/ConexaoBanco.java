/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.database;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
public class ConexaoBanco {

    private SessionFactory factory = null;

    @Produces
    @ApplicationScoped
    public SessionFactory ConexaoBanco(){
        if (this.factory==null) {
            Configuration configuration = new Configuration().configure();
            /*
             configuration.addAnnotatedClass(Projeto.class);
             configuration.addAnnotatedClass(Senha.class);
             configuration.addAnnotatedClass(Usuario.class);
             configuration.addAnnotatedClass(Comentario.class);
             configuration.addAnnotatedClass(Linguagem.class);
             configuration.addAnnotatedClass(Plataforma.class);
             configuration.addAnnotatedClass(Repositorio.class);
             configuration.addAnnotatedClass(Como_Iniciar.class);
             configuration.addAnnotatedClass(Comunicacao.class);
             configuration.addAnnotatedClass(Configurar_Workspace.class);
             configuration.addAnnotatedClass(Entendendo_Codigo.class);
             configuration.addAnnotatedClass(Requisito.class);
             configuration.addAnnotatedClass(Submeter_Mudanca.class);
             configuration.addAnnotatedClass(Chat_Irc.class);
             configuration.addAnnotatedClass(Encontrar_Mentor.class);
             configuration.addAnnotatedClass(Feed.class);
             configuration.addAnnotatedClass(Fluxo_Contribuicao.class);
             configuration.addAnnotatedClass(Lista_Discussao.class);
             configuration.addAnnotatedClass(Pesquisar_Antes.class);
             configuration.addAnnotatedClass(Tarefa_Facil.class);
             */
            //new SchemaExport(configuration).create(true, true); 
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            this.factory = configuration.buildSessionFactory(serviceRegistry);
        }
        return this.factory;
    }

    public void fechaConexao(@Disposes SessionFactory factory){
        factory.close();
    }
}
