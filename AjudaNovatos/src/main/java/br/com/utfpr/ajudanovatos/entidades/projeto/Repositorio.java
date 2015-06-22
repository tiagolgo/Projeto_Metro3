/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.entidades.projeto;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
@Table(name = "repositorio")
public class Repositorio implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private String tipo, url;
    private long commits;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public String getTipo(){
        return tipo;
    }

    public void setTipo(String tipo){
        this.tipo = tipo;
    }

    public String getUrl(){
        return url;
    }

    public void setUrl(String url){
        this.url = url;
    }

    public long getCommits(){
        return commits;
    }

    public void setCommits(long commits){
        this.commits = commits;
    }

}
