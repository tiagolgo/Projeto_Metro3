/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils.leituraXML;

import br.com.utfpr.ajudanovatos.entidades.projeto.AtividadeMensal;
import br.com.utfpr.ajudanovatos.utils.estatisticas.EstatisticasOpenHub;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class LeituraAtividadeMensalXML extends DefaultHandler {

    private final List<AtividadeMensal> atividades = new ArrayList<>();
    private AtividadeMensal atividade;
    private String valorAtual;
    private EstatisticasOpenHub estatisticas;

    public void setEstatisticas(EstatisticasOpenHub estatisticas){
        this.estatisticas = estatisticas;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException{
        switch (qName) {
            case "activity_fact": this.atividade = new AtividadeMensal();
                break;
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException{
        this.valorAtual = String.copyValueOf(ch, start, length).trim();
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException{
        switch (qName) {
            case "month": this.atividade.setMes(parseData());
                break;
            case "code_added": this.atividade.setCode_added(Integer.parseInt(this.valorAtual));
                break;
            case "comments_added": this.atividade.setComments_added(Integer.parseInt(this.valorAtual));
                break;
            case "blanks_added": this.atividade.setBlanks_added(Integer.parseInt(this.valorAtual));
                break;
            case "commits": this.atividade.setCommits(Integer.parseInt(this.valorAtual));
                break;
            case "contributors": this.atividade.setContributors(Integer.parseInt(this.valorAtual));
                break;
            case "activity_fact": this.atividades.add(atividade);
                break;
        }
    }

    private String parseData(){
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'");
        try {
            String f = DateFormat.getDateInstance(DateFormat.DEFAULT).format(ft.parse(this.valorAtual));
            return f;
        } catch (ParseException ex) {
            Logger.getLogger(LeituraContribuintesXML.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    public void endDocument() throws SAXException{
        this.estatisticas.setAtividade_mensal(atividades);
    }

}
