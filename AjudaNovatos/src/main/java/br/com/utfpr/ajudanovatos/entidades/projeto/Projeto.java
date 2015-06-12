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

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
public class Projeto implements Serializable {

    @Id
    @GeneratedValue
    private Long id;
    @Column(columnDefinition = "MEDIUMTEXT")
    private String name, html_url, description, homepage_url, download_url, medium_logo_url, small_logo_url;
    private String created_at;
    private Long usuario = null, id_estatistica_open_hub;

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
    @JoinColumn(name="projeto")
    private List<Repositorio> repositorios=new ArrayList<>();

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

    public Long getId_estatistica_open_hub(){
        return id_estatistica_open_hub;
    }

    public void setId_estatistica_open_hub(Long id_estatistica_open_hub){
        this.id_estatistica_open_hub = id_estatistica_open_hub;
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
}
