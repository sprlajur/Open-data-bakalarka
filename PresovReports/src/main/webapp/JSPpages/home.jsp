<%-- 
    Document   : newjsp
    Created on : Mar 5, 2018, 9:15:37 PM
    Author     : sprlajur
--%>

<%@page import="constants.Urls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <!--<link rel="stylesheet" type="text/css" href="styles.css">-->
        <title>Prešov Open data</title>
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
    </body>
</html>
