/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template arquivo, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.beans;

import br.com.caelum.vraptor.observer.upload.UploadedFile;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class Logotipo {
    UploadedFile arquivo = null;
    public UploadedFile getArquivo(){return arquivo;}
    public void setArquivo(UploadedFile arquivo){this.arquivo = arquivo;}
}
