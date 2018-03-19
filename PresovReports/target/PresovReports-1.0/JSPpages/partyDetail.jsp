<%-- 
    Document   : contractDetail
    Created on : Mar 18, 2018, 7:05:08 PM
    Author     : sprlajur
--%>

<%@page import="constants.UrlParameters"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="constants.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Zmluva</title>
    </head>
    <body>
        <div id="top_menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_CONTRACTS_URL%>">Zmluvy</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_GRANTS_URL%>">Dotácie</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_INVOICES_URL%>">Faktúry</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_ORDERS_URL%>">Objednávky</a></li>
            </ul>
        </div>
        <% RPOLegalPerson person = (RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON);%>
        <h1>Detail právnickej osoby</h1>
        <ul>
            <li><strong>ID v registre právnických osôb: </strong> <span><%= person.getRpo_id()%></span></li>
            <li><strong>IČO: </strong> <span><%=(String) request.getParameter(UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getParameter())%></span></li>
            <li><strong>Meno: </strong> <span><%= person.getName()%></span></li>
            <li><strong>Adresa: </strong> <span><%= person.getFormatted_address()%></span></li>
            <li><strong>Dátum založenia: </strong> <span><%= person.getEstablished_on().format(DateTimeFormatter.ofPattern("dd.MM.yyyy"))%></span></li>
            <!--<li><strong>Miesto registrácie: </strong> <span><%= person.getRegistration_office()%></span></li>-->
            <li><strong>Registračné čislo: </strong> <span><%= person.getRegistration_nr()%></span></li>
                <% LocalDate terminated_on = person.getTerminated_on();
                    if (terminated_on != null) {%>
            <li><strong>Dátum ukončenia činnosti: </strong> <span><%= terminated_on.format(DateTimeFormatter.ofPattern("dd.MM.yyyy"))%></span></li>
                <% }%>
            <li><span> <a href="https://finstat.sk/<%=(String) request.getParameter(UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getParameter())%>" target="_blank">finstat.sk</a></span></li>
        </ul>
    </body>
</html>
