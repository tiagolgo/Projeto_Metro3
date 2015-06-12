/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils.leituraXML;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DadosSobreContribuintes_XML extends DefaultHandler {

    StringBuffer valor_atual=new StringBuffer(100);

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException{
        super.startElement(uri, localName, qName, attributes); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException{
        super.characters(ch, start, length); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException{
        super.endElement(uri, localName, qName); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void endDocument() throws SAXException{
        super.endDocument(); //To change body of generated methods, choose Tools | Templates.
    }

}
