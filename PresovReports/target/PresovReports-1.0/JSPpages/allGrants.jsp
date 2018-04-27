<%-- 
    Document   : allGrants
    Created on : Apr 25, 2018, 5:29:45 PM
    Author     : sprlajur
--%>

<%@page import="constants.UrlParameters"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="constants.RequestAttributeNames"%>
<%@page import="entity.GrantEntity"%>
<%@page import="java.util.List"%>
<%@page import="constants.Urls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Dotácie mesta</title>
    </head>
    <body>
        <div id="top_menu">
            <ul>
                <li><a href= "<%= Urls.ALL_CONTRACTS_URL%>">Zmluvy</a></li>
                <li><a href="<%= Urls.ALL_GRANTS_URL%>">Dotácie</a></li>
                <li><a href="<%= Urls.ALL_INVOICES_URL%>">Faktúry</a></li>
                <li><a href="<%= Urls.ALL_ORDERS_URL%>">Objednávky</a></li>
            </ul>
        </div>
        <%! List<GrantEntity> grants;%>
        <table style="width:100%">
            <tr style=>      
                <th>Žiadateľ</th>
                <th>Akcia</th>
                <th>Rok dotácie</th>
                <th>Stav vybavenia</th>
                <th>Schválené prostriedky</th>
            </tr>
            <%
                grants = (List<GrantEntity>) request.getAttribute(RequestAttributeNames.ALL_GRANTS);

                for (int i = 0; i < grants.size(); i++) {
                    GrantEntity grant = grants.get(i);
            %>
            <tr>      
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + grant.getApplicantIco()%>"><%= grant.getApplicant()%></a> </td>
                <td><%=TableDataFormatter.formatTextData(grant.getAction())%></td>
                <td><%=TableDataFormatter.dataOrEmptyString(grant.getGrantYear())%></td>
                <td><%=TableDataFormatter.dataOrEmptyString(grant.getStatus())%></td> 
                <td><%=TableDataFormatter.priceFormatter(grant.getApprovedGrant(), grant.getCurrency())%></td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
