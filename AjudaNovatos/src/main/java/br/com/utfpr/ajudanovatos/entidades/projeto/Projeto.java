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
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
@Table(name = "projeto")
public class Projeto implements Serializable {

    @Id
    @GeneratedValue
    private Long id;
    @Column(columnDefinition = "MEDIUMTEXT")
    private String name, html_url, description, homepage_url, download_url, medium_logo_url, small_logo_url;
    private String created_at;
    private Long usuario = null;
    private String main_language_name;
    private int user_count, total_contributor_count, total_commit_count, total_code_lines;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "projeto")
    private List<Contribuinte> contribuintes = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "projeto")
    private List<AtividadeMensal> atividade_mensal = new ArrayList<>();

    //@OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    //private NivelAtividade nivel_de_atividade;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "projeto")
    private List<Licenca> licencas = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "projeto")
    private List<Link> links = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "projeto")
    private List<Linguagem> linguagens = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "projeto")
    private List<Plataforma> plataformas = new ArrayList<>();

    @OneToMany(targetEntity = Repositorio.class, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "projeto")
    private List<Repositorio> repositorios = new ArrayList<>();

    @OneToOne(targetEntity = Como_Iniciar.class, cascade = CascadeType.ALL, orphanRemoval = true)
    private Como_Iniciar comoIniciar;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Comunicacao comunicacao;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Configurar_Workspace configurarWorkspace;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Entendendo_Codigo entendendoCodigo;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Requisito requisito;

    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    private Submeter_Mudanca submeterMudanca;

    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getHtml_url(){
        return html_url;
    }

    public void setHtml_url(String html_url){
        this.html_url = html_url;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public String getHomepage_url(){
        return homepage_url;
    }

    public void setHomepage_url(String homepage_url){
        this.homepage_url = homepage_url;
    }

    public String getDownload_url(){
        return download_url;
    }

    public void setDownload_url(String download_url){
        this.download_url = download_url;
    }

    public String getMedium_logo_url(){
        return medium_logo_url;
    }

    public void setMedium_logo_url(String medium_logo_url){
        this.medium_logo_url = medium_logo_url;
    }

    public String getSmall_logo_url(){
        return small_logo_url;
    }

    public void setSmall_logo_url(String small_logo_url){
        this.small_logo_url = small_logo_url;
    }

    public String getCreated_at(){
        return created_at;
    }

    public void setCreated_at(String created_at){
        this.created_at = created_at;
    }

    public List<Licenca> getLicencas(){
        return licencas;
    }

    public void setLicencas(List<Licenca> licencas){
        this.licencas = licencas;
    }

    public List<Link> getLinks(){
        return links;
    }

    public void setLinks(List<Link> links){
        this.links = links;
    }

    public Long getUsuario(){
        return usuario;
    }

    public void setUsuario(Long usuario){
        this.usuario = usuario;
    }

    public List<Linguagem> getLinguagens(){
        return linguagens;
    }

    public void setLinguagens(List<Linguagem> linguagens){
        this.linguagens = linguagens;
    }

    public List<Plataforma> getPlataformas(){
        return plataformas;
    }

    public void setPlataformas(List<Plataforma> plataformas){
        this.plataformas = plataformas;
    }

    public Como_Iniciar getComoIniciar(){
        return comoIniciar;
    }

    public void setComoIniciar(Como_Iniciar comoIniciar){
        this.comoIniciar = comoIniciar;
    }

    public Comunicacao getComunicacao(){
        return comunicacao;
    }

    public void setComunicacao(Comunicacao comunicacao){
        this.comunicacao = comunicacao;
    }

    public Configurar_Workspace getConfigurarWorkspace(){
        return configurarWorkspace;
    }

    public void setConfigurarWorkspace(Configurar_Workspace configurarWorkspace){
        this.configurarWorkspace = configurarWorkspace;
    }

    public Entendendo_Codigo getEntendendoCodigo(){
        return entendendoCodigo;
    }

    public void setEntendendoCodigo(Entendendo_Codigo entendendoCodigo){
        this.entendendoCodigo = entendendoCodigo;
    }

    public Requisito getRequisito(){
        return requisito;
    }

    public void setRequisito(Requisito requisito){
        this.requisito = requisito;
    }

    public Submeter_Mudanca getSubmeterMudanca(){
        return submeterMudanca;
    }

    public void setSubmeterMudanca(Submeter_Mudanca submeterMudanca){
        this.submeterMudanca = submeterMudanca;
    }

    public void setLinguagem(Linguagem linguagem){
        this.linguagens.add(linguagem);
    }

    public void setLicenca(Licenca licenca){
        this.licencas.add(licenca);
    }

    public void setLink(Link link){
        this.links.add(link);
    }

    public List<Repositorio> getRepositorios(){
        return this.repositorios;
    }

    public void setRepositorio(List<Repositorio> repositorios){
        this.repositorios = repositorios;
    }

    public void setRepositorio(Repositorio repositorio){
        this.repositorios.add(repositorio);
    }

    public String getLinguagensArray(){
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i<this.linguagens.size(); i++) {
            Linguagem l = this.linguagens.get(i);
            sb.append("['").append(l.getTexto().trim()).append("',").append(l.getPercentage());
            if (this.linguagens.size()==i+1) {
                sb.append("]");
            } else {
                sb.append("],");
            }
        }
        return sb.toString();
    }

    public int getUser_count(){
        return user_count;
    }

    public void setUser_count(int user_count){
        this.user_count = user_count;
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
/*
    public NivelAtividade getNivel_de_atividade(){
        return nivel_de_atividade;
    }
    public void setNivel_de_atividade(NivelAtividade nivel_de_atividade){
        this.nivel_de_atividade = nivel_de_atividade;
    }
*/

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
        System.out.println("linhas adicionadas "+sb.toString());
        return sb.toString();
    }

    public String getComentariosAdicionados(){
        StringBuilder sb = new StringBuilder();
        for (AtividadeMensal a : this.atividade_mensal) {
            sb.append("[Date.UTC(").append(a.getMes().substring(6)).append(",").append(a.getMes().substring(3, 5)).append("),").append(a.getComments_added()).append("],");
        }
        System.out.println("comentarios "+sb.toString());
        return sb.toString();
    }

    public String getLinhasEmBranco(){
        StringBuilder sb = new StringBuilder();
        for (AtividadeMensal a : this.atividade_mensal) {
            sb.append("[Date.UTC(").append(a.getMes().substring(6)).append(",").append(a.getMes().substring(3, 5)).append("),").append(a.getBlanks_added()).append("],");
        }
        System.out.println("linhas em branco "+sb.toString());
        return sb.toString();
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
}
