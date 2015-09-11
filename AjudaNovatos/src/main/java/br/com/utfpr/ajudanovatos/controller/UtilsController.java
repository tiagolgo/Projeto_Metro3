/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.utfpr.ajudanovatos.utils.dados_globais.Dados;
import br.com.utfpr.ajudanovatos.dao.DaoProjeto;
import br.com.utfpr.ajudanovatos.utils.upload.UploadImagem;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.utfpr.ajudanovatos.utils.estatisticas.EstatisticasOpenHub;
import br.com.utfpr.ajudanovatos.entidades.projeto.Projeto;
import br.com.utfpr.ajudanovatos.utils.leituraXML.LeituraAtividadeMensalXML;
import br.com.utfpr.ajudanovatos.utils.leituraXML.LeituraContribuintesXML;
import br.com.utfpr.ajudanovatos.utils.leituraXML.LeituraProjetoXML;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import javax.inject.Inject;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.hibernate.HibernateException;
import org.xml.sax.SAXException;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class UtilsController {

    @Inject
    UploadImagem upload;
    @Inject
    Result result;
    @Inject
    DaoProjeto dao;
    @Inject
    Dados dados;
    @Inject
    LeituraProjetoXML lerXmlProjeto;
    @Inject
    Projeto projeto;
    @Inject
    EstatisticasOpenHub estatisticasOpenHub;

    @Get("/removeLinguagem")
    public void removeLinguagem(Long id){
        if (this.dao.deletePorId("linguagem", id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Get("/removePlataforma")
    public void removePlataforma(Long id){
        if (this.dao.deletePorId("plataforma", id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Get("/removeLink")
    public void removeLink(Long id){
        if (this.dao.deletePorId("link", id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Get("/removeFeed")
    public void removeFeed(Long id){
        if (this.dao.deletePorId("feed", id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Post("/uploadImagem")
    public void salvaImagem(UploadedFile imagem, String nomeprojeto){
        String type = imagem.getContentType();
        String ext = type.substring(type.lastIndexOf("/")+1);
        String logolabel = nomeprojeto+"."+ext;
        if (this.upload.gravarImagem(imagem, logolabel)) {
            try {
                this.dao.persisteLogo(logolabel, nomeprojeto);
                this.result.redirectTo(IndexController.class).index();
            } catch (HibernateException e) {
                this.result.include("nomeprojeto", nomeprojeto);
                this.result.forwardTo(ProjetoController.class).uploadImagem();
            }
        }
    }

    @Path("/enviarEmail")
    public void enviarMail(){
    }

    @Path("/buscarDadosProjeto")
    public void buscarDadosOpenHub(String nome) throws SAXException, IOException, ParserConfigurationException{
        try {
            SAXParser parser = SAXParserFactory.newInstance().newSAXParser();
            String nomeMin = nome.toLowerCase();
            parserDadosProjeto(parser, nomeMin);
            parserAtividadeMensal(parser, nomeMin);
           // parserDadosContribuintes(parser, nomeMin);

            this.result.include("projeto", this.projeto);
            this.result.forwardTo(ProjetoController.class).formulario();
        } catch (Exception e) {
            String msg = "Ocorreu um erro ao tentar carregar dados.<br/>Pode ser que o nome do projeto não esteja igual ao do OpenHub.<br/>O nome informado foi: "+nome;
            this.result.include("err", msg);
            this.result.forwardTo(ProjetoController.class).carregarDadosOpenHub();
        }
    }

    private void parserDadosProjeto(SAXParser parser, String nome) throws SAXException, IOException{
        InputStream is = new URL("https://www.openhub.net/projects/"+nome+".xml?api_key=c297cd3c8b637249f380c520ac861245a4c7eb03c2b8f423b281918cbe2723ae").openStream();
        LeituraProjetoXML lp = new LeituraProjetoXML();
        lp.setEstatisticas(estatisticasOpenHub);
        lp.setProjeto(projeto);
        parser.parse(is, lp);
        is.close();
    }

    private void parserAtividadeMensal(SAXParser parser, String nome) throws SAXException, IOException{
        InputStream is = new URL("https://www.openhub.net/projects/"+nome+"/analyses/latest/activity_facts.xml?api_key=c297cd3c8b637249f380c520ac861245a4c7eb03c2b8f423b281918cbe2723ae").openStream();
        LeituraAtividadeMensalXML la = new LeituraAtividadeMensalXML();
        la.setEstatisticas(estatisticasOpenHub);
        parser.parse(is, la);
        is.close();
    }

    private void parserDadosContribuintes(SAXParser parser, String nome) throws SAXException, IOException{
        InputStream is = new URL("https://www.openhub.net/projects/"+nome+"/contributors.xml?api_key=c297cd3c8b637249f380c520ac861245a4c7eb03c2b8f423b281918cbe2723ae").openStream();
        LeituraContribuintesXML lc = new LeituraContribuintesXML();
        lc.setEstatisticas(estatisticasOpenHub);
        parser.parse(is, lc);
        is.close();
    }
    /*
     private void parserDados(SAXParser parser, InputStream stream) throws SAXException, IOException{
     LeituraContribuintesXML lc = new LeituraContribuintesXML();
     lc.setEstatisticas(estatisticasOpenHub);
     parser.parse(stream, lc);
     stream.close();
     }
     */
}
