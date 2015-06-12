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

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
public class AtividadeMensal implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private String mes;
    private int code_added, code_removed, comments_added, comments_removed, blanks_added, blanks_removed, commits, contributors;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public String getMes(){
        return mes;
    }

    public void setMes(String mes){
        this.mes = mes;
    }

    public int getCode_added(){
        return code_added;
    }

    public void setCode_added(int code_added){
        this.code_added = code_added;
    }

    public int getCode_removed(){
        return code_removed;
    }

    public void setCode_removed(int code_removed){
        this.code_removed = code_removed;
    }

    public int getComments_added(){
        return comments_added;
    }

    public void setComments_added(int comments_added){
        this.comments_added = comments_added;
    }

    public int getComments_removed(){
        return comments_removed;
    }

    public void setComments_removed(int comments_removed){
        this.comments_removed = comments_removed;
    }

    public int getBlanks_added(){
        return blanks_added;
    }

    public void setBlanks_added(int blanks_added){
        this.blanks_added = blanks_added;
    }

    public int getBlanks_removed(){
        return blanks_removed;
    }

    public void setBlanks_removed(int blanks_removed){
        this.blanks_removed = blanks_removed;
    }

    public int getCommits(){
        return commits;
    }

    public void setCommits(int commits){
        this.commits = commits;
    }

    public int getContributors(){
        return contributors;
    }

    public void setContributors(int contributors){
        this.contributors = contributors;
    }

}
