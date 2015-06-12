/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.beans;

import java.io.Serializable;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class AtividadeMensalBean implements Serializable{
    private String data;
    private int valor;

    public String getData(){
        return data;
    }

    public void setData(String data){
        this.data = data;
    }

    public int getValor(){
        return valor;
    }

    public void setValor(int valor){
        this.valor = valor;
    }
    
    
}
