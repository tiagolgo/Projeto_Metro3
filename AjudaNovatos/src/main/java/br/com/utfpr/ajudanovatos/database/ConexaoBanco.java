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
            configuration.addAnnotatedClass(Senha.class);
            configuration.addAnnotatedClass(Usuario.class);
            configuration.addAnnotatedClass(Projeto.class);
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
            configuration.addAnnotatedClass(Fluxo_Contribuicao.class);
            configuration.addAnnotatedClass(Lista_Discussao.class);
            configuration.addAnnotatedClass(Pesquisar_Antes.class);
            configuration.addAnnotatedClass(Tarefa_Facil.class);
            configuration.addAnnotatedClass(Feed.class);
            configuration.addAnnotatedClass(AtividadeMensal.class);
            configuration.addAnnotatedClass(Contribuinte.class);
            configuration.addAnnotatedClass(Licenca.class);
            configuration.addAnnotatedClass(Link.class);
            configuration.addAnnotatedClass(NivelAtividade.class);
*/
            /*
             <mapping class="br.com.utfpr.ajudanovatos.entidades.usuario.Senha" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.usuario.Usuario" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Projeto" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Comentario" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Linguagem" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Plataforma" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Repositorio" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Como_Iniciar" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Comunicacao" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Configurar_Workspace" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Entendendo_Codigo" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Requisito" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Submeter_Mudanca" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Chat_Irc" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Encontrar_Mentor" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Fluxo_Contribuicao" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Lista_Discussao" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Pesquisar_Antes" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Tarefa_Facil" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Feed" />
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.AtividadeMensal"/>
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Contribuinte"/>
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Licenca"/>
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.Link"/>
             <mapping class="br.com.utfpr.ajudanovatos.entidades.projeto.NivelAtividade"/>
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
