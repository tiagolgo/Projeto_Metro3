/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.entidades.projeto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
@Table(name = "lista_discussao")
public class Lista_Discussao implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    @Column(columnDefinition = "MEDIUMTEXT")
    private String subscricao, informacao;
    private String link;
    @OneToMany(targetEntity = Comentario.class, cascade = CascadeType.REMOVE, orphanRemoval = true)
    @JoinColumn(name = "lista", updatable = false)
    private List<Comentario> comentarios = new ArrayList<>();

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public String getSubscricao(){
        return subscricao;
    }

    public void setSubscricao(String subscricao){
        this.subscricao = subscricao;
    }

    public String getInformacao(){
        return informacao;
    }

    public void setInformacao(String informacao){
        this.informacao = informacao;
    }

    public List<Comentario> getComentarios(){
        return comentarios;
    }

    public void setComentarios(List<Comentario> comentarios){
        this.comentarios = comentarios;
    }

    public String getLink(){
        return link;
    }

    public void setLink(String link){
        this.link = link;
    }

}
