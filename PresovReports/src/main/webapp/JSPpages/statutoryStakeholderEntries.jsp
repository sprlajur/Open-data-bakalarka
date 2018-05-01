<%-- 
    Document   : entries
    Created on : Apr 29, 2018, 3:36:52 PM
    Author     : sprlajur
--%>

<%@page import="constants.UrlParameters"%>
<%@page import="constants.Urls"%>
<%@page import="constants.Urls"%>
<%@page import="constants.RequestAttributeNames"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page import="rpo.RPOStatutoryStakeholderEntry"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%  Boolean isStatutory = "statutory".equals(request.getParameter("object"));
            String header = isStatutory ? "Štatutárne orgány" : "Zainteresované osoby";
        %>
        <h2><%=header%></h2>
        <%
            List<RPOStatutoryStakeholderEntry> entries = isStatutory ? ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getStatutoryEntries() : ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getStakeholderEntries();
            if (entries != null) {
                for (int i = 0; i < entries.size(); i++) {
                    RPOStatutoryStakeholderEntry de = entries.get(i);
        %>
        
    <c:choose>
        <c:when test="${de.getIco() ne null}">
            <li><strong>Právnická osoba: </strong> <span><a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + de.getIco()%>"><%= de.getIco()%></a></span></li>
        </c:when>    
        <c:otherwise>
            <li><strong>Meno: </strong> <span> <%= de.getFormattedName()%></span></li>
            <c:choose>
                <c:when test="${de.getFormattedAddress() ne null}">
                    <li><strong>Adresa: </strong> <span> <%= de.getFormattedAddress()%></span></li>
                </c:when>    
                <c:otherwise>
                    <li><strong>Ulica: </strong> <span> <%= de.getStreet()%></span></li>
                    <li><strong>Číslo domu: </strong> <span> <%= de.getBuildingNr()%></span></li>
                    <li><strong>Obec: </strong> <span> <%= de.getMunicipality()%></span></li>
                    <li><strong>Krajina: </strong> <span> <%= de.getCountry()%></span></li>
                </c:otherwise>
            </c:choose>         
        </c:otherwise>
    </c:choose>
                    <li><strong>Typ: </strong> <span> <%= de.getType()%></span></li>
                    <br>
        <% }
            }
        %>
</body>
</html>
