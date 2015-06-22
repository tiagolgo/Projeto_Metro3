/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils.leituraXML;

import br.com.utfpr.ajudanovatos.utils.estatisticas.EstatisticasOpenHub;
import br.com.utfpr.ajudanovatos.entidades.projeto.Projeto;
import br.com.utfpr.ajudanovatos.entidades.projeto.Licenca;
import br.com.utfpr.ajudanovatos.entidades.projeto.Link;
import br.com.utfpr.ajudanovatos.entidades.projeto.NivelAtividade;
import br.com.utfpr.ajudanovatos.entidades.projeto.Linguagem;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class LeituraProjetoXML extends DefaultHandler {

    private Projeto projeto;
    private Linguagem linguagem;
    private Licenca licenca;
    private Link link;
    private String elementoPai, valorAtual;
    private EstatisticasOpenHub estatisticas;

    public void setProjeto(Projeto projeto){
        this.projeto = projeto;
    }

    public void setEstatisticas(EstatisticasOpenHub estatisticas){
        this.estatisticas = estatisticas;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attr) throws SAXException{

        switch (qName) {
            case "project": elementoPai = qName;
                break;
            case "analysis":
                elementoPai = qName;
                break;
            case "licenses": elementoPai = qName;
                break;
            case "license": licenca = new Licenca();
                break;
            case "project_activity_index": this.estatisticas.setNivel_de_atividade(new NivelAtividade());
                elementoPai = qName;
                break;
            case "links": elementoPai = qName;
                break;
            case "link": link = new Link();
                break;
            case "language": linguagem = new Linguagem();
                for (int i = 0; i<attr.getLength(); i++) {
                    switch (attr.getQName(i)) {
                        case "percentage": String perc = attr.getValue(i);
                            linguagem.setPercentage(Integer.parseInt(perc));
                            break;
                    }
                }
                break;
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException{
        valorAtual = String.copyValueOf(ch, start, length).trim();
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException{
        if (this.elementoPai!=null) {
            switch (this.elementoPai) {
                //se o elemento pai for project
                case "project":
                    switch (qName) {
                        case "name": this.projeto.setName(valorAtual);
                            break;
                        case "html_url": this.projeto.setHtml_url(valorAtual);
                            break;
                        case "created_at":
                            this.projeto.setCreated_at(parseData());
                            break;
                        case "description": this.projeto.setDescription(this.valorAtual);
                            break;
                        case "homepage_url": this.projeto.setHomepage_url(valorAtual);
                            break;
                        case "download_url": this.projeto.setDownload_url(valorAtual);
                            break;
                        case "medium_logo_url": this.projeto.setMedium_logo_url(valorAtual);
                            break;
                        case "small_logo_url": this.projeto.setSmall_logo_url(valorAtual);
                            break;
                        case "user_count": this.estatisticas.setUser_count(Integer.parseInt(valorAtual));
                            break;
                    }
                    break;

                // se o elemento pai atual for..
                case "analysis": switch (qName) {
                    case "total_contributor_count": this.estatisticas.setTotal_contributor_count(Integer.parseInt(this.valorAtual));
                        break;
                    case "total_commit_count": this.estatisticas.setTotal_commit_count(Integer.parseInt(this.valorAtual));
                        break;
                    case "total_code_lines": this.estatisticas.setTotal_code_lines(Integer.parseInt(this.valorAtual));
                        break;
                    case "main_language_name": this.estatisticas.setMain_language_name(this.valorAtual);
                        break;
                    case "language": this.linguagem.setTexto(this.valorAtual);
                        this.projeto.setLinguagem(linguagem);
                        break;
                }
                    break;

                // se o elemento pai for licenses
                case "licenses":
                    switch (qName) {
                        case "name": this.licenca.setName(this.valorAtual);
                            break;
                        case "nice_name": this.licenca.setNice_name(this.valorAtual);
                            break;
                        case "license": this.projeto.setLicenca(licenca);
                            break;
                    }
                    break;

                // se o elemento pai for project_activity_index
                case "project_activity_index":
                    switch (qName) {
                        case "value": this.estatisticas.getNivel_de_atividade().setValor(Integer.parseInt(this.valorAtual));
                            break;
                        case "description": this.estatisticas.getNivel_de_atividade().setDescription(this.valorAtual);
                            break;
                    }
                    break;

                //se o elemento pai for links
                case "links":
                    switch (qName) {
                        case "title": this.link.setTitle(this.valorAtual);
                            break;
                        case "url": this.link.setUrl(this.valorAtual);
                            break;
                        case "category": this.link.setCategory(this.valorAtual);
                            break;
                        case "link": this.projeto.setLink(link);
                            break;
                    }
                    break;
            }
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
}
