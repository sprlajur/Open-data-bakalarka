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
            List<RPOStatutoryStakeholderEntry> entries = isStatutory ? ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getStatutoryEntries() : ((RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON)).getStakeholderEntries();
            boolean isAnyEntryFinished = entries.stream().filter(ea -> ea.getEffectiveTo() != null).findAny().isPresent();
        %>
        <table class="companytable">
            <caption><%=header%></caption>
            <tr>
                <th style="text-align: center">Meno</th>
                <th style="text-align: center">Adresa</th>
                <th style="text-align: center" style="text-align: center">Typ</th>
                <th style="text-align: center">Od</th>
                    <% if (isAnyEntryFinished) { %>
                <th style="text-align: center">Do</th>                
                    <% } %>
            </tr>
            <%
                if (entries != null) {
                    for (int i = 0; i < entries.size(); i++) {
                        RPOStatutoryStakeholderEntry de = entries.get(i);
            %>
            <tr>
                <td style="text-align: center">
                    <% if (de.getIco() != null || de.getFullName() != null) {%>
                    <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + TableDataFormatter.dataOrEmptyString(de.getIco())%>"><%=TableDataFormatter.dataOrEmptyString(de.getFullName())%></a>
                    <%} else {%>
                    <%= TableDataFormatter.dataOrEmptyString(de.getFormattedName())%>
                    <% }%>
                </td>
                <td style="text-align: center"><%= de.getFormattedAddress()%> </td>
                <td style="text-align: center"><%=TableDataFormatter.dataOrEmptyString(de.getType())%></td>
                <td style="text-align: center"><%= TableDataFormatter.dateFormatter(de.getEffectiveFrom())%></td>
                <% if (isAnyEntryFinished) {%>
                <td style="text-align: center"><%= TableDataFormatter.dateFormatter(de.getEffectiveTo())%></td>
                <% } %>
            </tr> 
            <% }
                }
            %>
        </table>
    </body>
</html>
