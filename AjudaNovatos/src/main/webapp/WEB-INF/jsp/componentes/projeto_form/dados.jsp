<%-- 
    Document   : novo
    Created on : 15/11/2014, 20:02:39
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<input type="hidden" name="projeto.dataCriacao" value="${projeto.dataCriacao}"/>

<div class="grid">
    <div class="row cells2">
        <div class="cell">
            <div class="row">
                <label class="text-bold">Nome:</label>
                <div class="input-control text full-size" data-role="input">
                    <input id="dados-nome" name="projeto.nome" type="text" placeholder="Nome do projeto" value="${projeto.nome}">
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>                                 
            </div>   
            <div class="row">
                <label class="text-bold">Página do Projeto:</label>
                <div class="input-control text full-size" data-role="input">
                    <input id="dados-site" name="projeto.site" type="text" placeholder="Site do projeto" value="${projeto.site}">
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>          
            </div>          
            <div class="row">
                <input type="hidden" name="projeto.repositorio.id" value="${projeto.repositorio.id}"/>
                <div class="grid">
                    <label class="text-bold">Repositorio:</label>
                    <div class="row cells4">
                        <div class="cell">
                            <div class="input-control select" data-role="input">
                                <select id="repos" name="projeto.repositorio.tipo" style="width: 115px">
                                    <option>-</option>
                                    <option value="git" ${projeto.repositorio.tipo eq 'git' ? 'selected':''}>Git</option>
                                    <option value="subversion" ${projeto.repositorio.tipo eq 'subversion' ? 'selected':''}>Subversion</option>
                                    <option value="cvs" ${projeto.repositorio.tipo eq 'cvs' ? 'selected':''}>CVS</option>
                                    <option value="mercurial" ${projeto.repositorio.tipo eq 'mercurial' ? 'selected':''}>Mercurial</option>
                                    <option value="bazaar" ${projeto.repositorio.tipo eq 'bazaar' ? 'selected':''}>Bazaar</option>
                                    <option value="outro" ${projeto.repositorio.tipo eq 'outro' ? 'selected':''}>Outro</option>
                                </select>
                            </div>
                        </div>
                        <div class="cell colspan3">
                            <div class="input-control text full-size" data-role="input">
                                <input id="dados-codigoFonte" name="projeto.repositorio.link" placeholder="Endereco do repositório" value="${projeto.repositorio.link}" disabled/>
                                <button class="button helper-button clear"><span class="mif-cross"></span></button>
                            </div> 
                        </div> 
                    </div> 
                </div> 
            </div> 
            <div class="row">
                <label class="text-bold border-top">Gestor de bug:</label>
                <div class="input-control text full-size" data-role="input">
                    <input id="dados-gestorBug" name="projeto.gestorBug" type="text" placeholder="Gestor de bug" value="${projeto.gestorBug}">
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>
            </div>

            <div class="row">
                <label class="text-bold">O projeto está disponível no OpenHub?</label>
                <label class="input-control radio">
                    <input type="radio" name="projeto.openHub" ${projeto.openHub eq true ? 'checked':''} />
                    <span class="check"></span>
                    <span class="caption">Sim</span>
                </label>
                <label class="input-control radio">
                    <input type="radio" name="projeto.openHub" ${projeto.openHub eq false ? 'checked':''}/>
                    <span class="check"></span>
                    <span class="caption">Não</span>
                </label>
            </div>  
            <div class="row">
                <label class="text-bold">Wiki do Projeto:</label>
                <div class="input-control text full-size" data-role="input">
                    <input id="dados-gestorBug" name="projeto.wiki" type="text" placeholder="Wiki do Projeto" value="${projeto.wiki}"/>
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>                                     
            </div>                                     
            <div class="row">
                <label class="text-bold">Lista de discussão</label>
                <div class="input-control text full-size">
                    <input type="text" placeholder="Endereco da Lista de discussão" id="end_lista" name="projeto.listaDiscussao" value="${projeto.listaDiscussao}"/>
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>
            </div>
            <div class="row">
                <label class="text-bold">Linguagem:</label>
                <div class="input-control select full-size" data-role="input">
                    <select id="lang">
                        <option></option>
                        <option value="Java">Java</option>
                        <option value="Php">Php</option>
                        <option value="Python">Python</option>
                        <option value="C++">C++</option>
                        <option value="Ruby">Ruby</option>
                        <option value="JavaScript">JavaScript</option>
                        <option value="C#">C#</option>
                        <option value="C">C</option>
                        <option value="Perl">Perl</option>
                        <option value="Go">Go</option>
                        <option value="Haskell">Haskell</option>
                        <option value="Skala">Skala</option>
                        <option value="Objective-C">Objective-C</option>
                        <option value="Clojure">Clojure</option>
                        <option value="Bash">Bash</option>
                        <option value="Lua">Lua</option>
                        <option value="Tcl">Tcl</option>
                        <option value="Xml">Xml</option>
                        <option value="Html">Html</option>
                        <option value="Outra">Outra</option>
                    </select>
                    <a class="button" id="add_linguagem"><span class="mif-plus"></span></a>
                </div>
                <h6>Linguagens</h6>
                <table class="table hovered" id="tab_linguagem">
                    <tbody>
                        <c:forEach var="lang" items="${projeto.linguagens}" varStatus="cont">
                            <tr>
                                <td>
                                    <input type="hidden" value="${lang.id}" name="projeto.linguagens[${cont.count-1}].id"/>
                                    <input type="hidden" value="${lang.texto}" name="projeto.linguagens[${cont.count-1}].texto"/>
                                    ${lang.texto}                                                               
                                </td>
                                <td>
                                    <button type="button" value='${lang.id}' class='bg-red mini fg-white' onclick="removeObjetos('dfsd', '/AjudaNovatos/removeLinguagem');">Remover</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <label class="text-bold">Plataforma:</label>
                <div class="input-control select full-size">
                    <select id="plat">
                        <option></option>
                        <option value="Linux">Linux</option>
                        <option value="Windows">Windows</option>
                        <option value="IOS">IOS</option>
                        <option value="Android">Android</option>
                        <option value="Windows Phone">Windows Phone</option>
                        <option value="Outra">Outra</option>
                    </select>
                    <a class="button" id="add_plataforma" ><span class="mif-plus"></span></a>
                </div>
                <h6>Plataformas</h6>
                <table class="table hovered border-left" id="tab_plataforma">
                    <tbody>
                        <c:forEach var="plataforma" items="${projeto.plataformas}" varStatus="cont">
                            <tr>
                                <td>
                                    <input type="hidden" value="${plataforma.id}" name="projeto.plataformas[${cont.count-1}].id"/>
                                    <input type="hidden" value="${plataforma.texto}" name="projeto.plataformas[${cont.count-1}].texto"/>
                                    ${plataforma.texto}
                                </td>
                                <td>
                                    <button type='button' value='${plataforma.id}' class='bg-red mini fg-white' onclick="removeObjetos(this, '/AjudaNovatos/removePlataforma');">Remover</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>  
        </div>
        <div class="cell">
            <div class="row">
                <label class="text-bold">Descrição do projeto</label>
                <div class="input-control textarea full-size" data-role="input-control">
                    <textarea id="dados-descricao" name="projeto.descricao" style="height: 360px">${projeto.descricao}</textarea>
                </div> 
            </div> 
            <div class="row">
                <label class="text-bold">Logo do Projeto</label>
                <div class="span7 text-center" style="height: 250px;border: 1px solid lightgray;text-align: center">
                    <img width="40%" src="<c:url value="/images/logo/"/>${projeto.logotipo eq null ? 'default.jpg':projeto.logotipo} " id="logotipo"/>
                </div>
                <!-- <input type="file" name="logo.arquivo" value="" id="setlogo"/>-->
                <label class="text-info text-italic fg-blue">Selecione uma imagem</label>
                <div class="input-control file full-size" data-role="input">
                    <button class="button" ><span class="mif-folder"></span></button>
                    <input type="file" name="logo.arquivo" id="setlogo" value="Selecione uma imagem"/>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("#setlogo").on("change", function () {
                        if (this.files && this.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('#logotipo').attr('src', e.target.result);
                            };
                            reader.readAsDataURL(this.files[0]);
                        }
                    });
                });
            </script>
        </div>                                 
    </div>                                 
</div>  