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
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
public class EstatisticasOpenHub implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private long id_projeto;
    private int user_count, rating_count, review_count;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "estatisticas")
    private List<Contribuinte> contribuintes = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "estatisticas")
    private List<AtividadeMensal> atividade_mensal = new ArrayList<>();

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "analise")
    private Analise analise;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private NivelAtividade nivel_de_atividade;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public long getId_projeto(){
        return id_projeto;
    }

    public void setId_projeto(long id_projeto){
        this.id_projeto = id_projeto;
    }

    public int getUser_count(){
        return user_count;
    }

    public void setUser_count(int user_count){
        this.user_count = user_count;
    }

    public int getRating_count(){
        return rating_count;
    }

    public void setRating_count(int rating_count){
        this.rating_count = rating_count;
    }

    public int getReview_count(){
        return review_count;
    }

    public void setReview_count(int review_count){
        this.review_count = review_count;
    }

    public List<Contribuinte> getContribuintes(){
        return contribuintes;
    }

    public void setContribuintes(List<Contribuinte> contribuintes){
        this.contribuintes = contribuintes;
    }

    public List<AtividadeMensal> getAtividade_mensal(){
        return atividade_mensal;
    }

    public void setAtividade_mensal(List<AtividadeMensal> atividade_mensal){
        this.atividade_mensal = atividade_mensal;
    }

    public Analise getAnalise(){
        return analise;
    }

    public void setAnalise(Analise analise){
        this.analise = analise;
    }

    public NivelAtividade getNivel_de_atividade(){
        return nivel_de_atividade;
    }

    public void setNivel_de_atividade(NivelAtividade nivel_de_atividade){
        this.nivel_de_atividade = nivel_de_atividade;
    }

    public String dadosCommitsMensais(){
        //List<AtividadeMensalBean> am = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        int t = this.atividade_mensal.size();

        for (int i = 0; i<t; i++) {
            AtividadeMensal a = this.atividade_mensal.get(i);
            sb.append(a.getCommits()).append(",");
        }
        return sb.toString();
    }

    public String dadosContribuintesMensais(){
        StringBuilder sb = new StringBuilder();
        for (AtividadeMensal a : this.atividade_mensal) {
            sb.append("[Date.UTC(").append(a.getMes().substring(6)).append(",").append(a.getMes().substring(3, 5)).append("),").append(a.getContributors()).append("],");
        }
        return sb.toString();
    }

    public String getLinhasAdicionadas(){
        StringBuilder sb = new StringBuilder();
        for (AtividadeMensal a : this.atividade_mensal) {
            sb.append("[Date.UTC(").append(a.getMes().substring(6)).append(",").append(a.getMes().substring(3, 5)).append("),").append(a.getCode_added()).append("],");
        }
        return sb.toString();
    }

    public String getComentariosAdicionados(){
        StringBuilder sb = new StringBuilder();
        for (AtividadeMensal a : this.atividade_mensal) {
            sb.append("[Date.UTC(").append(a.getMes().substring(6)).append(",").append(a.getMes().substring(3, 5)).append("),").append(a.getComments_added()).append("],");
        }
        return sb.toString();
    }

    public String getLinhasEmBranco(){
        StringBuilder sb = new StringBuilder();
        for (AtividadeMensal a : this.atividade_mensal) {
            sb.append("[Date.UTC(").append(a.getMes().substring(6)).append(",").append(a.getMes().substring(3, 5)).append("),").append(a.getBlanks_added()).append("],");
        }
        return sb.toString();
    }

}
