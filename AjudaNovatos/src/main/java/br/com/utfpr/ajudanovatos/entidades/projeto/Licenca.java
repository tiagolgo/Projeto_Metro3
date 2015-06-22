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
@Table(name = "licenca")
public class Licenca implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private String name, nice_name;

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

    public String getNice_name(){
        return nice_name;
    }

    public void setNice_name(String nice_name){
        this.nice_name = nice_name;
    }

}
