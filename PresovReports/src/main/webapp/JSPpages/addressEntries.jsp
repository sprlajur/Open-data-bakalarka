<%-- 
    Document   : addressEntries
    Created on : Apr 29, 2018, 3:36:52 PM
    Author     : sprlajur
--%>

<%@page import="rpo.RPOLegalPerson"%>
<%@page import="constants.RequestAttributeNames"%>
<%@page import="constants.RequestAttributeNames"%>
<%@page import="rpo.RPOAddressEntry"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>Adresy</h2>
        <%
            List<RPOAddressEntry> addressEntries = ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getAddressEntries();
            if (addressEntries != null) {
                for (int i = 0; i < addressEntries.size(); i++) {
                    RPOAddressEntry de = addressEntries.get(i);
        %>
    <li><strong>Ulica: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getStreet())%></span></li>
    <li><strong>Číslo domu: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getBuilding_nr())%></span></li>
    <li><strong>PSČ: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getPostalCode())%></span></li>
    <li><strong>Obec: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getMunicipality())%></span></li>
    <li><strong>Krajina: </strong> <span><%= TableDataFormatter.dataOrEmptyString(de.getCountry())%></span></li>
    <li><strong>Platná od: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveFrom())%></span></li>
    <li><strong>Platná do: </strong> <span><%= TableDataFormatter.dateFormatter(de.getEffectiveTo())%></span></li>
    <br>            
    <% }
        }
    %>
</body>
</html>
