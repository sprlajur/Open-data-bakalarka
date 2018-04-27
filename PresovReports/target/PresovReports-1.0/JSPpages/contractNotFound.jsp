<%-- 
    Document   : partyNotFound
    Created on : Mar 19, 2018, 8:51:49 PM
    Author     : sprlajur
--%>

<%@page import="constants.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Právnická osoba nenájdená</title>
    </head>
    <body>
        <div id="top_menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_CONTRACTS_URL%>">Zmluvy</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_GRANTS_URL%>">Dotácie</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_INVOICES_URL%>">Faktúry</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_ORDERS_URL%>">Objednávky</a></li>
            </ul>
        </div>
        <h3>Zmluva s ID <%=request.getParameter(UrlParameters.CONTRACT_DETAIL_ID_PARAMETER.getParameter())%> nebola najdená.</h3>
    </body>
</html>
