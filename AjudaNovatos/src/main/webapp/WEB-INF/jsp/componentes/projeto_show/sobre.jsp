
<%-- 
    Document   : sobre
    Created on : 01/06/2015, 09:02:19
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="/AjudaNovatos/js/highcharts.js"></script>
<script src="/AjudaNovatos/js/exporting.js"></script>

<div style="font-size: 20px; margin-bottom: 40px" class="sub-leader text-light align-justify">
    <div class="grid">

        <div class="row cells2">

            <div class="cell">
                <p>
                    <c:out value="${projeto.description}"/>
                </p>
                <h4 class="text-light">Total de Linhas de Código do Projeto <span class="text-bold fg-lightBlue">${projeto.total_code_lines}</span> </h4>
                <h4 class="text-light">Total de Commits <span class="text-bold fg-lightBlue">${projeto.total_commit_count}</span></h4>
                <h4 class="text-light">Número de participantes no projeto <span class="fg-lightBlue text-bold">${projeto.total_contributor_count}</span></h4>
            </div>

            <div class="cell">
                <c:if test="${projeto.linguagens==null}">
                    <p>
                        <span class="text-bold">${t["projeto.linguagem"]}</span>
                        <span class="fg-lightBlue"><c:out value="${projeto.linguagens.toString().replace('[','').replace(']','')}"/></span>
                    </p>
                </c:if>

                <div class="grid">
                    <div class="row cells2">
                        <div class="cell" style="width: 30%;text-align: right">
                            <span class="text-bold">${t["projeto.pagina"]} </span>
                        </div>
                        <div class="cell">
                            <a href="http://<c:out value="${projeto.homepage_url}"/>" target="_blank"> ${projeto.homepage_url}</a>
                        </div>
                    </div>
                    <c:if test="${projeto.links.size()>0}">
                        <div class="row cells2">
                            <div class="cell" style="width: 30%;text-align: right"><h4 class="title text-bold">Links:</h4></div>
                            <div class="cell">
                                <c:forEach var="link" items="${projeto.links}">
                                    <p>
                                        <span class="mif-link"></span> <a href="${link.url}" target="_blank">${link.title}</a>
                                    </p>
                                </c:forEach> 
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="grid">
    <div class="row cells2">
        <div class="cell">            
            <div id="linguagens_grafico" class="full-size" style="float: left;" style="width: 200px"></div>
        </div>
        <div class="cell">  
            <div id="codigo"></div>
        </div>
    </div>
</div>

<div class="row">
    <h2>Comunidade</h2>
    <h4>Contribuintes</h4>
    <div class="listview set-border padding10 default list-type-listing" data-role="listview">
        <c:forEach var="contribuinte" items="${projeto.contribuintes}">
            <div class="list" onclick="exibirUsuario(${contribuinte.id});">
                <img src="/AjudaNovatos/images/projeto/contribunte.gif" class="list-icon">
                <span class="list-title margin5"> ${contribuinte.contributor_name}</span>
            </div>
        </c:forEach>
    </div>
    <h4>Contribuintes por mes</h4>
    <div id="contribuintes" class="set-border"></div>
</div>

<div class="row">
    <h2>Atividade do Projeto</h2>
    <h4>Commits por mes</h4>
    <div id="commits"></div>
</div>

<div data-role="dialog" class="padding20" data-width="500px" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" id="dialog_usuario" style="display: none;font-size: 20px">
    <h1 id="contribuinte_nome"></h1>
    <p><span class="text-bold">Linguagem Principal: </span><span id="linguagem_principal"> </span></p>
    <p><span class="text-bold">Total de Commits: </span><span id="total_commits"></span></p>
    <p><span class="text-bold">Man Months: </span><span id="man_months"></span></p>
    <p><span class="text-bold">Primeiro Commit: </span><span id="primeiro_commit"></span></p>
    <p><span class="text-bold">Ultimo Commit: </span><span id="ultimo_commit"></span></p>
</div>

<script type="text/javascript">
    $(function () {
        /* $('#linguagens_grafico').highcharts({
         chart: {plotBackgroundColor: null, plotBorderWidth: null, plotShadow: false},
         title: {text: 'Linguagens do Projeto'},
         tooltip: {pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>', crosshairs: true, shared: true},
         plotOptions: {pie: {allowPointSelect: true, cursor: 'pointer', dataLabels: {enabled: false}, showInLegend: true}
         }, series: [{type: 'pie', name: 'Percentage', data: [{projeto.getLinguagensArray()}]}]
         });*/

        $('#linguagens_grafico').highcharts({
            chart: {type: 'column'},
            title: {text: 'Linguagens do Projeto'},
            xAxis: {type: 'category'},
            yAxis: {
                min: 0,
                title: {text: 'Percentual (%)'}
            },
            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
            },
            plotOptions: {
                series: {borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.1f}%'
                    }
                }
            },
            series: [{
                    name: 'Linguagens',
                    colorByPoint: true,
                    data: [${projeto.getLinguagensArray()}]
                }]
        });

        $('#contribuintes').highcharts({
            title: {text: ''},
            xAxis: {type: 'datetime'},
            tooltip: {crosshairs: true, shared: true},
            yAxis: {title: {text: ''}},
            legend: {enabled: true},
            series: [{name: 'contribuintes', data: [${projeto.dadosContribuintesMensais()}]}]
        });

        $('#commits').highcharts({
            title: {text: ''},
            xAxis: {type: 'datetime', pointInterval: 24 * 3600 * 1000},
            yAxis: {title: {text: ''}},
            tooltip: {crosshairs: true, shared: true},
            legend: {enabled: true},
            plotOptions: {spline: {marker: {radius: 4, lineColor: '#666666', lineWidth: 1}}},
            series: [{name: 'commis', pointStart: Date.UTC(2003, 0), pointInterval: 12 * 30 * 3600 * 1000, data: [${projeto.dadosCommitsMensais()}]}]
        });

        $('#codigo').highcharts({
            chart: {type: 'line'},
            title: {text: 'Linhas de Código'},
            xAxis: {type: 'datetime'},
            yAxis: {title: {text: ''}},
            tooltip: {crosshairs: true, shared: true},
            plotOptions: {spline: {marker: {radius: 4, lineColor: '#666666', lineWidth: 1}}},
            series: [{
                    name: 'Codigo',
                    data: [${projeto.getLinhasAdicionadas()}]
                }, {
                    name: 'Comentarios',
                    data: [${projeto.getComentariosAdicionados()}]
                }, {
                    name: 'Linhas em Branco',
                    data: [${projeto.getLinhasEmBranco()}]
                }
            ]
        });
    });

    function exibirUsuario(id) {
        $.ajax({
            type: 'get',
            url: '/AjudaNovatos/dadosUsuario.json?id=' + id
        }).done(function (data) {
            var dialog = $("#dialog_usuario");
            //limpar
            $(dialog).find("#linguagem_principal").text("");
            $(dialog).find("#total_commits").text("");
            $(dialog).find("#contribuinte_nome").text("");
            $(dialog).find("#man_months").text("");
            $(dialog).find("#primeiro_commit").text("");
            $(dialog).find("#ultimo_commit").text("");

            //setar valores
            $(dialog).find("#linguagem_principal").append(data.primary_language_nice_name);
            $(dialog).find("#total_commits").append(data.commits);
            $(dialog).find("#contribuinte_nome").append(data.contributor_name);
            $(dialog).find("#man_months").append(data.man_months);
            $(dialog).find("#primeiro_commit").append(data.first_commit_time);
            $(dialog).find("#ultimo_commit").append(data.last_commit_time);

            showDialog("#dialog_usuario");
        });
    }

</script>
