<%-- 
    Document   : shareEntries
    Created on : Apr 29, 2018, 3:36:52 PM
    Author     : sprlajur
--%>

<%@page import="constants.RequestAttributeNames"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page import="rpo.RPOShareEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Akcie</h2>
        <%
            List<RPOShareEntry> shareEntries = ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getShareEntries();
            if (shareEntries != null) {
                for (int i = 0; i < shareEntries.size(); i++) {
                    RPOShareEntry de = shareEntries.get(i);
        %>
    <li><strong>Cena akcie: </strong> <span><%= TableDataFormatter.priceFormatter(de.getPrice(), de.getCurrency())%></span></li>
    <li><strong>Počet akcií: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getAmount())%></span></li>
    <li><strong>Popis prevoditeľnosti akcií: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getTransferDescription())%></span></li>
    <li><strong>Popis prevoditeľnosti akcií: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getTransferDescription())%></span></li>
    <li><strong>Podoba akcie: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getType())%></span></li>
    <li><strong>Forma akcie: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getForm())%></span></li>
    <li><strong>Platné od: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveFrom())%></span></li>
    <li><strong>Platné do: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveTo())%></span></li>
    <br>            
    <% }
        }
    %>
</body>
</html>
