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
public class Analise implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    //private long main_language_id;
    private String url, main_language_name;
    private String logged_at, min_month, max_month;
    private int twelve_month_contributor_count, total_contributor_count, twelve_month_commit_count, total_commit_count, total_code_lines;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public String getUrl(){
        return url;
    }

    public void setUrl(String url){
        this.url = url;
    }

    public String getMain_language_name(){
        return main_language_name;
    }

    public void setMain_language_name(String main_language_name){
        this.main_language_name = main_language_name;
    }

    public String getLogged_at(){
        return logged_at;
    }

    public void setLogged_at(String logged_at){
        this.logged_at = logged_at;
    }

    public String getMin_month(){
        return min_month;
    }

    public void setMin_month(String min_month){
        this.min_month = min_month;
    }

    public String getMax_month(){
        return max_month;
    }

    public void setMax_month(String max_month){
        this.max_month = max_month;
    }

    public int getTwelve_month_contributor_count(){
        return twelve_month_contributor_count;
    }

    public void setTwelve_month_contributor_count(int twelve_month_contributor_count){
        this.twelve_month_contributor_count = twelve_month_contributor_count;
    }

    public int getTotal_contributor_count(){
        return total_contributor_count;
    }

    public void setTotal_contributor_count(int total_contributor_count){
        this.total_contributor_count = total_contributor_count;
    }

    public int getTwelve_month_commit_count(){
        return twelve_month_commit_count;
    }

    public void setTwelve_month_commit_count(int twelve_month_commit_count){
        this.twelve_month_commit_count = twelve_month_commit_count;
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
