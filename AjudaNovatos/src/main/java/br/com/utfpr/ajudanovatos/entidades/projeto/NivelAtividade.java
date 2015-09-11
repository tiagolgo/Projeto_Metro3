/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.entidades.projeto;

import java.io.Serializable;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author Tiago Luiz Gomes
 */
//@Entity
//@Table(name = "nivelatividade")
public class NivelAtividade implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private int valor;
    private String description;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public int getValor(){
        return valor;
    }

    public void setValor(int valor){
        this.valor = valor;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

}
