/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils.leituraXML;

import br.com.utfpr.ajudanovatos.entidades.projeto.Projeto;
import br.com.utfpr.ajudanovatos.entidades.projeto.Repositorio;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class LeituraRepositoriosXML extends DefaultHandler {

    private Projeto projeto;
    private Repositorio repositorio;
    private String valorAtual;

    public void setProjeto(Projeto projeto){
        this.projeto = projeto;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException{
        switch (qName) {
            case "repository": this.repositorio = new Repositorio();
                break;
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException{
        valorAtual = String.copyValueOf(ch, start, length).trim();
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException{
        switch (qName) {
            case "type": this.repositorio.setTipo(this.valorAtual);
                break;
            case "url": this.repositorio.setUrl(this.valorAtual);
                break;
            case "commits": this.repositorio.setCommits(Long.parseLong(this.valorAtual));
                break;
            case "repository": this.projeto.setRepositorio(this.repositorio);
                break;
        }
    }

}
