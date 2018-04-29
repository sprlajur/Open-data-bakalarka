<%-- 
    Document   : alternateNameEntries
    Created on : Apr 29, 2018, 3:36:52 PM
    Author     : sprlajur
--%>

<%@page import="constants.RequestAttributeNames"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page import="rpo.RPOAlternateNameEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Alternatívne mená</h2>
        <%
            List<RPOAlternateNameEntry> alternateNameEntries = ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getAlternateNameEntries();
            if (alternateNameEntries != null) {
                for (int i = 0; i < alternateNameEntries.size(); i++) {
                    RPOAlternateNameEntry de = alternateNameEntries.get(i);
        %>
    <li><strong>Meno: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getName())%></span></li>
    <li><strong>Platné od: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveFrom())%></span></li>
    <li><strong>Platné do: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveTo())%></span></li>
    <br>            
    <% }
        }
    %>
</body>
</html>
