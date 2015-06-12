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
public class ProjetoBean implements Serializable {

    private long id;
    private String name, small_logo_url;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getSmall_logo_url(){
        return small_logo_url;
    }

    public void setSmall_logo_url(String small_logo_url){
        this.small_logo_url = small_logo_url;
    }

}
