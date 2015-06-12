<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" value="${projeto.medium_logo_url}" name="projeto.medium_logo_url"/>
<input type="hidden" value="${projeto.small_logo_url}" name="projeto.small_logo_url"/>
<input type="hidden" value="${projeto.html_url}" name="projeto.html_url"/>
<input type="hidden" value="${projeto.id_estatistica_open_hub}" name="projeto.id_estatistica_open_hub"/>
<div class="grid">
    <div class="row cells2">
        <div class="cell">
            <div class="row">
                <label class="text-bold">Nome:</label>
                <div class="input-control text full-size" data-role="input">
                    <input id="dados-nome" name="projeto.name" type="text" placeholder="Nome do projeto" value="${projeto.name}">
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>                                 
            </div>   
            <div class="row">
                <label class="text-bold">Página do Projeto:</label>
                <div class="input-control text full-size" data-role="input">
                    <input id="dados-site" name="projeto.homepage_url" type="text" placeholder="Site do projeto" value="${projeto.homepage_url}">
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>
            </div>
            <div class="row">
                <label class="text-bold">Data de criação:</label>
                <div class="input-control text full-size">
                    <input id="dados-site" name="projeto.created_at" type="text" value="${projeto.created_at}">
                </div>        
            </div>          
            <div class="row">
                <label class="text-bold">Página de download:</label>
                <div class="input-control text full-size" data-role="input">
                    <input id="dados-site" name="projeto.download_url" type="text" value="${projeto.download_url}">
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>          
            </div>   
            <div class="grid">
                <label class="text-bold">Repositório:</label>
                <!--
                <div class="row cells2">
                    <div class="cell">
                        <div class="input-control select" data-role="input">
                            <select id="repos" name="projeto.repositorio.tipo" style="width: 115px">
                                <option>-</option>
                                <option value="git" {projeto.repositorio.tipo eq 'git' ? 'selected':''}>Git</option>
                                <option value="subversion" {projeto.repositorio.tipo eq 'subversion' ? 'selected':''}>Subversion</option>
                                <option value="cvs" {projeto.repositorio.tipo eq 'cvs' ? 'selected':''}>CVS</option>
                                <option value="mercurial" {projeto.repositorio.tipo eq 'mercurial' ? 'selected':''}>Mercurial</option>
                                <option value="bazaar" {projeto.repositorio.tipo eq 'bazaar' ? 'selected':''}>Bazaar</option>
                                <option value="outro" {projeto.repositorio.tipo eq 'outro' ? 'selected':''}>Outro</option>
                            </select>
                        </div>
                    </div>
                    <div class="cell colspan3">
                        <div class="input-control text full-size" data-role="input">
                            <input id="dados-codigoFonte" name="projeto.repositorio.link" placeholder="Endereco do repositório" value="{projeto.repositorio.link}" disabled/>
                            <button class="button helper-button clear"><span class="mif-cross"></span></button>
                        </div> 
                    </div> 
                </div> 
                -->
            </div> 

            <div class="row">
                <label class="text-bold">Linguagem:</label>
                <div class="panel">
                    <div class="panel-header bg-lightBlue padding10">
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
                    </div>
                    <div class="panel-content" style="border: 1px solid #4390df">
                        <table class="table hovered no-margin" id="tab_linguagem">
                            <tbody>
                                <c:forEach var="lang" items="${projeto.linguagens}" varStatus="cont">
                                    <tr style="height: 15px">
                                        <td>
                                            <input type="hidden" value="${lang.id}" name="projeto.linguagens[${cont.count-1}].id"/>
                                            <input type="hidden" value="${lang.texto}" name="projeto.linguagens[${cont.count-1}].texto"/>
                                            <input type="hidden" value="${lang.percentage}" name="projeto.linguagens[${cont.count-1}].percentage"/>
                                            ${lang.texto}                                                               
                                        </td>
                                        <td>
                                            <button value='${lang.id}' class='button link mini-button fg-red' onclick="removeObjetos('dfsd', '/AjudaNovatos/removeLinguagem');">Remover</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--
            LINKS DO PROJETO
            -->
            <div class="row">
                <label class="text-bold">Links</label>
                <div class="panel">
                    <div class="panel-header bg-lightBlue padding10">
                        <form>
                            <div class="input-control text full-size" data-role="input">
                                <input id="novo-link" placeholder="Novo link"/>
                                <button class="button helper-button clear"><span class="mif-cross"></span></button>
                            </div> 
                            <div class="input-control select" data-role="input">
                                <select id="catgoria-link">
                                    <option>-</option>
                                    <option value="git">Forums</option>
                                    <option value="subversion">Documentation</option>
                                    <option value="cvs">Mailing Lists</option>
                                    <option value="mercurial">Community</option>
                                    <option value="bazaar">Issue Trackers</option>
                                </select>
                            </div>
                            <button value='${link.id}' class='button fg-red'>Inserir</button>
                        </form>
                    </div>
                    <div class="panel-content" style="border: 1px solid #4390df">
                        <table class="table hovered  no-margin" id="tab_linguagem">
                            <tbody>
                                <c:forEach var="link" items="${projeto.links}" varStatus="cont">
                                    <tr style="height: 15px">
                                        <td>
                                            <input type="hidden" value="${link.category}" name="projeto.links[${cont.count-1}].category"/>
                                            ${link.category}
                                        </td>
                                        <td>
                                            <input type="hidden" value="${link.id}" name="projeto.links[${cont.count-1}].id"/>
                                            <input type="hidden" value="${link.title}" name="projeto.links[${cont.count-1}].title"/>
                                            <input type="hidden" value="${link.url}" name="projeto.links[${cont.count-1}].url"/>
                                            ${link.url}                                                               
                                        </td>
                                        <td>
                                            <button value='${link.id}' class='button link mini-button fg-red'>Remover</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <label class="text-bold">Licencas</label>
                <c:forEach var="licenca" items="${projeto.licencas}">
                    <p>${licenca.name}</p>  
                </c:forEach>
            </div>
        </div>

        <div class="cell">
            <div class="row">
                <label class="text-bold">Descrição do projeto</label>
                <div class="input-control textarea full-size" data-role="input-control">
                    <textarea id="dados-descricao" name="projeto.description" style="height: 360px">${projeto.description}</textarea>
                </div> 
            </div> 
            <div class="row">
                <label class="text-bold">Logo do Projeto</label>
                <div class="span7 text-center" style="height: 250px;border: 1px solid lightgray;text-align: center">
                    <!-- <:choose>
                         c:when test="{projeto.medium_logo_url eq null}">
                             <img width="40%" src="c:url value="/images/logo/"/>'default.jpg'" id="logotipo"/>
                    -->
                    <img width="40%" src="${projeto.medium_logo_url eq null?'AjudaNovatos/images/logo/default.jpg':projeto.medium_logo_url}" id="logotipo"/>
                    <!--/c:when>
                    c:otherwise>
                        <img width="40%" src="{projeto.medium_logo_url}"/>
                    /c:otherwise>
                /c:choose>-->
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