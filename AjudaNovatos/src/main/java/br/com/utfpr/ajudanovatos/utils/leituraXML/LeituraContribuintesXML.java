/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils.leituraXML;

import br.com.utfpr.ajudanovatos.entidades.projeto.Contribuinte;
import br.com.utfpr.ajudanovatos.utils.estatisticas.EstatisticasOpenHub;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.ApplicationScoped;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
public class LeituraContribuintesXML extends DefaultHandler {

    private final List<Contribuinte> contribuicoes = new ArrayList<>();private Contribuinte contribuicao; private String valorAtual;private EstatisticasOpenHub estatisticas;

    public void setEstatisticas(EstatisticasOpenHub estatisticas){this.estatisticas = estatisticas;}

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException{switch (qName) {case "contributor_fact":contribuicao = new Contribuinte();break;}}

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException{this.valorAtual = String.copyValueOf(ch, start, length).trim();}

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException{
        switch (qName) {
            case "contributor_id":this.contribuicao.setContributor_id(Long.parseLong(this.valorAtual));break;
            case "contributor_name":this.contribuicao.setContributor_name(this.valorAtual);break;
            case "primary_language_nice_name":this.contribuicao.setPrimary_language_nice_name(this.valorAtual);break;
            case "first_commit_time":this.contribuicao.setFirst_commit_time(parseData());break;
            case "last_commit_time":this.contribuicao.setLast_commit_time(parseData());break;
            case "man_months":this.contribuicao.setMan_months(Integer.parseInt(this.valorAtual));break;
            case "commits":this.contribuicao.setCommits(Integer.parseInt(this.valorAtual));break;
            case "contributor_fact":this.contribuicoes.add(contribuicao);break;
        }
    }

    private String parseData(){
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'");
        try {String f = DateFormat.getDateInstance(DateFormat.DEFAULT).format(ft.parse(this.valorAtual));return f;
        } catch (ParseException ex) {Logger.getLogger(LeituraContribuintesXML.class.getName()).log(Level.SEVERE, null, ex);return null;}
    }

    @Override
    public void endDocument() throws SAXException{this.estatisticas.setContribuintes(contribuicoes);}

}
