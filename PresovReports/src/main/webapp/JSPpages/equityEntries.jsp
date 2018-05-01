<%-- 
    Document   : equityEntries
    Created on : Apr 29, 2018, 3:36:52 PM
    Author     : sprlajur
--%>

<%@page import="constants.RequestAttributeNames"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page import="rpo.RPOEquityEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Základné imania</h2>
        <%
            List<RPOEquityEntry> equityEntries = ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getEquityEntries();
            if (equityEntries != null) {
                for (int i = 0; i < equityEntries.size(); i++) {
                    RPOEquityEntry de = equityEntries.get(i);
        %>
<!--    <li><strong>Výška podielu: </strong> <span><%= TableDataFormatter.priceFormatter(de.getInvestmentAmount(), de.getInvestmentCurrency())%></span></li>
    <li><strong>Splatená výška podielu: </strong> <span><%= TableDataFormatter.priceFormatter(de.getPaidAmount(), de.getPaidCurrency())%></span></li>-->
    <li><strong>Schválená výška podielu: </strong> <span><%= TableDataFormatter.priceFormatter(de.getApprovedAmount(), de.getApprovedCurrency())%></span></li>
    <li><strong>Platné od: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveFrom())%></span></li>
    <li><strong>Platné do: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveTo())%></span></li>
    <br>            
    <% }
        }
    %>
</body>
</html>