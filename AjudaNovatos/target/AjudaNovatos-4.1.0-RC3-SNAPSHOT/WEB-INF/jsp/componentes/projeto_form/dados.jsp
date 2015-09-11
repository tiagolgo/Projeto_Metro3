<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" value="${projeto.medium_logo_url}" name="projeto.medium_logo_url"/>
<input type="hidden" value="${projeto.small_logo_url}" name="projeto.small_logo_url"/>
<input type="hidden" value="${projeto.html_url}" name="projeto.html_url"/>
<input type="hidden" value="${projeto.download_url}" name="projeto.download_url"/>
<input type="hidden" value="${projeto.homepage_url}" name="projeto.homepage_url"/>

<div class="grid">
    <div class="row cells2">
        <div class="cell bg-white">
            <div class="row">
                <label class="text-bold">Nome:</label>
                <div class="input-control text full-size" data-role="input">
                    <input id="dados-nome" name="projeto.name" type="text" placeholder="Nome do projeto" value="${projeto.name}">
                    <button class="button helper-button clear"><span class="mif-cross"></span></button>
                </div>                                 
            </div> 
            <!--
    <div class="row">
        <label class="text-bold">Página do Projeto:</label>
        <div class="input-control text full-size" data-role="input">
            <input id="dados-site" name="projeto.homepage_url" type="text" placeholder="Site do projeto" value="{projeto.homepage_url}">
            <button class="button helper-button clear"><span class="mif-cross"></span></button>
        </div>
    </div>
            -->
            <div class="row">
                <label class="text-bold">Data de criação:</label>
                <div class="input-control text full-size">
                    <input id="dados-site" name="projeto.created_at" type="text" value="${projeto.created_at}">
                </div>        
            </div>  
            <!--
        <div class="row">
            <label class="text-bold">Página de download:</label>
            <div class="input-control text full-size" data-role="input">
                <input id="dados-site" name="projeto.download_url" type="text" value="{projeto.download_url}">
                <button class="button helper-button clear"><span class="mif-cross"></span></button>
            </div>          
        </div>  
            -->
            <!--
        <div class="grid">
            <label class="text-bold">Repositório:</label>
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
        </div> 
            -->

            <div class="row">
                <label class="text-bold">Linguagem:</label>
                <div class="input-control select full-size no-margin" data-role="input">
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
                <table class="table striped hovered no-margin" id="tab_linguagem">
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
                                    <a class='button link mini-button fg-red no-margin no-padding' onclick="removeObjetos(${lang.id},this, '/AjudaNovatos/removeLinguagem');">Remover</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!--
            LINKS DO PROJETO
            -->
            <div class="row">
                <label class="text-bold">Links:</label>
                <div>
                    <div class="input-control text full-size" data-role="input">
                        <input type="text" id="novo-link" placeholder="Novo link"/>
                        <button class="button helper-button clear"><span class="mif-cross"></span></button>
                    </div> 
                    <select>
                        <option>Categoria</option>
                        <option value="forums">Forums</option>
                        <option value="documentation">Documentation</option>
                        <option value="mailing_lists">Mailing Lists</option>
                        <option value="community">Community</option>
                        <option value="issue_trackers">Issue Trackers</option>
                        <option value="download_page">Download Page</option>
                        <option value="download_page">Homepage</option>
                    </select>
                    <button id="set-categoria">Inserir</button>
                </div>

                <table class="table hovered striped no-margin" id="tab_links">
                    <tbody>
                        <c:forEach var="link" items="${projeto.links}" varStatus="cont">
                            <tr>
                                <td>
                                    <input type="hidden" value="${link.id}" name="projeto.links[${cont.count-1}].id"/>
                                    <input type="hidden" value="${link.title}" name="projeto.links[${cont.count-1}].title"/>
                                    <input type="hidden" value="${link.url}" name="projeto.links[${cont.count-1}].url"/>
                                    ${link.url}                                                               
                                </td>
                                <td>
                                    <a class='button link mini-button fg-red no-padding no-margin' onclick="removeObjetos(${link.id},this, '/AjudaNovatos/removeLink');">Remover</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- 
            LICENÇAS DO PROJETO
            -->
            <c:if test="${projeto.licencas.size()>0}">
                <div class="row">
                    <label class="text-bold">Licencas:</label>
                    <c:forEach var="licenca" items="${projeto.licencas}">
                        <p>${licenca.name}</p>  
                    </c:forEach>
                </div>
            </c:if>
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
                    <img width="40%" src="${projeto.medium_logo_url eq null?'/AjudaNovatos/images/logo/default.jpg':projeto.medium_logo_url}" id="logotipo"/>
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

                    $("#set-categoria").on("click", function (event) {
                        event.preventDefault();
                        var linhas = $("#tab_links tbody tr").length;//contar antes de inserir nova linha
                        var div = $(this).closest("div");
                        var link = $(div).find("#novo-link").val();
                        var categoria = $(div).find("select").val();

                        var inserir = true;
                        if (link === "") {
                            alert("Informe o link!");
                        } else {
                            $("#tab_links tbody tr td:first-child").each(function () {
                                if (link === $(this).text()) {
                                    alert("Link já inserido!");
                                    inserir = false;
                                }
                            });
                            if (inserir) {
                                $("#tab_links tbody").append("<tr><td><input type='hidden' value='" + link + "' name='projeto.links[" + linhas + "].url'/><input type='hidden' value='" + categoria + "' name='projeto.links[" + linhas + "].title'/>" + link + "</td><td style='text-align:right'><button class='button link' onclick='removeObjetos(this,null);'>Remover</button></td></tr>");
                            }
                        }
                    });

                    // ADICIONA NOVA LINGUAGEM AO PROJETO
                    $("#add_linguagem").on("click", function () {
                        var linhas = $("#tab_linguagem tbody tr").length;
                        var lang = $("#lang").val();
                        var inserir = true;

                        if (lang === "") {
                            alert("Selecione uma linguagem!");
                        } else {
                            $("#tab_linguagem tbody tr td:first-child").each(function () {
                                var celula = $(this).text();
                                if (lang === celula) {
                                    alert("Linguagem já adicionada!");
                                    inserir = false;
                                }
                            });
                            if (inserir) {
                                $("#tab_linguagem").append("<tr class='no-padding'><td><input type='hidden' name='projeto.linguagens[" + linhas + "].texto' value='" + lang + "'/>" + lang + "</td><td style='text-align:right'><a href='#' class='link fg-red' onclick='removeObjetos(this, \"/AjudaNovatos/removeLinguagem\");'>Remover</a></td></tr>");
                            }
                        }
                    });
                });
            </script>
        </div>                                 
    </div>                                 
</div>  