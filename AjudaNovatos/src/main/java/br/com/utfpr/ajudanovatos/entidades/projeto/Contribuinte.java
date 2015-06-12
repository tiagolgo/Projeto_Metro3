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
public class Contribuinte implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private long contributor_id, primary_language_id;
    private String contributor_name, primary_language_nice_name, comment_ratio;
    private int man_months, commits;
    private String first_commit_time, last_commit_time;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public long getContributor_id(){
        return contributor_id;
    }

    public void setContributor_id(long contributor_id){
        this.contributor_id = contributor_id;
    }

    public long getPrimary_language_id(){
        return primary_language_id;
    }

    public void setPrimary_language_id(long primary_language_id){
        this.primary_language_id = primary_language_id;
    }

    public String getContributor_name(){
        return contributor_name;
    }

    public void setContributor_name(String contributor_name){
        this.contributor_name = contributor_name;
    }

    public String getPrimary_language_nice_name(){
        return primary_language_nice_name;
    }

    public void setPrimary_language_nice_name(String primary_language_nice_name){
        this.primary_language_nice_name = primary_language_nice_name;
    }

    public String getComment_ratio(){
        return comment_ratio;
    }

    public void setComment_ratio(String comment_ratio){
        this.comment_ratio = comment_ratio;
    }

    public int getMan_months(){
        return man_months;
    }

    public void setMan_months(int man_months){
        this.man_months = man_months;
    }

    public int getCommits(){
        return commits;
    }

    public void setCommits(int commits){
        this.commits = commits;
    }

    public String getFirst_commit_time(){
        return first_commit_time;
    }

    public void setFirst_commit_time(String first_commit_time){
        this.first_commit_time = first_commit_time;
    }

    public String getLast_commit_time(){
        return last_commit_time;
    }

    public void setLast_commit_time(String last_commit_time){
        this.last_commit_time = last_commit_time;
    }

}
