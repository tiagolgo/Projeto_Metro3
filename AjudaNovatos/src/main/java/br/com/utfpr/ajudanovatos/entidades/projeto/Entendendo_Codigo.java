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
@Table(name="entendendo_codigo")
public class Entendendo_Codigo implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    @Column(columnDefinition = "MEDIUMTEXT")
    private String documentacao;
    @OneToMany(targetEntity = Comentario.class,cascade = CascadeType.REMOVE,orphanRemoval = true)
    @JoinColumn(name = "codigo", updatable = false)
    private List<Comentario> comentarios = new ArrayList<>();

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public String getDocumentacao(){
        return documentacao;
    }

    public void setDocumentacao(String documentacao){
        this.documentacao = documentacao;
    }

    public List<Comentario> getComentarios(){
        return comentarios;
    }

    public void setComentarios(List<Comentario> comentarios){
        this.comentarios = comentarios;
    }

}
