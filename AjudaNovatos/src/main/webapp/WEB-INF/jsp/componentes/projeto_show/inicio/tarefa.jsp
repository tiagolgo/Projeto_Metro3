<%-- 
    Document   : tarefa
    Created on : 01/06/2015, 09:22:12
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3 class="fg-darkBlue">${t["tarefa.titulo"]} <span class="fg-green rating_nota"></span></h3>
<div class="row">
    <p>${projeto.comoIniciar.tarefaFacil.texto}</p>
</div>
<!--feed area -->
<div class="grid">
    <c:set var="total_feeds" value="${projeto.comoIniciar.tarefaFacil.feeds.size()}"/>
    <c:forEach var="feed" items="${projeto.comoIniciar.tarefaFacil.feeds}" varStatus="fds">
        <c:if test="${(fds.count-1)==0 || (fds.count-1)%2==0}">
            <div class="row cells2">
            </c:if>
            <div class="cell">
                <script type="text/javascript">
                    document.write('\x3Cscript type="text/javascript" src="' + ('https:' === document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');</script>
                <script type="text/javascript">
                    (function () {
                        var params = {
                            rssmikle_url: "<c:out value="${feed.url}"/>",
                            rssmikle_frame_width: "500",
                            rssmikle_frame_height: "500",
                            frame_height_by_article: "0",
                            rssmikle_target: "_blank",
                            rssmikle_font: "Arial, Helvetica, sans-serif",
                            rssmikle_font_size: "12",
                            rssmikle_border: "off",
                            responsive: "off",
                            rssmikle_css_url: "",
                            text_align: "left",
                            text_align2: "left",
                            corner: "off",
                            scrollbar: "on",
                            autoscroll: "on",
                            scrolldirection: "up",
                            scrollstep: "5",
                            mcspeed: "20",
                            sort: "Off",
                            rssmikle_title: "on",
                            rssmikle_title_sentence: "<c:out value="${feed.titulo}"/>",
                            rssmikle_title_link: "",
                            rssmikle_title_bgcolor: "#0066FF",
                            rssmikle_title_color: "#FFFFFF",
                            rssmikle_title_bgimage: "",
                            rssmikle_item_bgcolor: "#FFFFFF",
                            rssmikle_item_bgimage: "",
                            rssmikle_item_title_length: "55",
                            rssmikle_item_title_color: "#0066FF",
                            rssmikle_item_border_bottom: "on",
                            rssmikle_item_description: "on",
                            item_link: "off",
                            rssmikle_item_description_length: "150",
                            rssmikle_item_description_color: "#666666",
                            rssmikle_item_date: "gl1",
                            rssmikle_timezone: "Etc/GMT",
                            datetime_format: "%b %e, %Y %l:%M:%S %p",
                            item_description_style: "text",
                            item_thumbnail: "full",
                            item_thumbnail_selection: "auto",
                            article_num: "15",
                            rssmikle_item_podcast: "off",
                            keyword_inc: "",
                            keyword_exc: ""};
                        feedwind_show_widget_iframe(params);
                    })();
                </script>
                <div style="font-size:10px; text-align:center; width:600px;">
                    <a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;">RSS Feed Widget</a>
                    <!--Please display the above link in your web page according to Terms of Service.-->
                </div><!-- end feedwind code -->
            </div>
            <c:if test="${(fds.count-1)%2!=0|| fds.count==total_feeds}">
            </div>
        </c:if>
    </c:forEach>
</div>

<!-- Área de Comentários -->
<div class="row coment-area" style="margin-top: 100px">
    <h5 class="padding10" style="border-bottom: 2px solid lightgray">Comentarios
        <c:if test="${userLogado.logado==true}">
            <span class="element place-right"><a href="#" onclick="exibirFormComentario(${projeto.comoIniciar.tarefaFacil.id}, 'tarefa', this);"><i class="icon-plus"> </i> Novo</a></span>
        </c:if>
    </h5>
    <div class="listview-outlook" data-role="listview" id='comentarios'>
        <c:forEach var="comentario" items="${projeto.comoIniciar.tarefaFacil.comentarios}">
            <a class="list" href="#">
                <div class="list-content">
                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                    <span class="list-remark">${comentario.texto}</span>
                </div>
            </a>
        </c:forEach>
    </div>
</div>
