<%-- 
    Document   : economicActivityEntries
    Created on : Apr 29, 2018, 3:36:52 PM
    Author     : sprlajur
--%>

<%@page import="constants.RequestAttributeNames"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page import="rpo.RPOOneStringEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% List<RPOOneStringEntry> economicActivityEntries = ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getEconomicActivityEntries();
            boolean isAnyEntryFinished = economicActivityEntries.stream().filter(ea -> ea.getEffectiveTo() != null).findAny().isPresent();
        %>

        <table class="companytable">
            <caption>Predmety podnikania</caption>
            <tr>
                <th>Názov</th>
                <th>Platný od</th>
                    <c:if test="${isAnyEntryFinished}">
                    <th>Platný do</th>
                    </c:if>
            </tr>
            <%
                if (economicActivityEntries != null) {
                    for (int i = 0; i < economicActivityEntries.size(); i++) {
                        RPOOneStringEntry de = economicActivityEntries.get(i);
            %>
            <tr>
                <td><%= TableDataFormatter.dataOrEmptyString(de.getBody())%></td>
                <td><%= TableDataFormatter.dateFormatter(de.getEffectiveFrom())%></td>
                <c:if test="${isAnyEntryFinished}">
                    <td><%= TableDataFormatter.dateFormatter(de.getEffectiveTo())%></td>
                </c:if>
            </tr>             
            <% }
                }
            %>
        </table>
    </body>
</html>
