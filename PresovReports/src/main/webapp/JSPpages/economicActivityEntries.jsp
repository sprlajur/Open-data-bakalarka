<%-- 
    Document   : economicActivityEntries
    Created on : Apr 29, 2018, 3:36:52 PM
    Author     : sprlajur
--%>

<%@page import="constants.RequestAttributeNames"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page import="rpo.RPOEconomicActivityEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Predmety činností</h2>
        <%
            List<RPOEconomicActivityEntry> economicActivityEntries = ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getEconomicActivityEntries();
            if (economicActivityEntries != null) {
                for (int i = 0; i < economicActivityEntries.size(); i++) {
                    RPOEconomicActivityEntry de = economicActivityEntries.get(i);
        %>
    <li><strong>Popis: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getDescription())%></span></li>
<!--    <li><strong>Pozastavená od: </strong> <span><%= TableDataFormatter.dateFormatter(de.getSuspendedFrom())%></span></li>
    <li><strong>Pozastavená do: </strong> <span><%= TableDataFormatter.dateFormatter(de.getSuspendedTo())%></span></li>-->
    <li><strong>Platná od: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveFrom())%></span></li>
    <li><strong>Platná do: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveTo())%></span></li>
    <br>            
    <% }
        }
    %>
</body>
</html>
