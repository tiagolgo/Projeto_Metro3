/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.entidades.projeto;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
@Table(name="comunicacao")
public class Comunicacao implements Serializable {

    @Id
    @GeneratedValue
    private Long id;
    @OneToOne(targetEntity = Pesquisar_Antes.class, cascade = CascadeType.ALL, orphanRemoval = true)
    private Pesquisar_Antes pesquisa;
    @OneToOne(targetEntity = Chat_Irc.class, cascade = CascadeType.ALL, orphanRemoval = true)
    private Chat_Irc irc;
    @OneToOne(targetEntity = Lista_Discussao.class, cascade = CascadeType.ALL, orphanRemoval = true)
    private Lista_Discussao lista;

    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public Pesquisar_Antes getPesquisa(){
        return pesquisa;
    }

    public void setPesquisa(Pesquisar_Antes pesquisa){
        this.pesquisa = pesquisa;
    }

    public Chat_Irc getIrc(){
        return irc;
    }

    public void setIrc(Chat_Irc irc){
        this.irc = irc;
    }

    public Lista_Discussao getLista(){
        return lista;
    }

    public void setLista(Lista_Discussao lista){
        this.lista = lista;
    }

}
