/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils.dados_globais;

import br.com.utfpr.ajudanovatos.beans.LinguagemBean;
import br.com.utfpr.ajudanovatos.entidades.projeto.Linguagem;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;

/**
 *
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
@Named("informacoesProjetos")
public class Dados {

    private List<Linguagem> linguagens = new ArrayList<>();
    private List<Object> nomes=new ArrayList<>();
    private final HashMap<String, Integer> totais = new HashMap<>();

    public List<Object> getNomes(){
        return nomes;
    }

    public void setNomes(List<Object> nomes){
        this.nomes = nomes;
    }

    public List getLinguagens(){
        return linguagens;
    }

    public void setLinguagens(List<Linguagem> langs){
        /*for (Linguagem lang : langs) {
            if (!totais.containsKey(lang.getTexto())) {//nao contem
                totais.put(lang.getTexto(), 1);
            } else {//ja contem
                int t = totais.get(lang.getTexto())+1;
                totais.put(lang.getTexto(), t);
            }
        }
        this.linguagens.clear();
        for (Map.Entry<String, Integer> entrySet : totais.entrySet()) {
            LinguagemBean lb = new LinguagemBean();
            lb.setTexto(entrySet.getKey());
            lb.setQuantidade(entrySet.getValue());
            this.linguagens.add(lb);
        }*/
    
        this.linguagens=langs;
    }

    
    public HashMap<String, Integer> getTotais(){
        return totais;
    }

   /* public void removeLinguagem(List<Linguagem> langs){
        for (Linguagem lang : langs) {
            if (totais.containsKey(lang.getTexto())) {
                if (totais.get(lang.getTexto())-1==0) {
                    totais.remove(lang.getTexto());
                } else {
                    int t = totais.get(lang.getTexto())-1;
                    totais.put(lang.getTexto(), t);
                }
            }
        }
        this.linguagens.clear();
        for (Map.Entry<String, Integer> entrySet : totais.entrySet()) {
            LinguagemBean lb = new LinguagemBean();
            lb.setTexto(entrySet.getKey());
            lb.setQuantidade(entrySet.getValue());
            this.linguagens.add(lb);
        }
    }*/

}
