/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils.estatisticas;

import br.com.utfpr.ajudanovatos.entidades.projeto.AtividadeMensal;
import br.com.utfpr.ajudanovatos.entidades.projeto.Contribuinte;
import br.com.utfpr.ajudanovatos.entidades.projeto.NivelAtividade;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author Tiago Luiz Gomes
 */
@SessionScoped
@Named("container_estatisticas")
public class EstatisticasOpenHub implements Serializable {

    private int user_count;
    private List<Contribuinte> contribuintes = new ArrayList<>();
    private List<AtividadeMensal> atividade_mensal = new ArrayList<>();
    private NivelAtividade nivel_de_atividade;
    private String main_language_name;
    private int total_contributor_count, total_commit_count, total_code_lines;

    public int getUser_count(){
        return user_count;
    }

    public void setUser_count(int user_count){
        this.user_count = user_count;
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

    public NivelAtividade getNivel_de_atividade(){
        return nivel_de_atividade;
    }

    public void setNivel_de_atividade(NivelAtividade nivel_de_atividade){
        this.nivel_de_atividade = nivel_de_atividade;
    }

    public String getMain_language_name(){
        return main_language_name;
    }

    public void setMain_language_name(String main_language_name){
        this.main_language_name = main_language_name;
    }

    public int getTotal_contributor_count(){
        return total_contributor_count;
    }

    public void setTotal_contributor_count(int total_contributor_count){
        this.total_contributor_count = total_contributor_count;
    }

    public int getTotal_commit_count(){
        return total_commit_count;
    }

    public void setTotal_commit_count(int total_commit_count){
        this.total_commit_count = total_commit_count;
    }

    public int getTotal_code_lines(){
        return total_code_lines;
    }

    public void setTotal_code_lines(int total_code_lines){
        this.total_code_lines = total_code_lines;
    }

}
