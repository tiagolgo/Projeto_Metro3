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
@Table(name="como_iniciar")
public class Como_Iniciar implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    @OneToOne(targetEntity = Fluxo_Contribuicao.class,cascade = CascadeType.ALL,orphanRemoval = true)
    private Fluxo_Contribuicao fluxo;
    
    @OneToOne(targetEntity = Tarefa_Facil.class,cascade = CascadeType.ALL,orphanRemoval = true)
    private Tarefa_Facil tarefaFacil;

    @OneToOne(targetEntity = Encontrar_Mentor.class,cascade = CascadeType.ALL,orphanRemoval = true)
    private Encontrar_Mentor mentor;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public Fluxo_Contribuicao getFluxo(){
        return fluxo;
    }

    public void setFluxo(Fluxo_Contribuicao fluxo){
        this.fluxo = fluxo;
    }

    public Tarefa_Facil getTarefaFacil(){
        return tarefaFacil;
    }

    public void setTarefaFacil(Tarefa_Facil tarefaFacil){
        this.tarefaFacil = tarefaFacil;
    }

    public Encontrar_Mentor getMentor(){
        return mentor;
    }

    public void setMentor(Encontrar_Mentor mentor){
        this.mentor = mentor;
    }

}
