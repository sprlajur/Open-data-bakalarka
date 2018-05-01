<%-- 
    Document   : legalStatusEntries
    Created on : Apr 29, 2018, 3:36:52 PM
    Author     : sprlajur
--%>

<%@page import="constants.RequestAttributeNames"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page import="rpo.RPOOneStringEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Právne stavy</h2>
        <%
            List<RPOOneStringEntry> legalStatusEntries = ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getLegalStatusEntries();
            if (legalStatusEntries != null) {
                for (int i = 0; i < legalStatusEntries.size(); i++) {
                    RPOOneStringEntry de = legalStatusEntries.get(i);
        %>
    <li><strong>Názov: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getBody())%></span></li>
    <li><strong>Platný od: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveFrom())%></span></li>
    <li><strong>Platný do: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveTo())%></span></li>
    <br>            
    <% }
        }
    %>
</body>
</html>
